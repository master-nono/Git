package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.text.*;

	public class Resources
	{
		public static var RESOURCE_TYPES:Array = ["Mineral", "Food", "Herbs"];

		public static var resourceValues:Object = null;

		public static var container:DisplayObjectContainer;
		public static var showing:Boolean = false;

		public static var allResources:Object = new Object();
		public static var curHex:String;
		public static var curTurn:int = 0;

		public function Resources() { }

		public static function show(container:DisplayObjectContainer, curHexInt:int):void {
			var i:int;

			if (resourceValues == null) {
				resourceValues = new Object();
				for (i = 0; i < RESOURCE_TYPES.length; i++) resourceValues[RESOURCE_TYPES[i]] = 0;
			}

			if (showing) hide();

			Resources.container = container;
			Resources.curHex = curHexInt.toString();

			var res:Resource;
			if (allResources[curHex] == null) {
				allResources[curHex] = [];
				for (i = 0; i < 3; i++) {
					{ /// Generate resources
						res = new Resource();
						res.type = RESOURCE_TYPES[Math.round(Math.random()*(RESOURCE_TYPES.length-1))];

						res.xPos = 0;
						res.yPos = 0;
						var tooClose:Boolean = true;
						while (tooClose) {
							tooClose = false;

							res.xPos = Math.random()*container.width;
							res.yPos = Math.random()*container.height;

							for (var otherResIter = 0; otherResIter < allResources[curHex].length; otherResIter++) {
								var otherRes:Resource = allResources[curHex][otherResIter];
								if (Point.distance(new Point(res.xPos, res.yPos), new Point(otherRes.xPos, otherRes.yPos)) < 200) {
									tooClose = true;
									break;
								}
							}
						}

						res.turnsToReEnable = Math.round(Math.random()*3 + 2);
						res.turnLastUsed = -res.turnsToReEnable;
						allResources[curHex].push(res);
					}
				}
			}

			for (i = 0; i < allResources[curHex].length; i++) {
				{ /// Show resource
					res = allResources[curHex][i];

					var spr:Sprite = new Sprite();
					spr.graphics.beginFill(0x0000FF, 1);
					spr.graphics.drawRect(0, 0, 100, 100);
					spr.x = res.xPos;
					spr.y = res.yPos;
					spr.addEventListener(MouseEvent.CLICK, resourceClicked);
					container.addChild(spr);

					var tf:TextField = new TextField();
					tf.mouseEnabled = false;
					spr.addChild(tf);

					res.sprite = spr;
					res.tf = tf;
				}
			}

			refreshResources();

			showing = true;
		}

		public static function hide():void {
			for (var i:int = 0; i < allResources[curHex].length; i++) {
				var res:Resource = allResources[curHex][i];
				res.sprite.removeEventListener(MouseEvent.CLICK, resourceClicked);
				container.removeChild(res.sprite);
			}
		}

		public static function refreshResources():void {
			for (var i:int = 0; i < allResources[curHex].length; i++) {
				var res:Resource = allResources[curHex][i];
				var turnsLeft:int = res.turnsToReEnable - (curTurn - res.turnLastUsed);
				res.enabled = turnsLeft <= 0;

				res.tf.text = "Get "+res.type;
				if (!res.enabled) res.tf.appendText("\n" + turnsLeft + " turn(s) till available");
				res.sprite.alpha = res.enabled ? 1 : 0.5;
			}
		}

		public static function resourceClicked(e:MouseEvent):void {
			var res:Resource = null;
			for (var i:int = 0; i < allResources[curHex].length; i++) {
				var resIter:Resource = allResources[curHex][i];
				if (e.target == resIter.sprite) {
					res = resIter;
					break;
				}
			}

			if (res == null || res.enabled == false) return;
			resourceValues[res.type]++;

			trace(res.type + " collected!");
			for (var prop:String in resourceValues) trace(prop+" => "+resourceValues[prop]);

			res.turnLastUsed = curTurn;
			refreshResources();

			//@todo Collection notification here
		}

		public static function turnPassed(turnsElapsed:int):void {
			curTurn += turnsElapsed;
			refreshResources();
		}

	}
}

class Resource
{
	public var tf:flash.text.TextField;
	public var sprite:flash.display.Sprite;
	public var xPos:Number;
	public var yPos:Number;
	public var type:String;

	public var turnsToReEnable:int;

	public var turnLastUsed:int;
	public var enabled:Boolean;
}
