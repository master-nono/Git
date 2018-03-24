package { 
	//import flash.media.SoundChannel;	
	//import flash.filters.GlowFilter;
	//import flash.utils.Timer;			
	//import flash.net.SharedObject;			
	//import flash.events.TimerEvent; 
	//import flash.filters.DropShadowFilter;	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.display.MovieClip;
	import flash.display.SimpleButton; 
	import flash.events.Event;
	import flash.media.Sound;
	import flash.geom.ColorTransform;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import fl.motion.AdjustColor; 
	import flash.filters.ColorMatrixFilter;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import flash.utils.*; 
	import flash.geom.Point;
	import flash.display.Stage;
	import flash.display.*;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.greensock.*; 
	import flash.media.Sound; 
	import flash.media.SoundChannel; 
	import flash.media.SoundMixer;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;

	public class Game extends MovieClip {

		public var thebattle:MovieClip;
		public var Menu_MC:MovieClip = new Menu();
		public var Menu_Gamestart_Btn:McButton = new McButton();
		public var Lv2_Map_Container_MC:MovieClip = new Lv2_Map_Container();
		public var UI_Board_Container_MC:MovieClip = new UI_Board_Container();
		public var UI_Popup_MC:MovieClip = new UI_Popup();
		public var displayText:String = "";
		public var Dialogue_Array:Array = new Array();
		public var Dialogue_Progress:Array = new Array();
		public var UI_App_Container_MC:MovieClip = new UI_App_Container();
		public var Circle_Cursor_MC = new Circle_Cursor();
		public var Story_Progress:Array = new Array();
		public var myTimer:Timer = new Timer(0015,999);
		public var UI_Trans_Container_MC:MovieClip = new UI_Trans_Container();
		public var Sex_Scene_MC:MovieClip = new Sex_Scene();
		public var MatedWith_Array:Array = new Array();
		public var MonstersInventory_Array:Array = new Array();
		public var FabricsInventory_Array:Array = new Array();
		public var AllAllySpecies_Array:Array = new Array();
		public var UI_ReturnMsg_MC:MovieClip = new UI_ReturnMsg();
		public var UI_Fabric_MC:MovieClip = new UI_Fabric();
		public var CardsContainer:Sprite = new Sprite();
		public var RoyalArmy_Array:Array = new Array();
		public var Cards_Array:Array = new Array();
		public var IconContainer:Sprite = new Sprite();
		public var overhead_MC:MovieClip = new overhead();
		public var UI_Diary_MC:MovieClip = new UI_Diary();
		public var CardsContainer2:Sprite = new Sprite();
		public var IconContainer2:Sprite = new Sprite();
		public var ArmyContainer:Sprite = new Sprite();
		public var TraitsContainer:Sprite = new Sprite();
		public var theMonUI:MovieClip;
		public var theMonUI2:MovieClip;
		public var AssignMon:Array = new Array();
		public var AllTerritories_Array:Array = new Array();
		public var RestTrans_MC:MovieClip = new RestTran();
		public var TE_Array:Array = new Array();
		public var WorldBtn:MovieClip = new Worldmapbtn();
		public var theMap:MovieClip;
		public var Choices_MC:MovieClip = new Choices();
		public var Lvup_MC:MovieClip = new Lvup();
		public var RPplus4_MC:MovieClip = new RPplus4();
		public var RPplus2_MC:MovieClip = new RPplus2();
		public var UI_Narrative_MC:MovieClip = new UI_Narrative();
		public var Direction_Array:Array = new Array();

		public var current_hex = 905;
		public var interval:uint = 0;
		public var story_or_ten = 0;
		public var start_ptx:uint = 0;
		public var start_pty:uint = 0;
		public var end_ptx:uint = 0;
		public var end_pty:uint = 0;
		public var hitormiss:uint = 0;
		public var sex_situation:uint = 0;
		public var sex_species:uint = 0;
		public var sex_background:uint = 0;
		public var pregnant_block = 0;
		public var pregnantwith = 0;
		public var pregnantturn = 0;
		public var thefeature = 0;
		public var temp_array = new Array();
		public var rounds = 100;
		public var total_turn = 0;//max 500
		public var current_turn = 5;
		public var page = 0;
		public var iconpage = 0;
		public var memberNo = 0;
		public var foundfood = 0;
		public var monname = "";
		public var amountintel = "";
		public var Memberindex = 0;

		public var gold:Number = 5;
		public var fabric:uint = 0;
		public var food:Number = 3;
		private var jungle:uint = 1;
		private var desert:uint = 2;
		private var volcano:uint = 3;
		private var mountain:uint = 4;
		private var cave:uint = 5;
		private var swamp:uint = 6;
		private var iceland:uint = 7;
		private var grassfield:uint = 8;
		private var lake:uint = 9;

		private var butanga:uint = 9;
		private var dubois:uint = 17;
		private var slimeeye:uint = 34;
		private var inker:uint = 5;
		private var scorpse:uint = 13;
		private var nodder:uint = 33;
		private var cirrus:uint = 37;
		private var dolphy:uint = 3;
		private var redlion:uint = 4;
		private var skitz:uint = 41;

		public var MoanChannel:SoundChannel = new SoundChannel();
		public var BgChannel:SoundChannel = new SoundChannel();
		public var BmChannel:SoundChannel = new SoundChannel();
		public var Moan_Array:Array = new Array();
		public var BgNoise_Array:Array = new Array();
		public var Bm_Array:Array = new Array();

		public function Game() {

			addChild(Menu_MC);

			Menu_MC.Menu_Gamestart_Btn.Menu_Gamestart_Text.text = "Start";
			//Menu_MC.Menu_Gamestart_Btn.Menu_Gamestart_Text.text = "それは素晴らしいゲームだった";

			Menu_MC.Menu_Gamestart_Btn.stop();
			Menu_MC.Menu_Gamestart_Btn.buttonMode = true;
			Menu_MC.Menu_Gamestart_Btn.addEventListener(MouseEvent.ROLL_OVER, Menu_Gamestart_Func);
			Menu_MC.Menu_Gamestart_Btn.addEventListener(MouseEvent.ROLL_OUT, Menu_Gamestart_Func);
			Menu_MC.Menu_Gamestart_Btn.addEventListener(MouseEvent.CLICK, Menu_Gamestart_Func);
			Menu_MC.Menu_Gamestart_Btn.addEventListener(MouseEvent.MOUSE_UP, Menu_Gamestart_Func);
			Menu_MC.Menu_Gamestart_Btn.stop();

			Menu_MC.PatreonBtn.addEventListener(MouseEvent.MOUSE_UP, Patreon);

			//thebattle = new Battle();
			//addChild(thebattle);

		}

		public function Menu_Gamestart_Func(evt:MouseEvent) : void{
			//trace("clicked" + event.target);
			//gotoAndPlay("someFrameLabel"); // plays frame in current timeline
			//Menu_MC.Menu_Gamestart_Btn.gotoAndPlay(2); // plays frame in instance "targetMc" timeline
			//Menu_MC.Menu_Gamestart_Btn.stop();

			switch(evt.type){
				case MouseEvent.MOUSE_UP:
					Menu_MC.Menu_Gamestart_Btn.gotoAndStop(1);

				case MouseEvent.ROLL_OVER:
					Menu_MC.Menu_Gamestart_Btn.gotoAndStop(2);
					break;

				case MouseEvent.ROLL_OUT:
					Menu_MC.Menu_Gamestart_Btn.gotoAndStop(1);
					break;

				case MouseEvent.CLICK:
					Menu_MC.Menu_Gamestart_Btn.gotoAndStop(3);
					initiation();
					addEventListener(Event.ENTER_FRAME, Fadeout_Menu);
					Menu_MC.Menu_Gamestart_Btn.removeEventListener(MouseEvent.CLICK, Menu_Gamestart_Func);
					break;
			}
		}

		public function Patreon(evt:MouseEvent) : void{
			var request:URLRequest = new URLRequest("https://www.patreon.com/nonoplayer");
			request.method = URLRequestMethod.GET;
			var target:String = "_blank";
			navigateToURL(request, target);
		}

		public function initiation():void{
			for(var p:Number = 0; p < 120; p++) {
				Dialogue_Array[p] = [];
				Dialogue_Progress[p] = 0;
				Story_Progress[p] = 0;
				Moan_Array[p] = 0;
			}

			All_Territories();

			Load_Lv2(current_hex);
			Load_Popup();
			Load_UI_Board(current_hex);

			All_Dialogue();
			All_Ally();
			All_Sound();

			BmChannel = Bm_Array[0].play(0, 9999);
		}

		public function Fadeout_Menu(e: Event){
			Menu_MC.alpha -= 1; //0.01 original value
			if (Menu_MC.alpha <=0){
				removeChild(Menu_MC);
				removeEventListener(Event.ENTER_FRAME, Fadeout_Menu);
			}
		}

		public function Load_Lv2(current_hex):void{
			Update_Indicator();
			if (!stage.contains(Lv2_Map_Container_MC)){
				addChildAt(Lv2_Map_Container_MC,0);
				Lv2_Map_Container_MC.gotoAndStop(current_hex);
				Lv2_Map_Container_MC.x = -680;
				Lv2_Map_Container_MC.y = 0;
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			}
			Lv2_Map_Container_MC.gotoAndStop(current_hex);
			if (current_hex == 905){
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Castle1_Down);
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.addEventListener(MouseEvent.MOUSE_DOWN, SecretGarden_Down);
			}
			if (current_hex == 1){
				Lv2_Map_Container_MC.Lv3_SecretGardenSwampBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Desert.visible = false;
				Lv2_Map_Container_MC.Grassfield.visible = false;
				Lv2_Map_Container_MC.Cave.visible = false;
				Lv2_Map_Container_MC.Iceland.visible = false;
				Lv2_Map_Container_MC.Mountain.visible = false;
				Lv2_Map_Container_MC.Volcano.visible = false;
				Lv2_Map_Container_MC.HouseBtn.visible = true;
				Lv2_Map_Container_MC.HouseBtn.addEventListener(MouseEvent.MOUSE_UP, House_Down);
			}
			if (current_hex == 2){
				Lv2_Map_Container_MC.x = 0;
				Lv2_Map_Container_MC.y = 0;
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				Lv2_Map_Container_MC.QNestBtn.visible = false;
				Lv2_Map_Container_MC.QNestBtn.addEventListener(MouseEvent.MOUSE_UP, QNest_Down);
				for (var i:uint = 0; i < MonstersInventory_Array.length; i++){
					if (MonstersInventory_Array[i].ID == 34){
						Lv2_Map_Container_MC.QNestBtn.visible = true;
						Lv2_Map_Container_MC.QNestBtn.addEventListener(MouseEvent.MOUSE_UP, QNest_Down);
					}
				}
			}
			State_Func("Lv2");

			Resources.show(Lv2_Map_Container_MC, current_hex);
		}

		public function AddUI():void{
			if (overhead_MC.DiaryBtn.visible == false){
				overhead_MC.DiaryBtn.visible = true;
			}
			if (current_hex == 905){
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.visible = true;
			}
			if (current_hex == 1){
				Lv2_Map_Container_MC.HouseBtn.visible = true;
			}
			if (current_hex == 2){
				for (var i:uint = 0; i < MonstersInventory_Array.length; i++){
					if (MonstersInventory_Array[i].ID == 34){
						Lv2_Map_Container_MC.QNestBtn.visible = true;
					}
				}
			}
			if (current_hex != 2){
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			}
		}

		public function RemoveUI():void{
			if (overhead_MC.DiaryBtn.visible == true){
				overhead_MC.DiaryBtn.visible = false;
			}
			if (current_hex == 905){
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.visible = false;
			}
			if (current_hex == 1){
				Lv2_Map_Container_MC.HouseBtn.visible = false;
			}
			if (current_hex == 2){
				Lv2_Map_Container_MC.QNestBtn.visible = false;
			}
			if (current_hex != 2){
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			}
		}

		public function Update_Indicator():void{
			if (!stage.contains(overhead_MC)){
				addChild(overhead_MC);
				if (current_turn == 0){
					overhead_MC.gotoAndStop(6);
					overhead_MC.Rd.text = "Round " + String(Math.ceil(total_turn/5)-1);
				} else {
					overhead_MC.gotoAndStop(current_turn);
					overhead_MC.Rd.text = "Round " + String(Math.ceil(total_turn/5));
				}
				overhead_MC.x = 969;
				overhead_MC.y = 24;
				overhead_MC.DiaryBtn.addEventListener(MouseEvent.MOUSE_DOWN, Diary_Down);
			} else {
				if (current_turn == 0){
					overhead_MC.gotoAndStop(6);
					overhead_MC.Rd.text = "Round " + String(Math.floor(total_turn/5)-1);
				} else {
					overhead_MC.gotoAndStop(current_turn);
					overhead_MC.Rd.text = "Round " + String(Math.floor(total_turn/5));
				}
			}
		}

		public function Diary_Down(e:MouseEvent){
			thefeature = 0;
			UI_Board_Container_MC.visible = false;
			RemoveUI();
			if (!stage.contains(UI_Diary_MC)){
				addChild(UI_Diary_MC);
				UI_Diary_MC.gotoAndStop(1);
				UI_Diary_MC.x = 264;
				UI_Diary_MC.y = 153;
				UI_Diary_MC.UI_Diary_Cancel.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Diary);
				UI_Diary_MC.Journal.addEventListener(MouseEvent.MOUSE_DOWN, Journal_Down);
				UI_Diary_MC.Army.addEventListener(MouseEvent.MOUSE_DOWN, ArmyDown);
				UI_Diary_MC.EndingProgress.addEventListener(MouseEvent.MOUSE_DOWN, EndingProgress_Down);
				UI_Diary_MC.ArmyKnowledge.addEventListener(MouseEvent.MOUSE_DOWN, ArmyKnowledge_Down);
				theMonUI = new MonsterUI();
				addChild(theMonUI);
				theMonUI.x += 50;
				theMonUI.y -= 110;
				theMonUI.NextBtn_MC.x -= 70;
				theMonUI.NextBtn_MC.y -= 10;
				theMonUI.PrevBtn_MC.x -= 70;
				theMonUI.PrevBtn_MC.y -= 10;
				theMonUI.Load_Icons();
			}
		}

		public function Cancel_Diary(e:MouseEvent){
			UI_Board_Container_MC.visible = true;
			AddUI();
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
			removeChild(UI_Diary_MC);
			/** if (stage.contains(IconContainer2)){
					while (IconContainer2.numChildren > 0) {
					IconContainer2.removeChildAt(0);
					}
					removeChild(IconContainer2);
					} **/
		}

		public function ArmyDown(e:MouseEvent){
			UI_Diary_MC.gotoAndStop(1);
			if (!stage.contains(theMonUI)){
				theMonUI = new MonsterUI();
				addChild(theMonUI);
				theMonUI.x += 50;
				theMonUI.y -= 110;
				theMonUI.Load_Icons();
			}
			UI_Diary_MC.ArmyKnowledge.addEventListener(MouseEvent.MOUSE_DOWN, ArmyKnowledge_Down);
		}

		public function Journal_Down(e:MouseEvent){
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
			UI_Diary_MC.gotoAndStop(4);
			var tempnum = MatedWith_Array.length + 1;
			UI_Diary_MC.PregRate.gotoAndStop(tempnum);
			UI_Diary_MC.JournalKnowledge.addEventListener(MouseEvent.MOUSE_DOWN, JournalKnowledge_Down);
		}

		public function EndingProgress_Down(e:MouseEvent){
			UI_Diary_MC.gotoAndStop(7);
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
		}

		public function ArmyKnowledge_Down(e:MouseEvent){
			UI_Diary_MC.gotoAndStop(8);
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
		}

		public function JournalKnowledge_Down(e:MouseEvent){
			UI_Diary_MC.gotoAndStop(9);
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
		}

		public function WorldFunc(evt:MouseEvent):void{
			switch(evt.type){
				case MouseEvent.ROLL_OUT:
					UI_Board_Container_MC.UI_Board_Content.WorldBtn.Eye.gotoAndStop(1);
					break;

				case MouseEvent.ROLL_OVER:
					UI_Board_Container_MC.UI_Board_Content.WorldBtn.Eye.gotoAndStop(2);
					break;

				case MouseEvent.CLICK:
					theMap = new MapUI(AllTerritories_Array, current_hex);
					theMap.x = -640;
					theMap.y = -200;
					addChild(theMap);
			}
		}

		public function Load_UI_Board(current_hex: uint):void{
			if (overhead_MC.DiaryBtn.visible == false){
				overhead_MC.DiaryBtn.visible = true;
			}
			if (!stage.contains(UI_Board_Container_MC)){
				addChildAt(UI_Board_Container_MC,2);
				UI_Board_Container_MC.x = 630;
				UI_Board_Container_MC.y = 960;
			}
			UI_Board_Container_MC.visible = true;
			if (Story_Progress[0] == 1){
				UI_Board_Container_MC.visible = false;
			}
			if (current_hex == 1){
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(3);
				if (Story_Progress[0] < 18){
					UI_Board_Container_MC.UI_Board_Content.ExploreBtn2.visible = false;
					UI_Board_Container_MC.UI_Board_Content.UI_Explore_Stage.visible = true;
					UI_Board_Container_MC.UI_Board_Content.UI_Explore_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Explore_Down0);
					UI_Board_Container_MC.UI_Board_Content.UI_Bonding_Stage.visible = false;
					UI_Board_Container_MC.UI_Board_Content.UI_RoyalArmy_Stage.visible = false;
					UI_Board_Container_MC.UI_Board_Content.UI_Hunting_Stage.visible = false;
					UI_Board_Container_MC.UI_Board_Content.UI_ExitSG_Stage.visible = false;
				}
				if (Story_Progress[0] >= 16){
					UI_Board_Container_MC.UI_Board_Content.UI_ExitSG_Stage.visible = true;
					UI_Board_Container_MC.UI_Board_Content.UI_ExitSG_Stage.addEventListener(MouseEvent.MOUSE_DOWN, ExitSG_Down);
				}
				if (Story_Progress[0] >= 23){
					UI_Board_Container_MC.UI_Board_Content.UI_Hunting_Stage.visible = true;
					UI_Board_Container_MC.UI_Board_Content.UI_Hunting_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Hunting_SecretGarden);
				}
				if (Story_Progress[0] >= 25){
					UI_Board_Container_MC.UI_Board_Content.UI_RoyalArmy_Stage.visible = true;
					UI_Board_Container_MC.UI_Board_Content.UI_RoyalArmy_Stage.addEventListener(MouseEvent.MOUSE_DOWN, RoyalArmy_SecretGarden);
				}
				if (Story_Progress[0] >= 26){
					UI_Board_Container_MC.UI_Board_Content.UI_Bonding_Stage.visible = true;
					UI_Board_Container_MC.UI_Board_Content.UI_Bonding_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Bonding_SecretGarden);
				}
				if (Story_Progress[0] >= 20){
					UI_Board_Container_MC.UI_Board_Content.UI_Explore_Stage.visible = false;
					UI_Board_Container_MC.UI_Board_Content.ExploreBtn2.visible = true;
					UI_Board_Container_MC.UI_Board_Content.ExploreBtn2.addEventListener(MouseEvent.MOUSE_DOWN, Explore);
				}
			}
			if (current_hex == 905){
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(4);
				UI_Board_Container_MC.UI_Board_Content.UI_Trade_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.UI_Tribute_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.UI_Message_Stage.visible = false;
				if (Story_Progress[0] >= 30){
					UI_Board_Container_MC.UI_Board_Content.UI_Trade_Stage.visible = true;
				}
				if (Story_Progress[0] >= 31){
					UI_Board_Container_MC.UI_Board_Content.UI_Tribute_Stage.visible = true;
				}
				if (Story_Progress[0] >= 32){
					UI_Board_Container_MC.UI_Board_Content.UI_Message_Stage.visible = true;
				}
			}
			if (current_hex == 2){
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(2);
				UI_Board_Container_MC.UI_Board_Content.UI_Costume_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.TEBtn.addEventListener(MouseEvent.MOUSE_DOWN, TEBtn_Down);
				UI_Board_Container_MC.UI_Board_Content.ExitHouse.addEventListener(MouseEvent.MOUSE_DOWN, ExitHouse_Down);
				UI_Board_Container_MC.UI_Board_Content.RestBtn.addEventListener(MouseEvent.MOUSE_DOWN, Rest_Down);
			}
			if (AllTerritories_Array[current_hex].TStatus == "Enemy"){
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(6);
				UI_Board_Container_MC.UI_Board_Content.ExploreBtn2.addEventListener(MouseEvent.MOUSE_DOWN, Explore);
				UI_Board_Container_MC.UI_Board_Content.UI_Scouting_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Scouting);
				UI_Board_Container_MC.UI_Board_Content.UI_Intelligence_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Intel);
				UI_Board_Container_MC.UI_Board_Content.UI_Intelligence_Stage.visible = false;
				Specialty(33);
			}
			if (UI_Board_Container_MC.UI_Board_Content.currentFrame != 1 && UI_Board_Container_MC.UI_Board_Content.currentFrame != 7){
				UI_Board_Container_MC.UI_Board_Content.WorldBtn.buttonMode = true;
				UI_Board_Container_MC.UI_Board_Content.WorldBtn.Eye.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.WorldBtn.addEventListener(MouseEvent.ROLL_OVER, WorldFunc);
				UI_Board_Container_MC.UI_Board_Content.WorldBtn.addEventListener(MouseEvent.ROLL_OUT, WorldFunc);
				UI_Board_Container_MC.UI_Board_Content.WorldBtn.addEventListener(MouseEvent.CLICK, WorldFunc);
				if (Story_Progress[0] <= 25){
					UI_Board_Container_MC.UI_Board_Content.WorldBtn.visible = false;
				}
			}
		}

		public function Load_Popup():void{
			addChildAt(UI_Popup_MC,1);
			UI_Popup_MC.x = 244;
			UI_Popup_MC.y = 70;
			UI_Popup_MC.gotoAndStop(1);
		}

		public function Load_App():void{
			UI_Board_Container_MC.visible = false;
			RemoveUI();
			if (!stage.contains(UI_App_Container_MC)){
				addChild(UI_App_Container_MC);
				UI_App_Container_MC.x = 270;
				UI_App_Container_MC.y = 120;
				UI_App_Container_MC.gotoAndStop(thefeature);
				ManageText(thefeature);
			} else {
				UI_App_Container_MC.gotoAndStop(thefeature);
				ManageText(thefeature);
			}
		}

		public function Load_Trans():void{
			story_or_ten = sex_species;
			addChild(UI_Trans_Container_MC);
			UI_Trans_Container_MC.gotoAndPlay(1);
			UI_Trans_Container_MC.x = 0;
			UI_Trans_Container_MC.y = 0;
			overhead_MC.visible = false;
			if (stage.contains(UI_Diary_MC)){
				removeChild(UI_Diary_MC);
			}
			addEventListener(Event.ENTER_FRAME, Trans_Func);
			TweenMax.to(BmChannel, 3, {volume:0, onComplete:BmFadeout});
			if (Dialogue_Progress[sex_species] > 0){
				//oneliner sound
			}
		}

		public function BmFadeout():void{
			BmChannel.stop();
		}

		public function Trans_Func(e: Event):void{
			if (UI_Trans_Container_MC.currentFrame == 19){
				Load_Sex();
				Load_SexSound();
			}
			if (UI_Trans_Container_MC.currentFrame == 72){
				removeChild(UI_Trans_Container_MC);
				addEventListener(Event.ENTER_FRAME, Delay_Dialogue);
				removeEventListener(Event.ENTER_FRAME, Trans_Func);
			}
		}

		public function Load_SexSound(){
			if (Moan_Array[sex_species] != 0){
				MoanChannel = Moan_Array[sex_species].play(0, 9999);
				BgChannel = BgNoise_Array[sex_background].play(1,9999);
				TweenMax.to(MoanChannel, 0, {volume:0, onComplete:Fadein});
				TweenMax.to(MoanChannel, 7, {volume:1, onComplete:Fadein});
				TweenMax.to(BgChannel, 0, {volume:0, onComplete:Fadein});
				TweenMax.to(BgChannel, 7, {volume:1, onComplete:Fadein});
			}
		}

		public function Fadein(){

		}

		public function Load_Sex():void{
			removeChild(Lv2_Map_Container_MC);
			addChildAt(Sex_Scene_MC,0);
			UI_Board_Container_MC.visible = true;
			UI_Board_Container_MC.UI_Board_Content.gotoAndStop(7);
			UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.visible = false;
			UI_Board_Container_MC.UI_Board_Content.UI_ContinueStory_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Continue_Story);
			UI_Board_Container_MC.UI_Board_Content.Dialogue.text = AllAllySpecies_Array[sex_species].Species;
			//if its dialogue(sex_situation = 0)
			if (sex_situation == 0){
				UI_Board_Container_MC.UI_Board_Content.UI_ContinueStory_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down_Bonding);
			}
			UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
			Sex_Scene_MC.x = -151;
			Sex_Scene_MC.y = -60;
			Sex_Scene_MC.Sex.gotoAndStop(sex_species);
			Sex_Scene_MC.Lv5_Background.gotoAndStop(sex_background);
			Sex_Scene_MC.Lv5_Branches.gotoAndStop(sex_background);
		}

		public function Load_SexInfo(situation:uint, species:uint, background:uint):void{
			sex_situation = situation;
			sex_species = species;
			sex_background = background;    
		}

		public function Delay_Dialogue(e: Event){
			if (sex_situation == 0){
				Assign_Dialogue_Bonding();
			} else {
				Assign_Dialogue();
			}
			removeEventListener(Event.ENTER_FRAME, Delay_Dialogue);
		}

		public function Continue_Story(e:MouseEvent):void{
			UI_Board_Container_MC.UI_Board_Content.UI_ContinueStory_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Continue_Story);
			UI_Board_Container_MC.UI_Board_Content.UI_ContinueStory_Stage.visible = false;
			Pregnant();
			Load_Trans2();
			addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
		}

		public function Pregnant():void{
			if (pregnant_block == 1){
				var mate:Object = {Species:uint, Lv:uint, Senses:uint, Intelligence:uint, Traveling:uint, Endurance:uint, Cooperativeness:uint, Appearance:uint, Camouflage:uint};
				mate.ID = MonstersInventory_Array[Memberindex].ID;
				mate.Species = MonstersInventory_Array[Memberindex].Species;
				mate.Lv = MonstersInventory_Array[Memberindex].Lv;
				mate.Class = MonstersInventory_Array[Memberindex].Class;
				mate.Type = MonstersInventory_Array[Memberindex].Type;
				mate.Tier = MonstersInventory_Array[Memberindex].Tier;
				mate.Senses = MonstersInventory_Array[Memberindex].Senses;
				mate.Intelligence = MonstersInventory_Array[Memberindex].Intelligence;
				mate.Traveling = MonstersInventory_Array[Memberindex].Traveling;
				mate.Endurance = MonstersInventory_Array[Memberindex].Endurance;
				mate.Cooperativeness = MonstersInventory_Array[Memberindex].Cooperativeness;
				mate.Appearance = MonstersInventory_Array[Memberindex].Appearance;
				mate.Camouflage = MonstersInventory_Array[Memberindex].Camouflage;
				MatedWith_Array.push(mate);
			}
			if (pregnant_block == 3){
				var tempvalue = MatedWith_Array.length;
				for(var i:uint = 0; i < pregnant_block - tempvalue; i++){
					var mate2:Object = {Species:uint, Lv:uint, Senses:uint, Intelligence:uint, Traveling:uint, Endurance:uint, Cooperativeness:uint, Appearance:uint, Camouflage:uint};
					mate2.ID = AllAllySpecies_Array[sex_species].ID;
					mate2.Species = AllAllySpecies_Array[sex_species].Species;
					mate2.Lv = AllAllySpecies_Array[sex_species].Lv;
					mate2.Class = AllAllySpecies_Array[sex_species].Class;
					mate2.Type = AllAllySpecies_Array[sex_species].Type;
					mate2.Tier = AllAllySpecies_Array[sex_species].Tier;
					mate2.Senses = AllAllySpecies_Array[sex_species].Senses;
					mate2.Intelligence = AllAllySpecies_Array[sex_species].Intelligence;
					mate2.Traveling = AllAllySpecies_Array[sex_species].Traveling;
					mate2.Endurance = AllAllySpecies_Array[sex_species].Endurance;
					mate2.Cooperativeness = AllAllySpecies_Array[sex_species].Cooperativeness;
					mate2.Appearance = AllAllySpecies_Array[sex_species].Appearance;
					mate2.Camouflage = AllAllySpecies_Array[sex_species].Camouflage;
					MatedWith_Array.push(mate2);
				}
			}
			if (MatedWith_Array.length >= 3){
				/** var temp_array:Array = new Array();
						for(var i4:uint = 0; i4 < 3; i4++){
						var new_mon = new Monsters(MatedWith_Array[i4].Species);
						new_mon.Lv = MatedWith_Array[i4].Lv;
						temp_array.push(new_mon); 
						} **/
				var classs = 0;
				var type = 0;
				var tier = 0;
				var qualified_array:Array = new Array();
				for (var i2:uint = 0; i2 < 61; i2++){
					for (var i3:uint = 0; i3 < 3; i3++){
						if (AllAllySpecies_Array[i2].Class == MatedWith_Array[i3].Class){classs = 1;}
						if (AllAllySpecies_Array[i2].Type == MatedWith_Array[i3].Type){type = 1;}
						if (AllAllySpecies_Array[i2].Tier == MatedWith_Array[i3].Tier){tier = 1;}
					}
					if (classs == 1 && type == 1 && tier == 1){
						qualified_array.push(AllAllySpecies_Array[i2].ID);
					}
					classs = 0;
					type = 0;
					tier = 0;
				}
				var randomnum = Math.floor(Math.random() * qualified_array.length);
				pregnantwith = qualified_array[randomnum];
				pregnantturn = total_turn;
				qualified_array.length = 0;
				pregnant_block = 0;
			}
		}

		public function Load_Trans2():void{
			UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
			addChild(UI_Trans_Container_MC);
			UI_Trans_Container_MC.gotoAndPlay(1);
			UI_Trans_Container_MC.x = 0;
			UI_Trans_Container_MC.y = 0;
			addEventListener(Event.ENTER_FRAME, Trans_Func2);
		}

		public function Trans_Func2(e: Event):void{
			if (UI_Trans_Container_MC.currentFrame == 19){
				removeChild(Sex_Scene_MC);
				Load_Lv2(current_hex);
				Unload_SexSound();
				RemoveUI();
			}
			if (UI_Trans_Container_MC.currentFrame == 72){
				removeChild(UI_Trans_Container_MC);
				AddUI();
				Load_UI_Board(current_hex);
				overhead_MC.visible = true;
				if (pregnantwith != 0){
					UI_Board_Container_MC.visible = false;
					RemoveUI();
					Load_ReturnMsg(5);
				}
				State_Func("Trans2");
				story_or_ten = 0;
				removeEventListener(Event.ENTER_FRAME, Trans_Func2);
			}
		}

		public function Unload_SexSound():void{
			TweenMax.to(MoanChannel, 4, {volume:0, onComplete:Fadeout});
			TweenMax.to(BgChannel, 4, {volume:0, onComplete:Fadeout});
		}

		public function Fadeout():void{
			MoanChannel.stop();
			BgChannel.stop();
			TweenMax.to(BmChannel, 3, {volume:1, onComplete:BmFadein});
		}

		public function BmFadein():void{
			BmChannel = Bm_Array[0].play(0, 9999);
		}

		public function Control_Map_Down(e:MouseEvent):void{
			start_ptx = stage.mouseX;
			start_pty = stage.mouseY;
			var Bounds:Rectangle = new Rectangle(-1280, -440, 1280, 440);
			//var Bounds:Rectangle = new Rectangle(-600, -440, 1280, 440);
			//var Bounds:Rectangle = new Rectangle(0, -440, 1280, 440);
			Lv2_Map_Container_MC.startDrag(false, Bounds);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_UP, Control_Map_Up);
		}

		public function Control_Map_Up(e:MouseEvent):void{
			end_ptx = stage.mouseX;
			end_pty = stage.mouseY;
			Lv2_Map_Container_MC.stopDrag();
			Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_UP, Control_Map_Up);
		}

		public function Castle1_Down(e:MouseEvent):void{
			UI_Board_Container_MC.visible = false;
			overhead_MC.DiaryBtn.visible = false;
			Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_UP, Control_Map_Up);
			story_or_ten = 0;
			Load_ReturnMsg(1);
			State_Func("Castle");
		}

		public function SecretGarden_Down(e:MouseEvent):void{
			current_hex = 1;
			Load_Lv2(current_hex);
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.Lv3_SecretGardenSwampBtn_Stage.visible = false;
			Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
			Lv2_Map_Container_MC.Desert.visible = false;
			Lv2_Map_Container_MC.Grassfield.visible = false;
			Lv2_Map_Container_MC.Cave.visible = false;
			Lv2_Map_Container_MC.Iceland.visible = false;
			Lv2_Map_Container_MC.Mountain.visible = false;
			Lv2_Map_Container_MC.Volcano.visible = false;
			State_Func("SecretGarden");
		}

		public function House_Down(e:MouseEvent):void{
			current_hex = 2;
			Load_Lv2(current_hex);
			Load_UI_Board(2);
			State_Func("House");
		}

		public function GiveBirth():void{
			var mon = new Monsters(0);
			mon.ToBe = pregnantwith;
			mon.BornAt = total_turn;
			var randomnum = 0;
			for (var i:uint = 0; i < 7; i++){
				randomnum = Math.random();
				if (randomnum < 0.28){
					randomnum = Math.floor(Math.random() * 3);
					if (i == 0){mon.InherSenses = MatedWith_Array[randomnum].Senses + MatedWith_Array[randomnum].Lv;}
					if (i == 1){mon.InherIntelligence = MatedWith_Array[randomnum].Intelligence + MatedWith_Array[randomnum].Lv;}
					if (i == 2){mon.InherTraveling = MatedWith_Array[randomnum].Traveling + MatedWith_Array[randomnum].Lv;}
					if (i == 3){mon.InherEndurance = MatedWith_Array[randomnum].Endurance + MatedWith_Array[randomnum].Lv;}
					if (i == 4){mon.InherCooperativeness = MatedWith_Array[randomnum].Cooperativeness + MatedWith_Array[randomnum].Lv;}
					if (i == 5){mon.InherAppearance = MatedWith_Array[randomnum].Appearance + MatedWith_Array[randomnum].Lv;}
					if (i == 6){mon.InherCamouflage = MatedWith_Array[randomnum].Camouflage + MatedWith_Array[randomnum].Lv;}
				}
			}
			MonstersInventory_Array.push(mon);
			pregnantwith = 0;
			pregnantturn = 0;
			MatedWith_Array.length = 0;
		}

		public function SortMonsters():void{
			var tempvalue = MonstersInventory_Array.length;
			for (var i:Number = 0; i < tempvalue; i++){
				if (MonstersInventory_Array[i].ID == 201 && MonstersInventory_Array[i].BornAt <= total_turn - 3){
					GrownUp(i);
					i = i - 1;
				}
			}
			MonstersInventory_Array.sortOn(['Lv']);
		}

		public function GrownUp(theindex: Number):void{
			UpdateTE(MonstersInventory_Array[theindex].ToBe);
			var mon = new Monsters(MonstersInventory_Array[theindex].ToBe);
			memberNo += 1;
			mon.MemberNo = memberNo;
			if (MonstersInventory_Array[theindex].InherSenses != 0){mon.Senses = MonstersInventory_Array[theindex].InherSenses;}
			if (MonstersInventory_Array[theindex].InherIntelligence != 0){mon.Intelligence = MonstersInventory_Array[theindex].InherIntelligence;}
			if (MonstersInventory_Array[theindex].InherTraveling != 0){mon.Traveling = MonstersInventory_Array[theindex].InherTraveling;}
			if (MonstersInventory_Array[theindex].InherEndurance != 0){mon.Endurance = MonstersInventory_Array[theindex].InherEndurance;}
			if (MonstersInventory_Array[theindex].InherCooperativeness != 0){mon.Cooperativeness = MonstersInventory_Array[theindex].InherCooperativeness;}
			if (MonstersInventory_Array[theindex].InherAppearance != 0){mon.Appearance = MonstersInventory_Array[theindex].InherAppearance;}
			if (MonstersInventory_Array[theindex].InherCamouflage != 0){mon.Camouflage = MonstersInventory_Array[theindex].InherCamouflage;}
			MonstersInventory_Array.push(mon);
			MonstersInventory_Array.splice(theindex, 1);
		}

		public function Explore_Down0(e:MouseEvent):void{
			thefeature = 1;
			pregnant_block = 3;
			Load_App();
			UI_App_Container_MC.UI_App_Cancel_Stage1.addEventListener(MouseEvent.MOUSE_UP, Cancel_Explore0);
			UI_App_Container_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Explore_Down0_Okay);
		}

		public function Explore_Down0_Okay(e:MouseEvent):void{
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			removeChild(UI_App_Container_MC);
			State_Func("Explore");
			UI_App_Container_MC.UI_App_Cancel_Stage1.removeEventListener(MouseEvent.MOUSE_UP, Cancel_Explore0);
			UI_App_Container_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Explore_Down0_Okay);
		}

		public function Cancel_Explore0(e:MouseEvent){
			if (current_hex == 1 && Story_Progress[0] >= 23){
				Lv2_Map_Container_MC.HouseBtn.visible = true;
			}
			removeChild(UI_App_Container_MC);
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			UI_App_Container_MC.UI_App_Cancel_Stage1.removeEventListener(MouseEvent.MOUSE_UP, Cancel_Explore0);
			UI_App_Container_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Explore_Down0_Okay);
		}

		public function Explore(e:MouseEvent):void{
			if (pregnantwith == 0){
				thefeature = 81;
				pregnant_block = 3;
				Load_App();
				SortMonsters();
				theMonUI = new MonsterUI();
				addChild(theMonUI);
				theMonUI.Load_Icons();
				UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_UP, OkayExplore);
				UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_UP, Cancel_Explore);
			} else {
				RemoveUI();
				UI_Board_Container_MC.visible = false;
				Load_ReturnMsg(10);
			}
		}

		public function Cancel_Explore(e:MouseEvent){
			if (current_hex == 1 && Story_Progress[0] >= 23){
				Lv2_Map_Container_MC.HouseBtn.visible = true;
			}
			removeChild(UI_App_Container_MC);
			removeChild(theMonUI);
			AssignMon.length = 0;
			if (stage.contains(ArmyContainer)){
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
			}
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayExplore);
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_UP, Cancel_Explore);
		}

		public function OkayExplore(e:MouseEvent):void{
			if (stage.contains(UI_ReturnMsg_MC)){
				removeChild(UI_ReturnMsg_MC);
			}
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
			if (stage.contains(ArmyContainer)){
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
			}
			if (current_turn < 1){
				Load_ReturnMsg(0);
				if (stage.contains(UI_App_Container_MC)){
					removeChild(UI_App_Container_MC);
				}
			} else {
				start_ptx = 0;
				start_pty = 0;
				end_ptx = 1;
				end_pty = 1;
				if (stage.contains(UI_App_Container_MC)){
					removeChild(UI_App_Container_MC);
				}
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				addEventListener(Event.ENTER_FRAME, Explore_App);
				State_Func("Explore");
			}
			UI_Narrative_MC.StopTask.addEventListener(MouseEvent.MOUSE_DOWN, StopTask_Down);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayExplore);
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_UP, Cancel_Explore);
		}

		public function KeepExplore(e:MouseEvent):void{
			if (stage.contains(UI_ReturnMsg_MC)){
				removeChild(UI_ReturnMsg_MC);
			}
			start_ptx = 0;
			start_pty = 0;
			end_ptx = 1;
			end_pty = 1;
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			addEventListener(Event.ENTER_FRAME, Explore_App);
			UI_Narrative_MC.StopTask.addEventListener(MouseEvent.MOUSE_DOWN, StopTask_Down);
			UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, KeepExplore);
		}

		public function Explore_App(e: Event):void{
			if(start_ptx == end_ptx && start_pty == end_pty){
				if (current_turn < 1){
					Load_ReturnMsg(0);
					removeEventListener(Event.ENTER_FRAME, Explore_App);
				} else {
					UI_Narrative_MC.StopTask.removeEventListener(MouseEvent.MOUSE_DOWN, StopTask_Down);
					total_turn += 1;
					current_turn -= 1;
					Resources.turnPassed(1);
					Update_Indicator();
					Specialty(3);
					Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
					addChild(Circle_Cursor_MC);
					Circle_Cursor_MC.x = start_ptx;
					Circle_Cursor_MC.y = start_pty;
					Load_ReturnMsg(2);
					var Explore_App_Timer = new Timer(1500, 1);
					Explore_App_Timer.addEventListener(TimerEvent.TIMER, Explore_Result);
					Explore_App_Timer.start();
					removeEventListener(Event.ENTER_FRAME, Explore_App);

					if (current_hex == 1){
						Calculate_Distance(Lv2_Map_Container_MC.Butanga_Spot, butanga, AllAllySpecies_Array[9].Habitat);
						Calculate_Distance(Lv2_Map_Container_MC.SlimeEye_Spot, slimeeye, AllAllySpecies_Array[34].Habitat);
						Calculate_Distance(Lv2_Map_Container_MC.Dubois_Spot, dubois, AllAllySpecies_Array[17].Habitat);
					}
					if (current_hex == 805){
						Calculate_Distance(Lv2_Map_Container_MC.Butanga_Spot, butanga, AllAllySpecies_Array[9].Habitat);
						Calculate_Distance(Lv2_Map_Container_MC.Inker_Spot, inker, AllAllySpecies_Array[5].Habitat);
					}
					if (current_hex == 806){
						Calculate_Distance(Lv2_Map_Container_MC.Scorpse_Spot, scorpse, AllAllySpecies_Array[13].Habitat);
					}
					if (current_hex == 904){
						Calculate_Distance(Lv2_Map_Container_MC.Dolphy_Spot, dolphy, AllAllySpecies_Array[3].Habitat);
					}
					if (current_hex == 906){
						Calculate_Distance(Lv2_Map_Container_MC.Nodder_Spot, nodder, AllAllySpecies_Array[33].Habitat);
					}
					if (current_hex == 1005){
						Calculate_Distance(Lv2_Map_Container_MC.Cirrus_Spot, cirrus, AllAllySpecies_Array[37].Habitat);
						Calculate_Distance(Lv2_Map_Container_MC.Cirrus_Spot2, cirrus, AllAllySpecies_Array[37].Habitat);
					}
				}
			}
		}

		public function Calculate_Distance(themon: Object, thespecies: uint, habitat: uint):void{
			var a = 0;
			var b = 0;
			var c = 0;
			var obj:Object=new Object();
			obj = themon;
			var relative_pt:Point = new Point(obj.x,obj.y);
			relative_pt = obj.parent.localToGlobal(relative_pt);
			a = start_ptx - relative_pt.x;
			b = start_pty - relative_pt.y;
			c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
			if (c - 50 < 210){
				temp_array.push(thespecies);
			}

			var thedirection = "";
			var ydirection = "";
			var xdirection = "";
			if (a >= 0){
				xdirection = "West";
			} else {
				xdirection = "East";
			}
			if (b >= 0){
				ydirection = "North";
			} else {
				ydirection = "South";
			}
			thedirection = ydirection + xdirection;
			Direction_Array.push(thedirection);
		}

		public function Explore_Result(e: TimerEvent):void{
			removeChild(Circle_Cursor_MC);
			if (temp_array.length > 0){
				NarrativeFunc(1);
				var randomnum = Math.floor(Math.random() * temp_array.length);
				sex_species = temp_array[randomnum]; 
				UpdateTE(sex_species);
				var fabricorspecies = Math.round(Math.random());
				if (fabricorspecies == 0){
					Load_ReturnMsg(19);
					addChild(UI_Fabric_MC);
					UI_Fabric_MC.x = 594;
					UI_Fabric_MC.y = 282;
					UI_Fabric_MC.gotoAndStop(sex_species);
				}
				if (fabricorspecies == 1){
					removeChild(UI_ReturnMsg_MC);
					addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
					sex_situation = 1;
					pregnant_block = 3;
					Load_SexInfo(sex_situation, sex_species, AllAllySpecies_Array[sex_species].Habitat);
					Load_Trans();
				}
			}
			else {
				Load_ReturnMsg(20);
				NarrativeFunc(2);
			}
			temp_array.length = 0;
		}

		public function NarrativeFunc(situation:uint):void{
			trace("wtf");
			var qualification = 0;
			var traveling = 0;
			var cooperativeness = 0;
			var normalornot = Math.random()*0.25;
			var assignedspecies = "Unknown";
			for (var i: uint = 0; i < MonstersInventory_Array.length; i++){
				if (AssignMon[0] == MonstersInventory_Array[i].MemberNo){
					traveling = MonstersInventory_Array[i].Traveling/100;
					cooperativeness = MonstersInventory_Array[i].Cooperativeness/100;
					assignedspecies = MonstersInventory_Array[i].Species;
				}
			}

			if (situation == 1){
				ReturnNarrative("normalwithinrange", assignedspecies);
			}

			if (situation == 2){
				if (normalornot <= traveling * cooperativeness){
					if (cooperativeness >= traveling){
						ReturnNarrative("lacktra", assignedspecies);
					}
					if (traveling > cooperativeness){
						ReturnNarrative("lackcoo", assignedspecies);
					}
				} else {
					ReturnNarrative("normaloutofrange", assignedspecies);
				}
			}
		}

		public function ReturnNarrative(situation: String, thespecies: String):void{
			if (!stage.contains(UI_Narrative_MC)){
				addChild(UI_Narrative_MC);
				UI_Narrative_MC.x = 363;
				UI_Narrative_MC.y = 902;
			}
			var somenum = 0; 

			if (situation == "lacktra"){
				somenum = Math.floor(Math.random()*9);

				if (somenum == 0){
					UI_Narrative_MC.Text_Stage.text = thespecies + ", you can do it.";
				}
				if (somenum == 1){
					UI_Narrative_MC.Text_Stage.text = "Just try to catch your breath.";
				}
				if (somenum == 2){
					UI_Narrative_MC.Text_Stage.text = "Let's slow down a bit.";
				}
				if (somenum == 3){
					UI_Narrative_MC.Text_Stage.text = "You can do it...its just a small step.";
				}
				if (somenum == 4){
					UI_Narrative_MC.Text_Stage.text = "You don't want to move ah?";
				}
				if (somenum == 5){
					UI_Narrative_MC.Text_Stage.text = "We can hardly go anywhere at this rate.";
				}
				if (somenum == 6){
					UI_Narrative_MC.Text_Stage.text = "Here, " + thespecies + ", take some water...";
				}
				if (somenum == 7){
					UI_Narrative_MC.Text_Stage.text = thespecies + ", I know you can keep up. ";
				}
				if (somenum == 8){
					UI_Narrative_MC.Text_Stage.text = "That's how fast you plan to move?";
				}
			}

			if (situation == "lackcoo"){
				somenum = Math.floor(Math.random()*13);

				if (somenum == 0){
					UI_Narrative_MC.Text_Stage.text = "What are you doing with those tentacles?";
				}
				if (somenum == 1){
					UI_Narrative_MC.Text_Stage.text = "Can you stop touching me like that?";
				}
				if (somenum == 2){
					UI_Narrative_MC.Text_Stage.text = "I can't focus on the task...";
				}
				if (somenum == 3){
					UI_Narrative_MC.Text_Stage.text = "Not that way, " + thespecies + ".";
				}
				if (somenum == 4){
					UI_Narrative_MC.Text_Stage.text = "No...where are you going?";
				}
				if (somenum == 5){
					UI_Narrative_MC.Text_Stage.text = "Don't you want to be my assistance?";
				}
				if (somenum == 6){
					UI_Narrative_MC.Text_Stage.text = "But don't do that again...";
				}
				if (somenum == 7){
					UI_Narrative_MC.Text_Stage.text = "I know you don't want to be here.";
				}
				if (somenum == 8){
					UI_Narrative_MC.Text_Stage.text = "Calm down, calm down...";
				}
				if (somenum == 9){
					UI_Narrative_MC.Text_Stage.text = "Perhaps its a mistake to take you here.";
				}
				if (somenum == 10){
					UI_Narrative_MC.Text_Stage.text = "Awwee...you are a such bad boy.";
				}
				if (somenum == 11){
					UI_Narrative_MC.Text_Stage.text = "No...not there.";
				}
				if (somenum == 12){
					UI_Narrative_MC.Text_Stage.text = "Where did " + thespecies + " go?";
				}
			}

			if (situation == "normaloutofrange"){
				somenum = Math.floor(Math.random()*10);
				var randnum = Math.floor(Math.random()*Direction_Array.length);

				if (somenum == 0){
					UI_Narrative_MC.Text_Stage.text = "Doesn't look like it has what we want here. Let's head " + Direction_Array[randnum] + ".";
				}
				if (somenum == 1){
					UI_Narrative_MC.Text_Stage.text = "The tracks are pointing to " + Direction_Array[randnum] + ".";
				}
				if (somenum == 2){
					UI_Narrative_MC.Text_Stage.text = "Now, let's travel " + Direction_Array[randnum] +  ".";
				}
				if (somenum == 3){
					UI_Narrative_MC.Text_Stage.text = "I think we can try " + Direction_Array[randnum] + ".";
				}
				if (somenum == 4){
					UI_Narrative_MC.Text_Stage.text = "I believe " + Direction_Array[randnum] + " has what we are looking for.";
				}
				if (somenum == 5){
					UI_Narrative_MC.Text_Stage.text = "Let's move " + Direction_Array[randnum] + ".";
				}
				if (somenum == 6){
					UI_Narrative_MC.Text_Stage.text = "Oh " + thespecies + ", thank you for the encouragement. Alright, to the "  + Direction_Array[randnum] + "!";
				}
				if (somenum == 7){
					UI_Narrative_MC.Text_Stage.text = Direction_Array[randnum] + "!";
				}
				if (somenum == 8){
					UI_Narrative_MC.Text_Stage.text = Direction_Array[randnum] + " it is.";
				}
				if (somenum == 9){
					UI_Narrative_MC.Text_Stage.text = "Follow the path, " + thespecies + ", head " + Direction_Array[randnum] + ".";
				}
			}

			if (situation == "normalwithinrange"){
				somenum = Math.floor(Math.random()*8);

				if (somenum == 0){
					UI_Narrative_MC.Text_Stage.text = "We are getting closer.";
				}
				if (somenum == 1){
					UI_Narrative_MC.Text_Stage.text = "Today is my lucky day!";
				}
				if (somenum == 2){
					UI_Narrative_MC.Text_Stage.text = "I feel danger here.";
				}
				if (somenum == 3){
					UI_Narrative_MC.Text_Stage.text = "I feel something is watching me...";
				}
				if (somenum == 4){
					UI_Narrative_MC.Text_Stage.text = "It should be around here.";
				}
				if (somenum == 5){
					UI_Narrative_MC.Text_Stage.text = "Show yourself...";
				}
				if (somenum == 6){
					UI_Narrative_MC.Text_Stage.text = "We are within something's territory.";
				}
				if (somenum == 7){
					UI_Narrative_MC.Text_Stage.text = thespecies + ", I think we should slow down to take a look around here.";
				}
			}

			Direction_Array.length = 0;
		}

		public function StopTask_Down(e:MouseEvent):void{
			AssignMon.length = 0;
			removeChild(UI_Narrative_MC);
			if (stage.contains(UI_Fabric_MC)) removeChild(UI_Fabric_MC);
			if (stage.contains(UI_ReturnMsg_MC)) removeChild(UI_ReturnMsg_MC);
			Load_UI_Board(current_hex);
			AddUI();
			removeEventListener(Event.ENTER_FRAME, Explore_App);
			UI_Narrative_MC.StopTask.removeEventListener(MouseEvent.MOUSE_DOWN, StopTask_Down);
		}

		public function Hunting_SecretGarden(e:MouseEvent):void{
			thefeature = 21;
			SortMonsters();
			Load_App();
			theMonUI = new MonsterUI();
			addChild(theMonUI);
			theMonUI.Load_Icons();
			UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Hunt);
			UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_UP, OkayHunt);
		}

		public function OkayHunt(e:MouseEvent):void{
			if (current_turn < 1){
				Load_ReturnMsg(0);
				removeChild(UI_App_Container_MC);
				removeChild(theMonUI);
				AssignMon.length = 0;
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
			} else {
				if (AssignMon.length == 0){
					Load_ReturnMsg(7);
				} else {
					removeChild(theMonUI);
					while (ArmyContainer.numChildren > 0) {
						ArmyContainer.removeChildAt(0);
					}
					total_turn += 1;
					current_turn -= 1;
					Resources.turnPassed(1);
					Update_Indicator();
					removeChild(UI_App_Container_MC);
					Load_ReturnMsg(6);
					var Hunt_App_Timer = new Timer(3000, 1);
					Hunt_App_Timer.addEventListener(TimerEvent.TIMER, Hunt_App);
					Hunt_App_Timer.start();
					State_Func("Hunt");
				}
			}
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Hunt);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayHunt);
		}

		public function Cancel_Hunt(e:MouseEvent):void{
			if (current_hex == 1 && Story_Progress[0] >= 23){
				Lv2_Map_Container_MC.HouseBtn.visible = true;
			}
			removeChild(UI_App_Container_MC);
			removeChild(theMonUI);
			AssignMon.length = 0;
			if (stage.contains(ArmyContainer)){
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
			}
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayHunt);
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Hunt);
		}

		public function UpdateAssignMon():void{
			if (!stage.contains(ArmyContainer)){
				addChild(ArmyContainer);
				ArmyContainer.x = 70;
				ArmyContainer.y = 210;
			} else {
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
				addChild(ArmyContainer);
				ArmyContainer.x = 70;
				ArmyContainer.y = 210;
			}
			for (var i2: uint = 0; i2 < MonstersInventory_Array.length; i2++){
				if (AssignMon[0] == MonstersInventory_Array[i2].MemberNo){
					var temp_MC = new Monicon();
					temp_MC.MemberNo = MonstersInventory_Array[i2].MemberNo;
					temp_MC.Monster.gotoAndStop(MonstersInventory_Array[i2].ID);
					temp_MC.Lv_Text.text = "Lv " + MonstersInventory_Array[i2].Lv;
					temp_MC.buttonMode = true;
					ArmyContainer.addChild(temp_MC);
					temp_MC.addEventListener(MouseEvent.CLICK, RemoveAssign);
				}
			}
		}

		public function RemoveAssign(e:MouseEvent):void{
			AssignMon.length = 0;
			UpdateAssignMon();
		}

		public function Hunt_App(e: TimerEvent):void{
			for (var i: uint = 0; i < MonstersInventory_Array.length; i++){
				if (AssignMon[0] == MonstersInventory_Array[i].MemberNo){
					foundfood = AllTerritories_Array[current_hex].Food * MonstersInventory_Array[i].Camouflage/100 * MonstersInventory_Array[i].Senses/100 * (Math.random()*0.5 + 0.75);
					foundfood = Math.round(foundfood);
					food += foundfood;
				}
			}
			Load_ReturnMsg(8);
			addChild(UI_Fabric_MC);
			UI_Fabric_MC.x = 594;
			UI_Fabric_MC.y = 282;
			UI_Fabric_MC.gotoAndStop(201);
			AssignMon.length = 0;
			foundfood = 0;
		}

		public function RoyalArmy_SecretGarden(e:MouseEvent):void{
			thefeature = 11;
			SortMonsters();
			Load_App();
			theMonUI = new MonsterUI();
			addChild(theMonUI);
			theMonUI.Load_Icons();
			UpdateRoyalArmy();
			UI_App_Container_MC.UI_App_Cancel_Stage2.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_RArmy);
		}

		public function Cancel_RArmy(e:MouseEvent):void{
			if (current_hex == 1 && Story_Progress[0] >= 23){
				Lv2_Map_Container_MC.HouseBtn.visible = true;
			}
			removeChild(UI_App_Container_MC);
			removeChild(theMonUI);
			if (stage.contains(ArmyContainer)){
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
			}
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
		}

		public function UpdateRoyalArmy():void{
			if (!stage.contains(ArmyContainer)){
				addChild(ArmyContainer);
				ArmyContainer.x = 70;
				ArmyContainer.y = 195;
			} else {
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
				addChild(ArmyContainer);
				ArmyContainer.x = 70;
				ArmyContainer.y = 195;
			}

			for (var i: uint = 0; i < RoyalArmy_Array.length; i++){
				for (var i2: uint = 0; i2 < MonstersInventory_Array.length; i2++){
					if (RoyalArmy_Array[i] == MonstersInventory_Array[i2].MemberNo){
						var temp_MC = new Monicon();
						temp_MC.MemberNo = MonstersInventory_Array[i2].MemberNo;
						temp_MC.Monster.gotoAndStop(MonstersInventory_Array[i2].ID);
						temp_MC.Royal_Text.text = "Royal";
						temp_MC.Lv_Text.text = "Lv " + MonstersInventory_Array[i2].Lv;
						temp_MC.x += 150*i;
						temp_MC.buttonMode = true;
						ArmyContainer.addChild(temp_MC);
						temp_MC.addEventListener(MouseEvent.CLICK, RemoveArmy);
					}
				}
			}
		}

		public function RemoveArmy(evt:MouseEvent):void{
			for (var i: uint = 0; i < MonstersInventory_Array.length; i++){
				if (MonstersInventory_Array[i].MemberNo == evt.currentTarget.MemberNo){
					MonstersInventory_Array[i].Royal = "";
					break;
				}
			}
			RoyalArmy_Array.splice(RoyalArmy_Array.indexOf(evt.currentTarget.MemberNo), 1);
			UpdateRoyalArmy();
			if (theMonUI.currentlyon == 1){
				theMonUI.Unload_MonsterUI();
				theMonUI.Load_Icons();
			}
			if (theMonUI.currentlyon == 2){
				theMonUI.Unload_MonsterUI();
				theMonUI.Load_Cards();
			}
			if (theMonUI.currentlyon == 3){
				theMonUI.Unload_MonsterUI();
				theMonUI.Load_Traits();
			}
		}

		public function Bonding_SecretGarden(e:MouseEvent):void{
			if (pregnantwith == 0){
				thefeature = 71;
				SortMonsters();
				Load_App();
				theMonUI = new MonsterUI();
				addChild(theMonUI);
				theMonUI.Load_Icons();
				UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Bond);
				UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_UP, OkayBond);
			} else {
				RemoveUI();
				UI_Board_Container_MC.visible = false;
				Load_ReturnMsg(10);
			}
		}

		public function Cancel_Bond(e:MouseEvent):void{
			if (current_hex == 1 && Story_Progress[0] >= 23){
				Lv2_Map_Container_MC.HouseBtn.visible = true;
			}
			removeChild(UI_App_Container_MC);
			removeChild(theMonUI);
			AssignMon.length = 0;
			if (stage.contains(ArmyContainer)){
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
			}
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayBond);
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Bond);
		}

		public function OkayBond(e:MouseEvent){
			if (current_turn < 2){
				Load_ReturnMsg(17);
				removeChild(UI_App_Container_MC);
				removeChild(theMonUI);
				AssignMon.length = 0;
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				Lv2_Map_Container_MC.Desert.visible = false;
				Lv2_Map_Container_MC.Grassfield.visible = false;
				Lv2_Map_Container_MC.Cave.visible = false;
				Lv2_Map_Container_MC.Iceland.visible = false;
				Lv2_Map_Container_MC.Mountain.visible = false;
				Lv2_Map_Container_MC.Volcano.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenSwampBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
			} else {
				if (AssignMon.length == 0){
					Load_ReturnMsg(7);
				} else {
					Lv2_Map_Container_MC.Desert.visible = true;
					Lv2_Map_Container_MC.Grassfield.visible = true;
					Lv2_Map_Container_MC.Cave.visible = true;
					Lv2_Map_Container_MC.Iceland.visible = true;
					Lv2_Map_Container_MC.Mountain.visible = true;
					Lv2_Map_Container_MC.Volcano.visible = true;
					Lv2_Map_Container_MC.Lv3_SecretGardenSwampBtn_Stage.visible = true;
					Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = true;

					Lv2_Map_Container_MC.Desert.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Grassfield.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Cave.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Iceland.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Mountain.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Volcano.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Lv3_SecretGardenSwampBtn_Stage.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);
					Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.addEventListener(MouseEvent.MOUSE_UP, HabitatBtn);

					Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);

					removeChild(theMonUI);
					total_turn += 2;
					current_turn -= 2;
					Resources.turnPassed(2);
					Update_Indicator();
					removeChild(UI_App_Container_MC);
					while (ArmyContainer.numChildren > 0) {
						ArmyContainer.removeChildAt(0);
					}
				}
			}
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayBond);
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Bond);
		}

		public function HabitatBtn(evt:MouseEvent):void{
			Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			var thehabitat = 0;
			if (evt.currentTarget.name == "Lv3_SecretGardenSwampBtn_Stage"){
				thehabitat = 6;
			}
			if (evt.currentTarget.name == "Lv3_SecretGardenJungleBtn_Stage"){
				thehabitat = 1;
			}
			if (evt.currentTarget.name == "Desert"){
				thehabitat = 2;
			}
			if (evt.currentTarget.name == "Grassfield"){
				thehabitat = 8;
			}
			if (evt.currentTarget.name == "Cave"){
				thehabitat = 5;
			}
			if (evt.currentTarget.name == "Iceland"){
				thehabitat = 7;
			}
			if (evt.currentTarget.name == "Mountain"){
				thehabitat = 4;
			}
			if (evt.currentTarget.name == "Volcano"){
				thehabitat = 3;
			}
			Lv2_Map_Container_MC.Desert.visible = false;
			Lv2_Map_Container_MC.Grassfield.visible = false;
			Lv2_Map_Container_MC.Cave.visible = false;
			Lv2_Map_Container_MC.Iceland.visible = false;
			Lv2_Map_Container_MC.Mountain.visible = false;
			Lv2_Map_Container_MC.Volcano.visible = false;
			Lv2_Map_Container_MC.Lv3_SecretGardenSwampBtn_Stage.visible = false;
			Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;

			for (var i: uint = 0; i < MonstersInventory_Array.length; i++){
				if (AssignMon[0] == MonstersInventory_Array[i].MemberNo){
					if (thehabitat == MonstersInventory_Array[i].Habitat){
						pregnant_block = 1;
						story_or_ten = MonstersInventory_Array[i].ID;
						UI_Board_Container_MC.visible = true;
						addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
						UI_Popup_MC.visible = true;
						UI_Popup_MC.gotoAndStop(6);
						UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
						UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
						UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down_Bonding);
						Memberindex = i;
						Assign_Dialogue_Bonding();
						overhead_MC.visible = false;
					} else {
						Load_ReturnMsg(18);
					}
				}
			}
			AssignMon.length = 0;
			while (ArmyContainer.numChildren > 0) {
				ArmyContainer.removeChildAt(0);
			}
		}

		public function Dialogue_Down_Bonding(e: Event){
			if (displayText.length != 0){
				UI_Board_Container_MC.UI_Board_Content.Dialogue.appendText(displayText);
				displayText = "";
			}
			else{
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				Assign_Dialogue_Bonding();
			}
		}

		public function Assign_Dialogue_Bonding():void{
			MonstersInventory_Array[Memberindex].DiaProgress += 1;
			sex_species = MonstersInventory_Array[Memberindex].ID;

			UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.visible = true;
			displayText = Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress];

			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == null ||
				Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == ""){
				UI_Board_Container_MC.UI_Board_Content.UI_ContinueStory_Stage.visible = true;
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.removeEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down_Bonding);
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.visible = false;
			}
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "Sex"){
				displayText = "";
				UI_Board_Container_MC.visible = false;
				UI_Popup_MC.visible = false;
				sex_situation = 0;
				Load_SexInfo(sex_situation, sex_species, AllAllySpecies_Array[sex_species].Habitat);
				Load_Trans();
			}
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "Guess the Monster's Emotion"){
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.removeEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down_Bonding);
				addChild(Choices_MC);
				Choices_MC.x = 300;
				Choices_MC.y = 300;
				Choices_MC.A.addEventListener(MouseEvent.MOUSE_UP, ASelected);
				Choices_MC.B.addEventListener(MouseEvent.MOUSE_UP, BSelected);
				MonstersInventory_Array[Memberindex].DiaProgress += 1;
				Choices_MC.Atext.text = Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress];
				MonstersInventory_Array[Memberindex].DiaProgress += 1;
				Choices_MC.Btext.text = Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress];
			}
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "Jump"){
				while (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] != "Merge"){
					MonstersInventory_Array[Memberindex].DiaProgress += 1;
				}
			}
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "Merge"){
				displayText = "";
				MonstersInventory_Array[Memberindex].DiaProgress += 1;
				displayText = Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress];
			}
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "End"){
				MonstersInventory_Array[Memberindex].DiaProgress -= 2;
				UI_Board_Container_MC.visible = false;
				UI_Popup_MC.visible = false;
				sex_situation = 0;
				Load_SexInfo(sex_situation, sex_species, AllAllySpecies_Array[sex_species].Habitat);
				Load_Trans();
			}
			myTimer.addEventListener(TimerEvent.TIMER, typeText_Bonding);
			myTimer.start();
		}

		public function typeText_Bonding(event:TimerEvent):void{
			if(displayText.length == 0){
				myTimer.reset();
				myTimer.removeEventListener(TimerEvent.TIMER, typeText_Bonding);
			}
			var nextLetter:String = displayText.charAt(0); 
			displayText = displayText.substr(1);
			UI_Board_Container_MC.UI_Board_Content.Dialogue.appendText(nextLetter);
		}

		public function ASelected(e:MouseEvent){
			MonstersInventory_Array[Memberindex].DiaProgress += 1;
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "A"){
				RPplus4_MC.gotoAndPlay(1);
				addChild(RPplus4_MC);
				RPplus4_MC.x = 230;
				RPplus4_MC.y = 250;
				if (MonstersInventory_Array[Memberindex].RelationshipPts > 0){
					MonstersInventory_Array[Memberindex].Lv += 1;
					Lvup_MC.gotoAndPlay(1);
					addChild(Lvup_MC);
					Lvup_MC.x = 125;
					Lvup_MC.y = 350;
					MonstersInventory_Array[Memberindex].RelationshipPts -= 1;
				} else {
					MonstersInventory_Array[Memberindex].RelationshipPts += 4;
				}
			} else {
				RPplus2_MC.gotoAndPlay(1);
				addChild(RPplus2_MC);
				RPplus2_MC.x = 230;
				RPplus2_MC.y = 250;
				if (MonstersInventory_Array[Memberindex].RelationshipPts > 2){
					MonstersInventory_Array[Memberindex].Lv += 1;
					Lvup_MC.gotoAndPlay(1);
					addChild(Lvup_MC);
					Lvup_MC.x = 125;
					Lvup_MC.y = 350;
					MonstersInventory_Array[Memberindex].RelationshipPts -= 3;
				} else {
					MonstersInventory_Array[Memberindex].RelationshipPts += 2;

				}
			}
			addEventListener(Event.ENTER_FRAME, removestuff);
			UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
			UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down_Bonding);
			removeChild(Choices_MC);
			Assign_Dialogue_Bonding();
		}

		public function BSelected(e:MouseEvent){
			MonstersInventory_Array[Memberindex].DiaProgress += 1;
			if (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] == "B"){
				RPplus4_MC.gotoAndPlay(1);
				addChild(RPplus4_MC);
				RPplus4_MC.x = 230;
				RPplus4_MC.y = 250;
				if (MonstersInventory_Array[Memberindex].RelationshipPts > 0){
					MonstersInventory_Array[Memberindex].Lv += 1;
					Lvup_MC.gotoAndPlay(1);
					addChild(Lvup_MC);
					Lvup_MC.x = 125;
					Lvup_MC.y = 350;
					MonstersInventory_Array[Memberindex].RelationshipPts -= 1;
				} else {
					MonstersInventory_Array[Memberindex].RelationshipPts += 4;
				}
			} else {
				RPplus2_MC.gotoAndPlay(1);
				addChild(RPplus2_MC);
				RPplus2_MC.x = 230;
				RPplus2_MC.y = 250;
				if (MonstersInventory_Array[Memberindex].RelationshipPts > 2){
					MonstersInventory_Array[Memberindex].Lv += 1;
					Lvup_MC.gotoAndPlay(1);
					addChild(Lvup_MC);
					Lvup_MC.x = 125;
					Lvup_MC.y = 350;
					MonstersInventory_Array[Memberindex].RelationshipPts -= 3;
				} else {
					MonstersInventory_Array[Memberindex].RelationshipPts += 2;
				}
			}
			while (Dialogue_Array[story_or_ten][MonstersInventory_Array[Memberindex].DiaProgress] != "Jump"){
				MonstersInventory_Array[Memberindex].DiaProgress += 1;
			}
			addEventListener(Event.ENTER_FRAME, removestuff);
			UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
			UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down_Bonding);
			removeChild(Choices_MC);
			Assign_Dialogue_Bonding();
		}

		public function removestuff(e:Event):void{
			if (stage.contains(Lvup_MC) && Lvup_MC.currentFrame == 72){
				removeChild(Lvup_MC);
			}
			if (stage.contains(RPplus4_MC) && RPplus4_MC.currentFrame == 90){
				removeChild(RPplus4_MC);
				removeEventListener(Event.ENTER_FRAME, removestuff);
			}
			if (stage.contains(RPplus2_MC) && RPplus2_MC.currentFrame == 90){
				removeChild(RPplus2_MC);
				removeEventListener(Event.ENTER_FRAME, removestuff);
			}
		}

		public function TEBtn_Down(e:MouseEvent):void{
			thefeature = 41;
			SortMonsters();
			Load_App();
			theMonUI2 = new TEUI();
			addChild(theMonUI2);
			theMonUI2.Load_Icons();
			UI_Board_Container_MC.visible = false;
			RemoveUI();
			UI_App_Container_MC.UI_App_Cancel_Stage1.addEventListener(MouseEvent.MOUSE_UP, Cancel_TE);
		}

		public function Cancel_TE(e:MouseEvent){
			removeChild(UI_App_Container_MC);
			removeChild(theMonUI2);
			AddUI();
			Load_UI_Board(current_hex);
			UI_App_Container_MC.UI_App_Cancel_Stage1.removeEventListener(MouseEvent.MOUSE_UP, Cancel_TE);
		}

		public function UpdateTE(spec: uint):void{
			if (TE_Array.indexOf(spec) == -1){
				TE_Array.push(spec);
			}
		}

		public function Rest_Down(e:MouseEvent):void{
			thefeature = 31;
			Load_App();
			UI_Board_Container_MC.visible = false;
			overhead_MC.DiaryBtn.visible = false;
			UI_App_Container_MC.UI_App_Cancel_Stage1.addEventListener(MouseEvent.MOUSE_UP, Cancel_Down3);
			UI_App_Container_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, OkayRest);
		}

		public function OkayRest(e:MouseEvent):void{
			addChild(RestTrans_MC);
			RestTrans_MC.gotoAndPlay(1);
			RestTrans_MC.x = -640;
			RestTrans_MC.y = -300;
			removeChild(UI_App_Container_MC);
			addEventListener(Event.ENTER_FRAME, Resting);  
			UI_App_Container_MC.UI_App_Cancel_Stage1.removeEventListener(MouseEvent.MOUSE_UP, Cancel_Down3);
			UI_App_Container_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, OkayRest);
		}

		public function Cancel_Down3(e:MouseEvent){
			removeChild(UI_App_Container_MC);
			Load_UI_Board(current_hex);
			UI_App_Container_MC.UI_App_Cancel_Stage1.removeEventListener(MouseEvent.MOUSE_UP, Cancel_Down3);
			UI_App_Container_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, OkayRest);
		}

		public function Resting(e: Event):void{
			if (RestTrans_MC.currentFrame == 35){
				food = food - MonstersInventory_Array.length;
				if (food < 0){
					//monster leave
				}
				removeChild(RestTrans_MC);
				total_turn = total_turn + current_turn;
				current_turn = 5;
				Update_Indicator();
				Load_ReturnMsg(11);
				removeEventListener(Event.ENTER_FRAME, Resting);
			}
		}

		public function ExitHouse_Down(e:MouseEvent):void{
			Lv2_Map_Container_MC.QNestBtn.removeEventListener(MouseEvent.MOUSE_UP, QNest_Down);
			current_hex = 1;
			Load_Lv2(current_hex);
			Lv2_Map_Container_MC.x = -980;
			Lv2_Map_Container_MC.y = 0;
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			State_Func("ExitHouse");
		}

		public function ExitSG_Down(e:MouseEvent):void{
			current_hex = 905;
			Load_Lv2(current_hex);
			Load_UI_Board(current_hex);
			State_Func("ExitSG");
		}

		public function QNest_Down(e:MouseEvent):void{
			UI_Board_Container_MC.visible = false;
			RemoveUI();
			Load_ReturnMsg(12);
		}

		public function Scouting(e:MouseEvent):void{
			thefeature = 51;
			SortMonsters();
			Load_App();
			theMonUI = new MonsterUI();
			addChild(theMonUI);
			theMonUI.Load_Icons();
			UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Scout);
			UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_DOWN, OkayScout);
		}

		public function Cancel_Scout(e:MouseEvent):void{
			removeChild(UI_App_Container_MC);
			removeChild(theMonUI);
			AssignMon.length = 0;
			if (stage.contains(ArmyContainer)){
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
				removeChild(ArmyContainer);
			}
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Scout);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_DOWN, OkayScout);
		}

		public function OkayScout(e:MouseEvent):void{
			if (current_turn < 1){
				Load_ReturnMsg(0);
				removeChild(UI_App_Container_MC);
				removeChild(theMonUI);
				AssignMon.length = 0;
				while (ArmyContainer.numChildren > 0) {
					ArmyContainer.removeChildAt(0);
				}
			} else {
				if (AssignMon.length == 0){
					Load_ReturnMsg(16);
				} else {
					removeChild(theMonUI);
					while (ArmyContainer.numChildren > 0) {
						ArmyContainer.removeChildAt(0);
					}
					total_turn += 1;
					current_turn -= 1;
					Resources.turnPassed(1);
					Update_Indicator();
					removeChild(UI_App_Container_MC);
					Load_ReturnMsg(13);
					var Scout_App_Timer = new Timer(3000, 1);
					Scout_App_Timer.addEventListener(TimerEvent.TIMER, Scout_App);
					Scout_App_Timer.start();
					State_Func("Scout");
				}
			}
			UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Scout);
			UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_DOWN, OkayScout);
		}

		public function Scout_App(e: TimerEvent):void{
			var success = 0;
			var xnum = 0;
			var xnum2 = 0;
			var xnum3 = 0;

			for (var i: uint = 0; i < MonstersInventory_Array.length; i++){
				if (AssignMon[0] == MonstersInventory_Array[i].MemberNo){
					success = MonstersInventory_Array[i].Camouflage/100 * MonstersInventory_Array[i].Traveling/100;
					xnum = Math.random()/3;
					xnum2 = (1 - success)/2;
					xnum3 = Math.random();
					monname = MonstersInventory_Array[i].Species;
				}
			}
			if (xnum2 >= xnum3){
				Load_ReturnMsg(14);
			} else {
				if (success < xnum + 0.1){
					amountintel = "small";
					Load_ReturnMsg(15);
					if (AllTerritories_Array[current_hex].Unlocked < 1){
						AllTerritories_Array[current_hex].Unlocked = 1;
					}
				}
				if (success >= xnum + 0.1 && success < xnum + 0.2){
					amountintel = "some";
					Load_ReturnMsg(15);
					if (AllTerritories_Array[current_hex].Unlocked < 2){
						AllTerritories_Array[current_hex].Unlocked = 2;
					}
				}
				if (success >= xnum + 0.2){
					amountintel = "great";
					Load_ReturnMsg(15);
					if (AllTerritories_Array[current_hex].Unlocked < 3){
						AllTerritories_Array[current_hex].Unlocked = 3;
					}
				}
			}
			AssignMon.length = 0;
		}

		public function Intel(e:MouseEvent):void{
			thefeature = 61;
			Load_App();
			UI_App_Container_MC.UI_App_Cancel_Stage1.addEventListener(MouseEvent.MOUSE_UP, Cancel_Intel);
			Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);

			UI_App_Container_MC.Name_Text.text = "-";
			UI_App_Container_MC.Country_Text.text = "-";
			UI_App_Container_MC.Food_Text.text = "-";
			UI_App_Container_MC.Mineral_Text.text = "-";
			UI_App_Container_MC.Species_Text.text = "-";

			if (AllTerritories_Array[current_hex].Unlocked > 0){
				UI_App_Container_MC.Name_Text.text = String(AllTerritories_Array[current_hex].Name);
				UI_App_Container_MC.Country_Text.text = String(AllTerritories_Array[current_hex].Country);
				UI_App_Container_MC.Food_Text.text = String(AllTerritories_Array[current_hex].Food);
				UI_App_Container_MC.Mineral_Text.text = String(AllTerritories_Array[current_hex].Mineral);
			}
			if (AllTerritories_Array[current_hex].Unlocked > 1){
				theMonUI = new EnemyUI();
				addChild(theMonUI);
				theMonUI.Init();
			}
			if (AllTerritories_Array[current_hex].Unlocked > 2){
				UI_App_Container_MC.Species_Text.text = String(AllTerritories_Array[current_hex].Species);
			}
		}

		public function Cancel_Intel(e:MouseEvent){
			removeChild(UI_App_Container_MC);
			if (stage.contains(theMonUI)){
				removeChild(theMonUI);
			}
			Load_UI_Board(current_hex);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
		}

		public function Specialty(thespecies: uint):void{
			for (var i: uint = 0; i < MonstersInventory_Array.length; i++){
				if (thespecies == MonstersInventory_Array[i].ID){
					if (thespecies == 33){
						UI_Board_Container_MC.UI_Board_Content.UI_Intelligence_Stage.visible = true;
					}
					if (thespecies == 3){
						if (AllTerritories_Array[current_hex].TStatus == "Ally"){
							var somenum = Math.random();
							if (somenum >= 0.2){
								total_turn -= 1;
								current_turn += 1;
								Resources.turnPassed(1);
								Update_Indicator();
							}
						}
					}
				}
			}
		}

		public function State_Func(situation: String){
			trace(situation, Story_Progress[0]);
			if (situation == "Dialogue" && story_or_ten > 0){
				UI_Board_Container_MC.UI_Board_Content.UI_ContinueStory_Stage.visible = true;
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.removeEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.visible = false;
			}

			if (situation == "Dialogue" && Story_Progress[0] == 27){
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				UI_Popup_MC.visible = false;
				Load_UI_Board(current_hex);
				overhead_MC.visible = true;
				Story_Progress[0] += 1;
			}
			if (situation == "ExitHouse" && Story_Progress[0] == 26 && total_turn >= 5 && current_turn != 0){
				story_or_ten = 0;
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Popup_MC.visible = true;
				UI_Popup_MC.gotoAndStop(6);
				if (pregnantwith != 0){
					UI_Popup_MC.gotoAndStop(7);
				}
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				overhead_MC.visible = false;
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 25){
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				UI_Popup_MC.visible = false;
				Load_UI_Board(current_hex);
				overhead_MC.visible = true;
				Story_Progress[0] += 1;
			}
			if (situation == "House" && Story_Progress[0] == 24){
				story_or_ten = 0;
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Popup_MC.visible = true;
				UI_Popup_MC.gotoAndStop(6);
				if (pregnantwith != 0){
					UI_Popup_MC.gotoAndStop(7);
				}
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				overhead_MC.visible = false;
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 23){
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				UI_Popup_MC.visible = false;
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				Load_UI_Board(current_hex);
				Lv2_Map_Container_MC.HouseBtn.visible = true;
				Story_Progress[0] += 1;
			}
			if (situation == "SecretGarden" && Story_Progress[0] == 22){
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Popup_MC.visible = true;
				UI_Popup_MC.gotoAndStop(6);
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				Lv2_Map_Container_MC.HouseBtn.visible = false;
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 21){
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				Load_UI_Board(current_hex);
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Castle1_Down);
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.addEventListener(MouseEvent.MOUSE_DOWN, SecretGarden_Down);
				current_turn = 5;
				total_turn = 0;
				Update_Indicator();
				pregnantwith = 9;
				GiveBirth();
				UpdateTE(0);
				UpdateTE(9);
				overhead_MC.visible = true;
				Story_Progress[0] += 1;
			}
			if (situation == "Castle" && Story_Progress[0] == 20){
				UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
				removeChild(UI_ReturnMsg_MC);
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Castle1_Down);
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = false;
				UI_Board_Container_MC.visible = true;
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 19){
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = true;
				UI_Board_Container_MC.visible = false;
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				Story_Progress[0] += 1;
			}
			if (situation == "ExitSG" && Story_Progress[0] == 18){
				story_or_ten = 0;
				current_hex = 905;
				UI_Board_Container_MC.visible = true;
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Castle1_Down);
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = false;
				overhead_MC.visible = false;
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 17){
				UI_Popup_MC.visible = false;
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				Load_UI_Board(current_hex);
				UI_Board_Container_MC.UI_Board_Content.UI_ExitSG_Stage.visible = true;
				UI_Board_Container_MC.UI_Board_Content.UI_ExitSG_Stage.addEventListener(MouseEvent.MOUSE_DOWN, ExitSG_Down);
				UI_Board_Container_MC.UI_Board_Content.UI_Explore_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Explore);
				UI_Board_Container_MC.UI_Board_Content.UI_Bonding_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Bonding_SecretGarden);
				UI_Board_Container_MC.UI_Board_Content.UI_RoyalArmy_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, RoyalArmy_SecretGarden);
				UI_Board_Container_MC.UI_Board_Content.UI_Hunting_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Hunting_SecretGarden);
				UI_Board_Container_MC.UI_Board_Content.UI_Explore_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.UI_Bonding_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.UI_RoyalArmy_Stage.visible = false;
				UI_Board_Container_MC.UI_Board_Content.UI_Hunting_Stage.visible = false;
				Lv2_Map_Container_MC.HouseBtn.visible = false;
				Story_Progress[0] += 1;
			}
			if (situation == "Trans2" && Story_Progress[0] == 16){
				MonstersInventory_Array.length = 0;
				story_or_ten = 0;
				UI_Board_Container_MC.UI_Board_Content.visible = true;
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Popup_MC.visible = true;
				UI_Popup_MC.gotoAndStop(5);
				overhead_MC.visible = false;
				Load_ReturnMsg(5);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
				removeChild(UI_ReturnMsg_MC);
				UI_Board_Container_MC.visible = true;
				Story_Progress[0] += 1;
			}
			if (situation == "Lv2" && Story_Progress[0] == 16){
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(3);
				UI_Board_Container_MC.UI_Board_Content.visible = false;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 15){
				var mon = new Monsters(9);
				MonstersInventory_Array.push(mon);
				UI_Board_Container_MC.visible = false;
				MonstersInventory_Array[0].DiaProgress = 3;
				Load_SexInfo(0,9,1);
				Load_Trans();
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 14){
				UI_Popup_MC.visible = false;
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				Assign_Dialogue();
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 13){
				UI_Popup_MC.gotoAndStop(4);
				Story_Progress[0] += 1;
			}
			if (situation == "Explore" && Story_Progress[0] == 12){
				UI_Popup_MC.visible = true;
				UI_Popup_MC.gotoAndStop(3);
				UI_Board_Container_MC.visible = true;
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				Story_Progress[0] += 1;
			}
			if (situation == "Explore" && Story_Progress[0] == 10){
				removeEventListener(Event.ENTER_FRAME, Explore_App);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.addEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				Story_Progress[0] += 1;
				pregnantturn = 0;
			}
			if (situation == "Explore" && Story_Progress[0] == 9){
				removeEventListener(Event.ENTER_FRAME, Explore_App);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.addEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				Story_Progress[0] += 1;
				pregnantturn = 0;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 8){
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.removeEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				UI_Popup_MC.visible = false;
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				Load_UI_Board(current_hex);
				Story_Progress[0] += 1;
			}
			if (situation == "SecretGarden" && Story_Progress[0] == 7){
				//removeChild(UI_App_Container_MC);
				UI_Board_Container_MC.visible = true;
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				UI_Popup_MC.visible = true;
				UI_Popup_MC.gotoAndStop(2);
				Story_Progress[0] += 1;
			}
			if (situation == "Explore" && Story_Progress[0] == 5){
				removeEventListener(Event.ENTER_FRAME, Explore_App);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.addEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				Story_Progress[0] += 1;
				pregnantturn = 0;
			}
			if (situation == "Explore" && Story_Progress[0] == 4){
				removeEventListener(Event.ENTER_FRAME, Explore_App);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = true;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.addEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				Story_Progress[0] += 1;
			}
			if (situation == "SecretGarden" && Story_Progress[0] == 3){
				Lv2_Map_Container_MC.HouseBtn.visible = false;
				Story_Progress[0] += 1;
			}
			if (situation == "Dialogue" && Story_Progress[0] == 2){
				UI_Board_Container_MC.visible = false;
				UI_Popup_MC.visible = false;
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.visible = true;
				Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				addEventListener(Event.ENTER_FRAME, UI_Board_Lower);
				Story_Progress[0] += 1;
			}
			if (situation == "Castle" && Story_Progress[0] == 1){
				UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
				removeChild(UI_ReturnMsg_MC);
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Castle1_Down);
				Lv2_Map_Container_MC.Lv2_Hex1_CastleBtn_Stage.visible = false;
				UI_Board_Container_MC.visible = true;
				addEventListener(Event.ENTER_FRAME, UI_Board_Raise);
				UI_Board_Container_MC.UI_Board_Content.gotoAndStop(1);
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				UI_Board_Container_MC.UI_Board_Content.Dialogue_Btn.addEventListener(MouseEvent.MOUSE_DOWN, Dialogue_Down);
				Assign_Dialogue();
				UI_Popup_MC.visible = true;
				Story_Progress[0] += 1;
			}
			if (situation == "Lv2" && Story_Progress[0] == 0){
				overhead_MC.visible = false;
				UI_Board_Container_MC.visible = false;
				UI_Popup_MC.visible = false;
				Lv2_Map_Container_MC.Lv2_Hex1_SecretGardenBtn_Stage.visible = false;
				Story_Progress[0] += 1;

				/** pregnantwith = 1;
						GiveBirth();
						pregnantwith = 9;
						GiveBirth();
						pregnantwith = 1;
						GiveBirth();
						pregnantwith = 9;
						GiveBirth();
						pregnantwith = 1;
						GiveBirth();
						pregnantwith = 9;
						GiveBirth();
						pregnantwith = 1;
						GiveBirth();
						pregnantwith = 34;
						GiveBirth();  **/
			}

		}

		public function Intro_Explore(e:MouseEvent):void{
			if (Story_Progress[0] == 11){
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.removeEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				Story_Progress[0] += 1;
				pregnant_block = 3;
				State_Func("Explore");
			}
			if (Story_Progress[0] == 10){
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				Load_ReturnMsg(4);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.removeEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, OkayExplore);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
				hitormiss = 0;
			}
			if (Story_Progress[0] == 6){
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				Load_ReturnMsg(3);
				addChild(UI_Fabric_MC);
				UI_Fabric_MC.x = 594;
				UI_Fabric_MC.y = 282;
				UI_Fabric_MC.gotoAndStop(9);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.removeEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, OkayExplore);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Intro_SecretGarden);
				hitormiss = 0;
				Story_Progress[0] += 1;
			}
			if (Story_Progress[0] == 5){
				Lv2_Map_Container_MC.removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
				Load_ReturnMsg(4);
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.visible = false;
				Lv2_Map_Container_MC.Lv3_SecretGardenJungleBtn_Stage.removeEventListener(MouseEvent.MOUSE_UP, Intro_Explore);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, OkayExplore);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
				hitormiss = 0;
			}
		}

		public function Intro_SecretGarden(e:MouseEvent):void{
			story_or_ten = 0;
			if (stage.contains(UI_Fabric_MC)) removeChild(UI_Fabric_MC);
			removeChild(UI_ReturnMsg_MC);
			State_Func("SecretGarden");
			UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Intro_SecretGarden);
		}

		public function Dialogue_Down(e: Event){
			if (displayText.length != 0){
				UI_Board_Container_MC.UI_Board_Content.Dialogue.appendText(displayText);
				displayText = "";
			}
			else{
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = "";
				Assign_Dialogue();
			}
		}

		public function Assign_Dialogue():void{
			if (story_or_ten > 0 && sex_situation == 1){
				UI_Board_Container_MC.UI_Board_Content.Dialogue.text = Dialogue_Array[story_or_ten][0];
			}
			else{
				Dialogue_Progress[story_or_ten] += 1;
				if (Dialogue_Array[story_or_ten][Dialogue_Progress[story_or_ten]] == null ||
					Dialogue_Array[story_or_ten][Dialogue_Progress[story_or_ten]] == ""){
					State_Func("Dialogue");
				} 
				else {
					displayText = Dialogue_Array[story_or_ten][Dialogue_Progress[story_or_ten]];
					myTimer.addEventListener(TimerEvent.TIMER, typeText);
					myTimer.start();
				}
			}
		}

		public function typeText(event:TimerEvent):void{
			if(displayText.length == 0){
				myTimer.reset();
				myTimer.removeEventListener(TimerEvent.TIMER, typeText);
			}
			var nextLetter:String = displayText.charAt(0); 
			displayText = displayText.substr(1);
			UI_Board_Container_MC.UI_Board_Content.Dialogue.appendText(nextLetter);
		}

		public function UI_Board_Raise(e: Event){
			UI_Board_Container_MC.y -= 20;
			if (UI_Board_Container_MC.y <= 861){
				removeEventListener(Event.ENTER_FRAME, UI_Board_Raise);
			}
		}

		public function UI_Board_Lower(e: Event){
			UI_Board_Container_MC.y += 20;
			if (UI_Board_Container_MC.y >= 960){
				removeEventListener(Event.ENTER_FRAME, UI_Board_Lower);
			}
		}

		public function ManageText(feature: uint){
			if (feature == 1){
				UI_App_Container_MC.Text_Stage.text = "Search for Tentacle skin, also has a chance to encounter a Tentacle Monster in the area. If an encounter takes place, Lilith is 100% pregnant by the wild creature. Consume 1 Turn.";
			}
			if (feature == 11){
				UI_App_Container_MC.Text_Stage.text = "Organize Royal Army. Maximum 8 species can be brought to the battle. Consume 0 turn.";
			}
			if (feature == 21){
				UI_App_Container_MC.Text_Stage.text = "Assign a Tentacle Monster to hunt for food. The amount is determined by food resources in the territory, 2 unknown traits of the monster, and some luck. Consume 1 turn.";
			}
			if (feature == 31){
				UI_App_Container_MC.Text_Stage.text = "Taking rest will go to a new round. Enemies can make their move during the period. Take a rest now?";
			}
			if (feature == 41){
				UI_App_Container_MC.Text_Stage.text = "Each lore might contain useful information about the habitat and behavior of the wild creature. Obtaining Tentacle's deadskin can help identify the species in the Encyclopedia."  
			}
			if (feature == 51){
				UI_App_Container_MC.Text_Stage.text = "Assign a Tentacle Monster to acquire intel on the current territory. The mission's success and the amount of intel is determined by 2 unknown traits of the Monster. A great risk of injury is presented for the less qualified. Consume 1 turn."  
			}
			if (feature == 71){
				UI_App_Container_MC.Text_Stage.text = "Bond with a Tentacle Monster. The success of finding the monster is based on properly selecting its habitat in the Secret Garden, and sometimes, time of day and weather. Consume 2 turns."  
			}
		}

		public function All_Ally():void{
			for(var i:uint = 0; i < 61; i++){
				var new_mon = new Monsters(i);
				AllAllySpecies_Array.push(new_mon);
			}
		}

		public function All_Territories():void{
			for(var i:uint = 0; i < 1311; i++){
				var new_t = new Territories(i);
				AllTerritories_Array.push(new_t);
			}
		}

		public function All_Sound():void{
			var bm1 = new Sound_BgMusic1();
			Bm_Array[0] = bm1;

			var noise1 = new Sound_Jungle();
			BgNoise_Array[jungle] = noise1;
			BgNoise_Array[2] = noise1;
			BgNoise_Array[3] = noise1;
			BgNoise_Array[4] = noise1;
			BgNoise_Array[5] = noise1;
			BgNoise_Array[6] = noise1;
			BgNoise_Array[7] = noise1;
			BgNoise_Array[8] = noise1;
			BgNoise_Array[9] = noise1;

			var moan1 = new Sound_Butanga();
			Moan_Array[9] = moan1;
			var moan2 = new Sound_Dubois();
			Moan_Array[17] = moan2;
			var moan3 = new Sound_Inker();
			Moan_Array[5] = moan3;
			var moan4 = new Sound_SlimeEye();
			Moan_Array[34] = moan4;
		}

		public function Load_ReturnMsg(situation: uint):void{
			RemoveUI();
			addChild(UI_ReturnMsg_MC);
			UI_ReturnMsg_MC.x = 620;
			UI_ReturnMsg_MC.y = 383;

			if (situation == 0){
				UI_ReturnMsg_MC.gotoAndStop(2);
				AssignMon.length = 0;
				UI_ReturnMsg_MC.Text_Stage.text = "No more turn can be used before resting";
				if (stage.contains(UI_Narrative_MC)){
					UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, KeepExplore);
				} else {
					UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
				}
			}

			if (situation == 1){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Lilith is forbidden to enter the castle";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 2){
				UI_ReturnMsg_MC.gotoAndStop(1);
				UI_ReturnMsg_MC.Text_Stage.text = "Exploring...";
			}
			if (situation == 3){
				UI_ReturnMsg_MC.gotoAndStop(3);
				UI_ReturnMsg_MC.Text_Stage.text = "\n \nA Tentacle skin is discovered!";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, OkayExplore);
			}
			if (situation == 4){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Nothing was found";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, OkayExplore);
			}
			if (situation == 5){
				UI_ReturnMsg_MC.gotoAndStop(5);
				UI_ReturnMsg_MC.Text_Stage.text = "Lilith is pregnant. \n\n(Requires 2 turns to give birth)";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 6){
				UI_ReturnMsg_MC.gotoAndStop(1);
				UI_ReturnMsg_MC.Text_Stage.text = "Hunting...";
			}
			if (situation == 7){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Assign a Tentacle Monster";
				if (thefeature == 21){
					UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayHunt);
					UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Hunt);
				}
				if (thefeature == 71){
					UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_UP, OkayBond);
					UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Bond);
				}
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down2);
			}
			if (situation == 8){
				UI_ReturnMsg_MC.gotoAndStop(3);
				UI_ReturnMsg_MC.Text_Stage.text = "\n \n" + String(foundfood) + " pieces of food is brought home.";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 9){
				UI_ReturnMsg_MC.gotoAndStop(4);
				UI_ReturnMsg_MC.Text_Stage.text = "\n A new Tentacle Monster is born! \n(Requires 3 turns to mature)";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 10){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Lilith cannot go on adventure during pregnancy";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 11){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = String(MonstersInventory_Array.length) + " pieces of food were consumed by the army";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 12){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Available in future version";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 13){
				UI_ReturnMsg_MC.gotoAndStop(1);
				UI_ReturnMsg_MC.Text_Stage.text = "Scouting...";
			}
			if (situation == 14){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = String(monname) + " is returned injuried. Mission incompleted.";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 15){
				UI_ReturnMsg_MC.gotoAndStop(3);
				UI_ReturnMsg_MC.Text_Stage.text = String(monname) + " returned with " + String(amountintel) + " amount of intelligence. Requires another species to read its memory.";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 16){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Assign a Tentacle Monster";
				UI_App_Container_MC.UI_App_Cancel_Stage3.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel_Scout);
				UI_App_Container_MC.Okay.removeEventListener(MouseEvent.MOUSE_DOWN, OkayScout);
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_DOWN, Cancel2_Down3);
			}
			if (situation == 17){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Insufficient turns are available for the mission";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 18){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Monster was not found";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
			}
			if (situation == 19){
				UI_ReturnMsg_MC.gotoAndStop(3);
				UI_ReturnMsg_MC.Text_Stage.text = "\n \nA Tentacle skin is discovered!";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, KeepExplore);
			}
			if (situation == 20){
				UI_ReturnMsg_MC.gotoAndStop(2);
				UI_ReturnMsg_MC.Text_Stage.text = "Nothing was found";
				UI_ReturnMsg_MC.UI_App_Okay_Stage.addEventListener(MouseEvent.MOUSE_UP, KeepExplore);
			}
		}

		public function Cancel2_Down(e:MouseEvent){
			if (stage.contains(UI_Fabric_MC)){
				removeChild(UI_Fabric_MC);
			}
			removeChild(UI_ReturnMsg_MC);
			Load_UI_Board(current_hex);
			SortMonsters();
			AddUI();
			TurnEvent();
			UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Cancel2_Down);
		}

		public function Cancel2_Down2(e:MouseEvent){
			removeChild(UI_ReturnMsg_MC);
			if (thefeature == 21){
				UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_UP, OkayHunt);
				UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Hunt);
			}
			if (thefeature == 71){
				UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_UP, OkayBond);
				UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Bond);
			}
			UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Cancel2_Down2);
		}

		public function Cancel2_Down3(e:MouseEvent){
			removeChild(UI_ReturnMsg_MC);
			UI_App_Container_MC.UI_App_Cancel_Stage3.addEventListener(MouseEvent.MOUSE_DOWN, Cancel_Scout);
			UI_App_Container_MC.Okay.addEventListener(MouseEvent.MOUSE_DOWN, OkayScout);
			UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_DOWN, Cancel2_Down3);
		}

		public function Cancel2_Down4(e:MouseEvent){
			removeChild(UI_ReturnMsg_MC);
			Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
			UI_ReturnMsg_MC.UI_App_Okay_Stage.removeEventListener(MouseEvent.MOUSE_UP, Cancel2_Down4);
		}

		public function TurnEvent():void{
			if (pregnantturn <= total_turn - 2 && pregnantturn != 0){
				GiveBirth();
				RemoveUI();
				Load_ReturnMsg(9);
				UI_Board_Container_MC.visible = false;
			}
		}

		public function All_Dialogue():void{
			/** Dialogue_Array[0][0] = [""];
					Dialogue_Array[0][1] = ["                    [Castle]"];
					Dialogue_Array[0][2] = ["Lilith stands proudly before the castle gate, hands on her hips and a half smile playing on her lips."];
					Dialogue_Array[0][3] = ["Lilith: “I’ve got a good feeling about today.”"];
					Dialogue_Array[0][4] = ["She comments to herself as she head out through the main gate."];
					Dialogue_Array[0][5] = ["“Heading into the woods again, highness?” The castle guard on duty voices his concern, though he knows there’s no real reason to worry."];
					Dialogue_Array[0][6] = ["The lady of the castle often makes such journeys into the surrounding woods."];
					Dialogue_Array[0][7] = ["Even if he were to try and stop her, the sneaky girl would still find a way out there."];
					Dialogue_Array[0][8] = ["“Need to stock up on materials.” She grins. “My craft demands only the best.”"];
					Dialogue_Array[0][9] = ["The guard sighs and shakes his head. “As expected of our lady. Say, however do you make those fantastic garments?”"];
					Dialogue_Array[0][10] = ["Lilith grins a bit wider. “That’s a trade secret.”"];
					Dialogue_Array[0][11] = ["She bids farewell to the guard and heads out into the forest."];
					Dialogue_Array[0][12] = ["“Do be careful, highness. There have been rumors of strange tracks by the nearby mountain.” The guard calls after her,"];
					Dialogue_Array[0][13] = ["but by this point she just waves and darts into the trees."];
					Dialogue_Array[0][14] = [""];
					Dialogue_Array[0][15] = ["                [Secret Garden]"];
					Dialogue_Array[0][16] = ["Lilith runs her fingers across a piece of strangely smooth fabric. It’s supple like leather, but very resilient."];
					Dialogue_Array[0][17] = ["“I have no idea where this strange cloth comes from, but with my skills I can turn it into the strongest, lightest, most durable cloth on the market!”"];
					Dialogue_Array[0][18] = ["She smiles smugly to herself. “And I’m getting really good at tracking it down too! Hmm...”"];
					Dialogue_Array[0][19] = ["She puts a finger to her lips and ponders for a moment."];
					Dialogue_Array[0][20] = ["“It’s still pretty early. I bet I could get a bit more if I head a little deeper into the woods.”"];
					Dialogue_Array[0][21] = [""];
					Dialogue_Array[0][22] = ["A few hours later and she hits the jackpot. That strange cloth lies in big strips all about. It's practically carpeting the dense forest floor."];
					Dialogue_Array[0][23] = ["“This is amazing! I’ve never found so much before. I knew going in deep was the right choice!”"];
					Dialogue_Array[0][24] = ["“I can’t wait to get all this back to the castle. I’m gonna make such amazing things with this!”"];
					Dialogue_Array[0][25] = ["Her eyebrow suddenly raise in puzzlement. “That’s odd. This cloth is really warm… like it’s been sitting out in the sun…"];
					Dialogue_Array[0][26] = ["But hardly any sunlight could penetrate through the thick canopy… What exactly is this stuff?”"];
					Dialogue_Array[0][27] = [""];
					Dialogue_Array[0][28] = ["At that moment, a chill runs down Lilith’s spine. She tenses up and can’t shake the feeling that something… big… is watching her."];
					Dialogue_Array[0][29] = ["Slowly she turns around and gasps."];
					Dialogue_Array[0][30] = [""];
					Dialogue_Array[0][31] = ["“What…. What is that!?”"];
					Dialogue_Array[0][32] = ["The creature was huge! A writhing mass of tentacles all coiling and uncoiling as if in anticipation."];
					Dialogue_Array[0][33] = ["Lilith wanted to flee, but she was frozen in fear. A creeping suspicion slowly crept into the mind."];
					Dialogue_Array[0][34] = ["Something about the way that thing’s large bulbous eye was looking at her…. Was that….. Desire?"];
					Dialogue_Array[0][35] = ["“Goddess no! It… it wants to mate!” At this realization Lilith snaps out of her fear and takes off in a sprint toward the edge of the woods."];
					Dialogue_Array[0][36] = ["But the creature is surprisingly swift for its size. It keeps pace with her easily, almost as if was enjoying this."];
					Dialogue_Array[0][37] = ["Lilith’s mind races. What could that thing be? It’s obviously a monster, but she’d never seen anything like that in any of her books."];
					Dialogue_Array[0][38] = ["And its skin! So similar to the fabric she’d been collecting. In fact, the dress she wore even now bore a striking resemblance."];
					Dialogue_Array[0][39] = ["“Oh my goodness, maybe it thinks I’m a female of its species!? I’ve got to escape before---“"];
					Dialogue_Array[0][40] = ["But even as she voiced her concerns aloud, a thin tentacle coiled stealthily around her long slender leg and suddenly squeezed."];
					Dialogue_Array[0][41] = ["She lurched forward, stumbling wildly and fell face first into a thankfully soft bed of moss."];
					Dialogue_Array[0][42] = ["The creature, still having a solid grip on her leg..."];
					Dialogue_Array[0][43] = ["Slowly lifted her into the air making her dress flip upward revealing even more of her toned legs and finally showing off a pair of embarrassingly pink panties."];
					Dialogue_Array[0][44] = ["Lilith's face flushed bright red as she tried to hold her dress in place. “Noo! I can’t escape! He’s too strong!”"];
					Dialogue_Array[0][45] = ["She desperately tries to calm herself and think of a plan. “I must make it out of here alive, even if… even if it means letting him...”"];
					Dialogue_Array[0][46] = ["She swallows thickly, not yet ready to say her intentions aloud."];
					Dialogue_Array[0][47] = ["By this point a second tendril has joined the first and their coiling their way up her legs ever closer to their prize."];
					Dialogue_Array[0][48] = ["The creature seems even more excited, breathing heavily already and its eye fixated on her panties."];
					Dialogue_Array[0][49] = ["Lilith takes a deep breath, finally managing to find her words despite being held upside down. “You there, monster. You just want… want to...”"];
					Dialogue_Array[0][50] = ["Her voice trembles but she forces the words out “...to m...mate with me, right?”"];
					Dialogue_Array[0][51] = ["As if in response, the tentacles binding her legs squeeze her gently."];
					Dialogue_Array[0][52] = ["“Ohhh, aren’t you eager!” She gasps, almost smiling at this creature’s surprisingly tender reaction."];
					Dialogue_Array[0][53] = ["“Well… do you promise to let me go if I… if I do it with you?”"];
					Dialogue_Array[0][54] = ["She tries to adopt a stern face, but it’s especially difficult to hold any authority while you're upside down with your panties on display."];
					Dialogue_Array[0][55] = ["The monster nods its huge head and even more tentacles rush in to caress her exposed body."];
					Dialogue_Array[0][56] = ["They slide and slither over every part of her legs and arms, holding her tightly yet making sure not to harm her."];
					Dialogue_Array[0][57] = ["“Aww, you’re kinda cute actually, now that I get a good look at you. Okay.” She nods, mostly to herself, “I’ll do it!”"];
					Dialogue_Array[0][58] = ["The beast needs no further instructions. Almost immediately it pulls her closer, while literally tearing her panties from her body."];
					Dialogue_Array[0][59] = ["Lilith gasps again at the sudden movement, but this time partly in pleasure."];
					Dialogue_Array[0][60] = ["Something about this creature is… affecting her. Could it be pheromones?"];
					Dialogue_Array[0][61] = ["She didn't have time to consider it because the next thing she knew her mouth was opening wide in a long moan as that first delicate tentacle slides up against her now bare pussy."];
					Dialogue_Array[0][62] = ["It’s as thin as a finger, but its movements are amazingly precise."];
					Dialogue_Array[0][63] = ["“Ooohh Mmyy, that’s… ooOOh.” She moans aloud as this terrifying creature plays her body like a fine violin."];
					Dialogue_Array[0][64] = ["More tentacles join in and soon her body is writhing in pleasure as each tentacle tends to a different part of her."];
					Dialogue_Array[0][65] = ["Through her sex-haze, Lilith spots an especially thick tentacle emerging from the lower half of the beast’s main body. It’s thick and pulsating."];
					Dialogue_Array[0][66] = ["“Oh goddess, that will never fit in me!” Her eyes widen in fear, but she doesn’t struggle. It’s not like she could escape even if she tried."];
					Dialogue_Array[0][67] = [""];
					Dialogue_Array[0][68] = ["Some time later she groans, her aching body slowly waking up. She’s soaking wet, and still covered in sticky slime. The monster is long gone."];
					Dialogue_Array[0][69] = ["“Oh my goodness. I can’t believe I actually did that… I’m ruined… I let that beast breed me! What man would want me now?”"];
					Dialogue_Array[0][70] = ["Despite her words, a slight smirk hangs on Lilith’s lips. After all, it wasn’t exactly an unpleasant experience."];
			Dialogue_Array[0][71] = ["“No sense in crying over spilled… slime,” she chuckles to herself and gets shakily to her feet. “ I’ve got to get back to the castle!”"];
			Dialogue_Array[0][72] = [""];
			Dialogue_Array[0][73] = ["                   [Return]"];
			Dialogue_Array[0][74] = ["It was already dark. Apparently that eager beast spent quite a few hours happily mating with Lilith."];
			Dialogue_Array[0][75] = ["She blushes in retrospect at the naughty thoughts as she makes her way back toward the castle on shaky legs."];
			Dialogue_Array[0][76] = ["She knew the route well having made so many journeys into these woods to collect fabric. In fact, it’s odd she’d never encountered any of those creatures before now."];
			Dialogue_Array[0][77] = ["Then, just as she was reaching the treeline, an odd sensation began to sweep across Lilith’s body. Her belly began to swell noticeably."];
			Dialogue_Array[0][78] = ["“What the… what’s happening to me!?” She steadies herself on a nearby tree, and tries to catch her breath. "];
			Dialogue_Array[0][79] = ["“It couldn’t be… That beast… he really did...” She shakes her head back and forth rapidly, trying to regain her wits."];
			Dialogue_Array[0][80] = ["“There’s so much I don’t know about these creatures… if I’m showing signs of pregnancy this fast… I really have to hurry. I can’t give birth out here!”"];
			Dialogue_Array[0][81] = ["With that, the young noble gathered previously unseen stamina and started rushing back toward the castle."];
			Dialogue_Array[0][82] = ["All the while her belly continued to grow. By the time the castle was in sight, she was covered in sweat and her breathing was labored."];
			Dialogue_Array[0][83] = ["“Noo.. Just a little further… I have to make it….Aaahhhh!” With a cry of pain, Lilith fell to her knees clutching her belly. This little creature would weight no longer."];
			Dialogue_Array[0][84] = [""];
			Dialogue_Array[0][85] = ["                [Inside the Castle]"];
			Dialogue_Array[0][86] = ["High up in the easternmost tower of the castle, a stern countenance gazes down at the figure of a woman struggling in the field just outside the castle."];
			Dialogue_Array[0][87] = ["His features are severe, his lips drawn into a thin frown."];
			Dialogue_Array[0][88] = ["“Just what exactly has our little lady been up to these past days?” He voices his question to the silent tower room and continues to observe."];
			Dialogue_Array[0][89] = ["For the better part of an hour, his steel gray eyes do not react in the slightest."];
			Dialogue_Array[0][90] = ["Then, at almost midnight exactly those unfeeling eyes widen ever so slightly."];
			Dialogue_Array[0][91] = ["His expression immediately shifts to one of disgust."];
			Dialogue_Array[0][92] = ["“Harlot.” He mutters to himself, then turns on his heel, cloak flourishing as he make his way down the stairs."];
			Dialogue_Array[0][93] = ["                  [At the Field]"];
			Dialogue_Array[0][94] = ["This was it! Deep in the throes of labor, Lilith was about to give birth to something totally unknown."];
			Dialogue_Array[0][95] = ["With a final cry and a firm push she felt something change."];
			Dialogue_Array[0][96] = ["Oddly there was no pain, just a suspiciously slimy sensation between her legs."];
			Dialogue_Array[0][97] = ["Quickly she scooped up the little bundle of tentacles into her arms. She was a mess. Covered in sweat and slime, but this was her own child."];
			Dialogue_Array[0][98] = ["It bore none of her features except for the color of its one eye; a color being similar to hers."];
			Dialogue_Array[0][99] = ["“Disgusting!” The shout shocked Lilith out of her stupor and she looked up in horror."];
			Dialogue_Array[0][100] = ["There, standing some fifty feet away was her uncle, Count Urias, the current lord of this castle. His narrow eyes held only disgust for her."];
			Dialogue_Array[0][101] = ["“You would disgrace our family by cavorting with such filthy beasts!? Lilith, what do you have to say in your defense?”"];
			Dialogue_Array[0][102] = ["She opened her mouth to speak, but he immediately cut her off. “Silence, whore! I won’t hear your excuses.”"];
			Dialogue_Array[0][103] = ["“This is unforgivable. You are hereby banished from our lands.”"];
			Dialogue_Array[0][104] = ["“Take your hideous spawn and begone from my sight. Should I catch even a glimpse of you again, I will have you killed.”"];
			Dialogue_Array[0][105] = ["Lilith, still reeling from her recent experiences, couldn’t even offer a retort."];
			Dialogue_Array[0][106] = ["Instead she ran. She fled clutching her newborn baby in her arms closely as she hurriedly escaped back into the forest."];
			Dialogue_Array[0][107] = ["She had no idea what she would do now. She was cast out by her own family."];
			Dialogue_Array[0][108] = ["However, instead of crying and giving in to despair, a look of raw determination flickered in her eyes."];
			Dialogue_Array[0][109] = ["Lilith would not give up and let herself die here."];
			Dialogue_Array[0][110] = ["No, she was far too stubborn for that."];
			Dialogue_Array[0][111] = ["Her decisions in the coming months and years would change the world completely."];
			Dialogue_Array[0][112] = [""];
			Dialogue_Array[0][113] = ["Lilith paces back and forth in a small clearing, her expression strained. “I can’t believe this is happening! What am I going to do!?”"];
			Dialogue_Array[0][114] = ["Suddenly she stops and clenches her fists as a look of determination replaces her previous anxiety."];
			Dialogue_Array[0][115] = ["“No. I can’t let myself fall apart now. I’ve got to come up with a plan.” She nods to herself as if to validate her newfound conviction before beginning her pacing anew."];
			Dialogue_Array[0][116] = ["“There’s an old house across the bridge on the hill. I’ve passed it a thousand times before and I’m pretty sure it’s abandoned. I can use that as shelter for now at least.”"];
			Dialogue_Array[0][117] = ["Her monologue is suddenly interrupted by the an obvious rumbling coming from her stomach. “Ah, food! What am I going to eat!?”"];
			Dialogue_Array[0][118] = ["Then, as if on cue to answer her concerns, a newborn tentacled creature comes slithering out of the woods, something carefully bundled up in its limbs."];
			Dialogue_Array[0][119] = ["“Hello, little one.” Lilith kneels down, smiling. “What’s that you’ve got? Oh, a fish?” Her stomach growls again in anticipation. “Is this for me?”"];
			Dialogue_Array[0][120] = ["The little creature wiggles happily, extending the somewhat slimy fish as an offering."];
			Dialogue_Array[0][121] = ["“Thank you!” Lilith manages to contain her excitement well, but this gave her ideas. Perhaps her children will become her answer for all her hunting needs."];
			Dialogue_Array[0][122] = [""];
			Dialogue_Array[0][123] = ["Lilith sits on a worn down wooden chair in front of an equally rickety desk. The desk is covered with parchment and various scribblings."];
			Dialogue_Array[0][124] = ["“Oh an Encyclopedia about wild beasts, that could be useful someday.”"];
			Dialogue_Array[0][125] = ["She taps the end of her quill in the inkwell and taps her foot as she ponders."];
			Dialogue_Array[0][126] = ["“There are just so many different types of tentacle monsters. I had no idea there were such a wide variety.”"];
			Dialogue_Array[0][127] = ["She begins writing rapidly, making entry after entry, doing her best to compile everything she’s learned in one convenient place."];
			Dialogue_Array[0][128] = ["“There. This is a good start. I’ll catalogue them with by their types. All I’ll need is a bit of hide and I should be able to easily match their species.” She nods, smiling to herself."];
			Dialogue_Array[0][129] = [""];
			Dialogue_Array[0][130] = ["A rustling in the nearby forest suddenly wakes Lilith from her slumber."];
			Dialogue_Array[0][131] = ["She’s mostly gotten used to the strange creatures’ comings and goings, but even now she wakes from the slightest sound."];
			Dialogue_Array[0][132] = ["“Who’s there?” She calls out tentatively."];
			Dialogue_Array[0][133] = ["One of the larger beasts emerges from the woods, it’s single purple eye glowing dimly."];
			Dialogue_Array[0][134] = ["“Oh gods above, it’s that one!” Memories of her first encounter with these creatures came flooding back into her mind causing a bright red blush to cross her delicate features."];
			Dialogue_Array[0][135] = ["But then, she suddenly recognized it."];
			Dialogue_Array[0][136] = ["“Oh, it’s you! You’re all grown up so fast?” She smiles warmly. This was her first child.  “What did you bring me?”"];
			Dialogue_Array[0][137] = ["The beast extends a tentacle and drops a severed head on the ground."];
			Dialogue_Array[0][138] = ["Lilith gasps and jumps back. “A head! What? Why would you bring me that!? Wait a minute… I think I recognize this monster…one of our enemies?”"];
			Dialogue_Array[0][139] = ["The large creature simply nods."];
			Dialogue_Array[0][140] = ["Lilith pauses and takes a breath as she tries to figure out what her child means by bringing this to her. "];
			Dialogue_Array[0][141] = ["Could it be some kind of communication about her enemies? “If you were able to bring me a head, that must mean you know where their camp is?“"];
			Dialogue_Array[0][142] = ["“This could be really useful. Knowing where my enemies are will go a long way to helping me to sleep at night.”"];
			Dialogue_Array[0][143] = [""];
			Dialogue_Array[0][144] = [""];
			Dialogue_Array[0][145] = [""];
			Dialogue_Array[0][146] = [""];


			//Dialogue_Array[0][35] = [""];
			//[" "];

			Dialogue_Array[butanga][0] = ["Butanga"];
			Dialogue_Array[butanga][1] = ["The monster’s arm-like cock slithers closer leaving a trail of transparent slime oozing from the tip. It coils around her waist, slips down between her legs and…"];
			Dialogue_Array[butanga][2] = ["Sex"];
			Dialogue_Array[butanga][3] = ["“Gods above! Oooohohh, it’s going in! I can't believe I’m taking it!” She gasps and moans."];
			Dialogue_Array[butanga][4] = ["Her breath coming now in great heaves as the beast’s thick cock saws slowly in and out of her."];
			Dialogue_Array[butanga][5] = ["“Nooo Tooo...I can’t take it… G...gonna...” Lilith’s body tenses up and quivers."];
			Dialogue_Array[butanga][6] = ["Her vision blurs and her toes curl. Right now nothing exists except for her body and those glorious writhing tendrils taking her to heaven."];
			Dialogue_Array[butanga][7] = ["Then, right in at the height of her orgasmic bliss, the beast’s member also swells up, stretching her tight hole even wider. He’s at his limit too."];
			Dialogue_Array[butanga][8] = ["“Mmmhhh!!” Lilith gasps, eyes widening as the creature thrusts in deep."];
			Dialogue_Array[butanga][9] = ["She bites her lip and tries to stop the moan from escaping. “Ooh.. mmMMmm.” She whimpers, her mind reeling."];
			Dialogue_Array[butanga][10] = ["The monster is more than happy push her pleasure to the limit, it’s tentacle quivering as it unleashes an unholy blast of monster cum deep inside."];
			Dialogue_Array[butanga][11] = ["“It’s so thick! Nooo! I can’t!” Despite her demure response, a distinctly lewd expression has dominated her face as the creature finally goes over the edge."];
			Dialogue_Array[butanga][12] = ["Over and over again the great beast pumps poor Lilith’s helpless body, shooting load after sticky load inside her until at long last she loses consciousness."];
			Dialogue_Array[butanga][13] = [""];
			Dialogue_Array[butanga][14] = ["Bonding1"];
			Dialogue_Array[butanga][15] = ["Bonding2"];
			Dialogue_Array[butanga][16] = ["Sex"];
			Dialogue_Array[butanga][17] = ["Lilith: "];
			Dialogue_Array[butanga][18] = ["Guess the Monster's Emotion"];
			Dialogue_Array[butanga][19] = ["Proud"];
			Dialogue_Array[butanga][20] = ["Confused"];
			Dialogue_Array[butanga][21] = ["B"];
			Dialogue_Array[butanga][22] = ["Line A1"];
			Dialogue_Array[butanga][23] = ["Line A2"];
			Dialogue_Array[butanga][24] = ["Jump"];
			Dialogue_Array[butanga][25] = ["Line B1"];
			Dialogue_Array[butanga][26] = ["Line B2"];
			Dialogue_Array[butanga][27] = ["Merge"];
			Dialogue_Array[butanga][28] = ["Mainline1"];
			Dialogue_Array[butanga][29] = ["Mainline2"];
			Dialogue_Array[butanga][30] = [""];
			Dialogue_Array[butanga][31] = ["End"]; **/

				Dialogue_Array[dubois][0] = ["Dubois"];
			Dialogue_Array[dubois][1] = ["Entering the dark cave, Lilith could hear the dripping of moisture from the rocks above, the only sound comforting her in the underground maze."];
			Dialogue_Array[dubois][2] = ["As she continued exploring, the Dubois slowly slithered around the stalactites above, peering down and tracking her movements with its beady eyes."];
			Dialogue_Array[dubois][3] = ["Lilith had no idea the creature was there, watching her, but it soon made its presence known as it left a trail of slime which dripped onto the floor. "];
			Dialogue_Array[dubois][4] = ["Lilith froze, her skin tingling with an almost electric fear as she spun on her heel."];
			Dialogue_Array[dubois][5] = ["“Whose there?! Show yourself!”"];
			Dialogue_Array[dubois][6] = ["Looking back, there was nothing but the mouth of the cavern she had entered from."];
			Dialogue_Array[dubois][7] = ["Her legs trembled for a moment, but soon after, she shook her head, trying to refocus herself."];
			Dialogue_Array[dubois][8] = ["“You fool…you are royalty! Why am I scared of these noises…they should be fearful of me!”"];
			Dialogue_Array[dubois][9] = ["Her confidence soon disappeared as her body was launched into the air, a creature slamming into her legs, her limbs flailing to try and catch her fall."];
			Dialogue_Array[dubois][10] = ["The soft yet thick tail end of the Dubois wrapped around her, both constricting her limbs and cushioning her fall."];
			Dialogue_Array[dubois][11] = ["The Dubois slimy flesh tightened against her own; not enough to prevent her from breathing, but definitely enough to keep her still, no matter her efforts."];
			Dialogue_Array[dubois][12] = ["Lilith toughened up, unsure of the new creature’s intentions, but not willing to let it toy with her like some common peasant."];
			Dialogue_Array[dubois][13] = ["“Who dares to touch me?!” Lilith looked up to see the bulbous head of the creature appear."];
			Dialogue_Array[dubois][14] = ["It looked snake-like in appearance, though she could see what vaguely resembled a cock head as well, along with two strange flaps lower down its neck."];
			Dialogue_Array[dubois][15] = ["Her eyes were wide, fear gripping her chest initially, but soon, she felt some form of ease knowing exactly what had been stalking her in the darkness."];
			Dialogue_Array[dubois][16] = ["“Oh…oh Gods, wow…you’re quite the specimen, aren’t you? Tell me, what do you do-”"];
			Dialogue_Array[dubois][17] = ["Lilith didn’t get the chance to say her next words, the creature launching towards her mouth, shoving its entire head down her throat."];
			Dialogue_Array[dubois][18] = ["Her neck and jaw expanding to accommodate the creature, her screams were quelled, her hands struggling to try and grab her throat and pull the creature out;"];
			Dialogue_Array[dubois][19] = ["the Dubois’ long body wrapped itself tighter around her, as if bracing for an orgasm already, and assuring itself she wouldn’t be able to run off while it was vulnerable."];
			Dialogue_Array[dubois][20] = ["Sex"];
			Dialogue_Array[dubois][21] = ["“Gak, ghakk!” Lilith tried to force it out of her throat, her face turning blue as she ran out of air, the Dubois quite aware of this."];
			Dialogue_Array[dubois][22] = ["The creature thrusted into and out of her stomach like a cock fucking a moist womb,"];
			Dialogue_Array[dubois][23] = ["Lilith’s eyes going crossed as she felt some strange arousal overtaking her body against her will, her body shaking alongside the creature’s as it continued."];
			Dialogue_Array[dubois][24] = ["The beast’s tail slithered around her legs, approaching her plump ass, attempting to slip into one of her holes,"];
			Dialogue_Array[dubois][25] = ["though for the life of her she couldn’t focus on that as her lungs stung from the lack of oxygen."];
			Dialogue_Array[dubois][26] = ["The creature pulled out long enough for Lilith to suck in more air, her face going from blue to red once more, coughing up what felt like a mix of saliva and pre-cum;"];
			Dialogue_Array[dubois][27] = ["why the viscous, white fluid would be emitted from the head of a creature, she had no idea."];
			Dialogue_Array[dubois][28] = ["“Agghh, ugh…well, my oh my, you enjoy mouths, don’t you?”"];
			Dialogue_Array[dubois][29] = ["She looked into the creature’s eyes again, the Dubois foaming at its ‘mouth’, seemingly ready to climax within her."];
			Dialogue_Array[dubois][30] = ["“Well, aren’t you a playful one…you going to keep going or–”"];
			Dialogue_Array[dubois][31] = ["Once again, Lilith couldn’t finish her sentence, the Dubois shooting into her throat once more, though not as rough as it had the first time."];
			Dialogue_Array[dubois][32] = ["Lilith attempted to conserve her oxygen by staying still, the beast deep inside her body at this point, feeling it writhing in her stomach."];
			Dialogue_Array[dubois][33] = ["Moments later, it stopped, stuffed as far inside her belly as it could, a strange liquid began to launch from the creature."];
			Dialogue_Array[dubois][34] = ["Her stomach began to fill with sperm slowly, the goo climbing up her esophagus and out of her mouth."];
			Dialogue_Array[dubois][35] = ["The creature pulled out, spitting a few more ounces of seed onto her face, semen from her stomach frothing up and pouring from her mouth and nose, causing her to cough once more."];
			Dialogue_Array[dubois][36] = ["She was soon lain on the cold cavern floor as the creature released her, slithering away,"];
			Dialogue_Array[dubois][37] = ["leaving her with a belly full of monster seed and a face covered in the same strange white goo."];
			Dialogue_Array[dubois][38] = ["Lilith made a mental note to remember this behavior for the next time she faced such a creature, seeing as it enjoyed ambushing its prey."];
			Dialogue_Array[dubois][39] = ["“Well…so much for getting insight of this species…for now.”"];
			Dialogue_Array[dubois][40] = [""];
			Dialogue_Array[dubois][41] = ["Lilith once again entered the cavern, feeling the cool air touch her soft, pale skin. "];
			Dialogue_Array[dubois][42] = ["She knew the creature which had filled her with white, sticky seed before was still inside;"];
			Dialogue_Array[dubois][43] = ["after all, no other creatures lived in this cave, or ever went near it."];
			Dialogue_Array[dubois][44] = ["She was the only brave soul to do so, and she needed to know more about it, something drove her to see it again."];
			Dialogue_Array[dubois][45] = ["“Where are you? Reveal yourself, monster!”"];
			Dialogue_Array[dubois][46] = ["She knew the Dubois was in here, but knowing how silent and stealthy it was, it would take some impressive investigation skills to find it."];
			Dialogue_Array[dubois][47] = ["After several minutes, Lilith was almost disheartened and nearly gave up, turning to the entrance and beginning to walk away."];
			Dialogue_Array[dubois][48] = ["The Dubois, noticing her demeanor had shifted from curious to somewhat down, sprung at that moment, racing towards her and wrapping around her body once more."];
			Dialogue_Array[dubois][49] = ["Lilith squealed almost with delight as she landed on her ass."];
			Dialogue_Array[dubois][50] = ["The Dubois spread her legs, slithering between them to begin lapping at both her asshole and her pussy with its large head."];
			Dialogue_Array[dubois][51] = ["It began to nudge at her hole and tightening around her, using her own body as leverage as it attempted to enter her asshole."];
			Dialogue_Array[dubois][52] = ["Sex"];
			Dialogue_Array[dubois][53] = ["“Oh…oh my, you’re eager to get in there…agh!”"];
			Dialogue_Array[dubois][54] = ["Her asshole spread as the Dubois rammed its slick head into the tiny hole, spreading it as it wormed through her intestines."];
			Dialogue_Array[dubois][55] = ["Her stomach contorted and writhed as the tentacle creature entered her stomach and began to fuck her slowly. “At…at least…I can breathe this time…oh Gods, it’s so thick…”"];
			Dialogue_Array[dubois][56] = ["Lilith had no idea what the Dubois was thinking as it was ramming into her bowels and fucking her stomach from the other end,"];
			Dialogue_Array[dubois][57] = ["her tits jiggling as she took the monster in her asshole."];
			Dialogue_Array[dubois][58] = ["Her eyes fluttered as she struggled to not orgasm already as her womb began to quiver more intensely than before."];
			Dialogue_Array[dubois][59] = ["She wanted to make the experience enjoyable for the creature as well, though she had no idea whether it wanted its prey to struggle in its grasp."];
			Dialogue_Array[dubois][60] = ["Perhaps the struggle aroused it, made it feel like it was dominating whatever it was violating?"];
			Dialogue_Array[dubois][61] = ["Or, maybe it frightened it, preferring prey which was more likely to relent to its grasp?"];
			Dialogue_Array[dubois][62] = ["Guess the Monster's Emotion"];
			Dialogue_Array[dubois][63] = ["Excited"];
			Dialogue_Array[dubois][64] = ["Scared"];
			Dialogue_Array[dubois][65] = ["A"];
			Dialogue_Array[dubois][66] = ["“Come hither, beast…let’s see if you like a bit of this!”"];
			Dialogue_Array[dubois][67] = ["Lilith began to struggle and scream – though not too loud – trying to seem helpless and frightened of the Dubois’ grasp."];
			Dialogue_Array[dubois][68] = ["The Dubois seemed to slow down, less intense than before, sliding in and out of her in a rhythmic, almost sensually."];
			Dialogue_Array[dubois][69] = ["The slower sex made her pussy quiver with a need for release, both Lilith and the Dubois ready to explode at that moment."];
			Dialogue_Array[dubois][70] = ["The creature grew more aroused the longer Lilith struggled, some innate sense telling Lilith she was doing something right."];
			Dialogue_Array[dubois][71] = ["Jump"];
			Dialogue_Array[dubois][72] = ["“Calm yourself, Lilith…let it go about its business, don’t enjoy yourself too much…”"];
			Dialogue_Array[dubois][73] = ["Lilith remained still as a board, not wanting the frighten the Dubois as it slithered inside her,"];
			Dialogue_Array[dubois][74] = ["biting her lip as she tried to stop herself from cumming and shaking in its grasp."];
			Dialogue_Array[dubois][75] = ["The creature began to fuck her faster and harder, her belly bulging and writhing faster, her pussy ready to burst with pleasure."];
			Dialogue_Array[dubois][76] = ["The Dubois seemed to be goading her into struggling, wanting her to shake with fear and arousal in its grasp."];
			Dialogue_Array[dubois][77] = ["Merge"];
			Dialogue_Array[dubois][78] = ["The Dubois shoved itself deep in her asshole once more, cumming hard as Lilith screamed, her own orgasm launching her cum out of her pussy, spraying the clear juices across the cave."];
			Dialogue_Array[dubois][79] = ["The liquid covered her legs and the tendril of the monster, the Dubois launched volleys of sperm inside her, the goo filling her up as before."];
			Dialogue_Array[dubois][80] = ["Opening her mouth, the seed poured out over her face, covering her in the white goo and soaking her hair fully as it drained onto the cavern floor."];
			Dialogue_Array[dubois][81] = ["She tried to close her mouth, but the sheer volume of seed prevented her from shutting it, more and more sperm ejecting itself from her throat."];
			Dialogue_Array[dubois][82] = ["The Dubois finally finished, pulling its head out of her asshole and slithering off."];
			Dialogue_Array[dubois][83] = ["Lilith was left alone and seed-covered in the cave, slowly standing and brushing herself from the dirt on her legs."];
			Dialogue_Array[dubois][84] = ["She walked from the cave, licking the white goo off of her face, a bit more educated than before as to the nature of the Dubois."];
			Dialogue_Array[dubois][85] = ["“Fascinating…I don’t think it’ll mind me coming back for thirds eventually…”"];
			Dialogue_Array[dubois][86] = [""];
			Dialogue_Array[dubois][87] = ["Once more, Lilith entered the cave which had become so familiar with her, trying to find her curious friend, the Dubois."];
			Dialogue_Array[dubois][88] = ["She had grown fond of its less than subtle violations, finding it almost endearing, though quite arousing still."];
			Dialogue_Array[dubois][89] = ["And, surprisingly, she found it was far easier to spot the creature;"];
			Dialogue_Array[dubois][90] = ["the tentacle monster was hanging from the stalactites, peering at her form the darkness, its large eyes almost glowing as light filtered into the cave."];
			Dialogue_Array[dubois][91] = ["“Ah, there you are…I was afraid you had abandoned this place.”"];
			Dialogue_Array[dubois][92] = ["Lilith grinned, kneeling as to seem more submissive for the creature, seeing it being to drop to the floor and approach her slowly."];
			Dialogue_Array[dubois][93] = ["“Come hither; you need not fear me…you know me quite well.”"];
			Dialogue_Array[dubois][94] = ["The Dubois, unlike the previous times it had encountered the busty royal woman,"];
			Dialogue_Array[dubois][95] = ["slowly encircled her with its body, slithering around as if observing her more intently before it began to wrap around her legs."];
			Dialogue_Array[dubois][96] = ["Lilith giggled, falling on her backside as she allowed the Dubois to firmly grasp her body."];
			Dialogue_Array[dubois][97] = ["Its body contorted and wrapped tighter around her arms and chest, playing with her body, Lilith sensing it was beginning to enjoy playing with its favorite prey."];
			Dialogue_Array[dubois][98] = ["“You’re quite the intriguing one, I must say…what else will you surprise me with?”"];
			Dialogue_Array[dubois][99] = ["The Dubois approached her mouth, slithering up to her face, and gently prodding at her lips, as if asking for permission to enter her body as it had the first time."];
			Dialogue_Array[dubois][100] = ["“You want to be inside me once more? Then please, enter me, gentle beast.”"];
			Dialogue_Array[dubois][101] = ["Lilith smiled, nuzzling up to the mouth of the creature before opening her mouth wide, allowing it to stuff itself in her mouth, and then descend down her throat."];
			Dialogue_Array[dubois][102] = ["Sex"];
			Dialogue_Array[dubois][103] = ["Lilith moaned as it moved down, trying to contort itself as to allow her to breath as it penetrated her esophagus, her face red, but not blue, still breathing relatively well despite her situation."];
			Dialogue_Array[dubois][104] = ["Lilith wanted to know what might help the Dubois feel comfortable inside her, and she thought of her actions,"];
			Dialogue_Array[dubois][105] = ["knowing that indeed the creature loved her thrashing about, so she was sure to thrash about just enough for it."];
			Dialogue_Array[dubois][106] = ["Still, she had to think: did it enjoy her screaming for help during these moments, or would her muffled, choking screams only serve to irritate it?"];
			Dialogue_Array[dubois][107] = ["Guess the Monster's Emotion"];
			Dialogue_Array[dubois][108] = ["Irritated"];
			Dialogue_Array[dubois][109] = ["Playful"];
			Dialogue_Array[dubois][110] = ["B"];
			Dialogue_Array[dubois][111] = ["Lilith stayed silent, continuing to struggle, but not moaning, wanting to prevent herself from irritating the long, slender body of the Dubois."];
			Dialogue_Array[dubois][112] = ["The creature didn’t seem to mind much, still fucking her mouth like before, penetrating her stomach and making her shudder with delight."];
			Dialogue_Array[dubois][113] = ["Her hands attempted to play with her pussy, though the Dubois tightened to prevent her from moving even an inch."];
			Dialogue_Array[dubois][114] = ["The creature finally blew its load, shooting another few volleys of seed inside her as before,"];
			Dialogue_Array[dubois][115] = ["the goo frothing up through her esophagus and pouring out of her nose, her face and breasts soaked in white cum."];
			Dialogue_Array[dubois][116] = ["Jump"];
			Dialogue_Array[dubois][117] = ["Lilith began to scream and moan, letting her libido overtake her common sense as the beast grew aroused from these vibrations through its long body."];
			Dialogue_Array[dubois][118] = ["IT went slowly like before, but Lilith could feel something was coming from deep inside the Dubois;"];
			Dialogue_Array[dubois][119] = ["it was readying itself to blow a massive load of cum inside her, her actions serving to please it more than any other prey had before."];
			Dialogue_Array[dubois][120] = ["Perhaps this next load would be its ‘thank you’ to Lilith for such a unique experience."];
			Dialogue_Array[dubois][121] = ["Lilith continued to moan and scream playfully,"];
			Dialogue_Array[dubois][122] = ["feeling the long creature worming down her throat beginning to shudder as it began to pump gallons of cum through its long body and towards it head."];
			Dialogue_Array[dubois][123] = ["Lilith screamed as it launched volleys of cum inside her,"];
			Dialogue_Array[dubois][124] = ["far more than before as it filled her body up in seconds, every nook and cranny in her digestive tract slathered in sperm."];
			Dialogue_Array[dubois][125] = ["Her eyes went wide as she felt her hole weaken, and moments later, a torrential wave of cum launched out of her asshole,"];
			Dialogue_Array[dubois][126] = ["coating her legs and ass in sperm, Lilith dumbfounded at just how much cum the Dubois could keep within itself."];
			Dialogue_Array[dubois][127] = ["Merge"];
			Dialogue_Array[dubois][128] = ["Lilith felt the Dubois pull itself out of her, the creature not running instantly;"];
			Dialogue_Array[dubois][129] = ["it circled her once more, slithering over her and caressing her, as if showing some form of affection."];
			Dialogue_Array[dubois][130] = ["Lilith enjoyed its slippery embrace, her hands resting on its body, feeling the thick muscles within it, touching it like she would a muscular arm."];
			Dialogue_Array[dubois][131] = ["The creature took its time with her before slowly slithering back into the darkness, Lilith watching it return to its abode, standing with weak legs and an even weaker throat."];
			Dialogue_Array[dubois][132] = ["She smiled, taking a glob of cum and tasting it, growing more and more addicted to the delicious seed it spewed."];
			Dialogue_Array[dubois][133] = ["“So much for some cuddling…yet. I shall return for you soon, and when I do, I expect you to ravage me as you have before.”"];
			Dialogue_Array[dubois][134] = ["Lilith winked a the darkness, something telling her the Dubois not only saw and heard her,"];
			Dialogue_Array[dubois][135] = ["but understood her as well, walking out of the cave with a smile on her face and a belly full of seed."];
			Dialogue_Array[dubois][136] = [""];
			Dialogue_Array[dubois][137] = ["Lilith once more returned to the Dubois’ cave, but this time, not empty handed. A large sack was stuck in her hand,"];
			Dialogue_Array[dubois][138] = ["filled with small sweets used by hunters for their pets, which she had taken from the camp of some Humana soldiers."];
			Dialogue_Array[dubois][139] = ["The men knew these would be little nourishment for either a dog outside of a simple treat, but she knew just the creature which would appreciate a snack."];
			Dialogue_Array[dubois][140] = ["The Dubois almost excitedly greeted her as she entered, approaching from the darkness the moment her shoes clacked against the stone floor of the cave."];
			Dialogue_Array[dubois][141] = ["Lilith knelt as the tentacle beast slithered up, wrapping around her legs in a gentle embrace, making her giggle and stroke its long, thick body."];
			Dialogue_Array[dubois][142] = ["“Hello once again to you too! I have a gift, something I know you’ll appreciate!”"];
			Dialogue_Array[dubois][143] = ["Lilith opened the bag, the Dubois thrusting its head in as it began devouring the meat, the sound of slurping and slimy digestion echoing throughout the cave."];
			Dialogue_Array[dubois][144] = ["The Dubois was so enthralled with the meal it released its grip of its lover, allowing Lilith to stand and begin circling it herself."];
			Dialogue_Array[dubois][145] = ["She wanted to get as much information about the creature as possible; she was a royal, after all, she had more of a formal education than the people who had named the creature."];
			Dialogue_Array[dubois][146] = ["Looking over and touching the creature, Lilith could see that it was similar to the many snakes surrounding the Kingdom of Humana;"];
			Dialogue_Array[dubois][147] = ["the flaps at its head, though, were quite fascinating to her, and as curiosity overtook her, she slowly began to approach the strange growths…"];
			Dialogue_Array[dubois][148] = ["The touch suddenly alerted the Dubois that it’s duty was not to feed, but to fuck, and in that instant, it returned to wrapping around Lilith’s legs."];
			Dialogue_Array[dubois][149] = ["It slithered up her body again towards her mouth, nuzzling up once more as she lay on the ground only inches from her bag of sweets."];
			Dialogue_Array[dubois][150] = ["As she opened her mouth and allowed the Dubois in once more, she noticed it was only grasping her legs and chest, leaving her arms free to move as she pleased."];
			Dialogue_Array[dubois][151] = ["She gently stroked the long slender body of the Dubois, caressing it as it once again entered her throat, sensually thrusting into her, making her quiver with delight."];
			Dialogue_Array[dubois][152] = ["Sex"]
				Dialogue_Array[dubois][153] = ["Lilith had never thought being penetrated through her mouth would be arousing,"];
			Dialogue_Array[dubois][154] = ["but each and every time she returned to her new pet, she was surprised to feel her pussy growing moist as soon as it even approached her lips."];
			Dialogue_Array[dubois][155] = ["Still, she had brought the creature a treat, and tried to pat its body as she would a hound, trying to get its attention."];
			Dialogue_Array[dubois][156] = ["The creature understood, pulling itself from her mouth as it looked into her eyes quizzically, silently asking why she had wished it to stop."];
			Dialogue_Array[dubois][157] = ["She looked at the bag of candy, wondering if she ruined the mood by trying to feed it."];
			Dialogue_Array[dubois][158] = ["Would it be happy she gifted it the sweets personally? Or would it be more confused, wanting to return to her stomach to cum inside her once more?"];
			Dialogue_Array[dubois][159] = ["Guess the Monster's Emotion"];
			Dialogue_Array[dubois][160] = ["Confused"];
			Dialogue_Array[dubois][161] = ["Delighted"];
			Dialogue_Array[dubois][162] = ["B"];
			Dialogue_Array[dubois][163] = ["“I…I’m sorry, the thought slipped my mind.”"];
			Dialogue_Array[dubois][164] = ["Lilith hesitated, looking away from the bag of candy as she smiled at the Dubois, opening her mouth once more."];
			Dialogue_Array[dubois][165] = ["The creature was confused as to her intentions, but nevertheless, it entered her mouth once more, delving deep into her stomach."];
			Dialogue_Array[dubois][166] = ["Her hands went to her pussy, playing with it as the Dubois continued to fuck her throat, her fingers curling to play with her G-spot,"];
			Dialogue_Array[dubois][167] = ["her thumb flicking her clit as she was ready to explode with cum already, and hoped the Dubois felt the same back within the depths of her throat."];
			Dialogue_Array[dubois][168] = ["Jump"];
			Dialogue_Array[dubois][169] = ["“Here you are…perhaps you would like something to keep your energy up?”"];
			Dialogue_Array[dubois][170] = ["Lilith grasped a tiny piece of candy from the bag, holding it in her hand as the Dubois cocked its head, looking at the treat."];
			Dialogue_Array[dubois][171] = ["Opening its mouth, a long slender tongue shot out, wrapping around the candy and pulling it into its mouth, swallowing it whole before nuzzling up to Lilith once more."];
			Dialogue_Array[dubois][172] = ["The creature seemed to hum with delight before entering her body again, fucking her throat a bit more intensely this time,"];
			Dialogue_Array[dubois][173] = ["flexing its muscles lower down to try and allow her to breath, but also fill up as much of her esophagus as possible."];
			Dialogue_Array[dubois][174] = ["It did the trick, making Lilith feel as though she had a monstrous cock inside her,"];
			Dialogue_Array[dubois][175] = ["which sent her into a frenzy of lust, her finger beginning to play with her pussy as she grew more and more aroused."];
			Dialogue_Array[dubois][176] = ["Merge"];
			Dialogue_Array[dubois][177] = ["As Lilith continued to play with her pussy, the Dubois was already leaking pre-cum inside her belly, submerging her stomach in ounces of the clear fluid."];
			Dialogue_Array[dubois][178] = ["The creature slowly pulsated and writhed, waiting for Lilith to cum, her fingers thrusting into her tiny hole as she began tensing up."];
			Dialogue_Array[dubois][179] = ["Moments later, she moaned softly, vibrating as pussy juices shot out of her and covered her legs once again,"];
			Dialogue_Array[dubois][180] = ["the Dubois cumming simultaneously, both creatures joined as they orgasmed together."];
			Dialogue_Array[dubois][181] = ["The Dubois filled her with seed, not as much as it had before, but a significant amount that she wouldn’t need a meal for the rest of the day."];
			Dialogue_Array[dubois][182] = ["Lilith lay on the ground, the Dubois pulling out of her and curling up with her, tightening itself around her body and legs in a tender embrace."];
			Dialogue_Array[dubois][183] = ["“You’re getting better at that...and I seem to be getting accustomed to you, too.”"];
			Dialogue_Array[dubois][184] = ["Lilith smiled, nuzzling the large tendril-like creature, feeling its warmth as they cuddled for a while longer."];
			Dialogue_Array[dubois][185] = ["The pair eventually separated, the Dubois slithering off into the tunnel, while Lilith left the bag of sweets for it, knowing that it needed a bit of sugar now and then between meals."];
			Dialogue_Array[dubois][186] = ["“Now…what else can I bring you that might spice things up, I wonder…”"];
			Dialogue_Array[dubois][187] = [""];
			Dialogue_Array[dubois][188] = ["Lilith trudged into the cavern once more, the creature she almost called her lover – the Dubois – awaiting her on the cold stone floor."];
			Dialogue_Array[dubois][189] = ["She had a hard time walking, feeling so full after a filling meal about an hour beforehand. She couldn’t regularly eat as much as she had today, but she was getting full for someone special;"];
			Dialogue_Array[dubois][190] = ["she thought that since the Dubois enjoyed going into her stomach, it wouldn’t mind very much if Lilith had some food for itself and its young which would hatch inside Lilith’s belly."];
			Dialogue_Array[dubois][191] = ["She smiled at the creature, the tentacled beast once again slithering up and cuddling her legs, embracing her as it anticipated another opportunity to penetrate her once again."];
			Dialogue_Array[dubois][192] = ["“I brought something quite special for you. You enjoyed those sweets I had brought long ago, I thought of another gift I could give you which we could both enjoy.”"];
			Dialogue_Array[dubois][193] = ["Lilith sat on the ground, feeling the Dubois encircling her, making her giggle as it took its time feeling her up, caressing nearly every inch of her."];
			Dialogue_Array[dubois][194] = ["She felt the creature slither between her legs once more, signaling her to go onto her back, raising her hips as her legs spread, revealing her tight hole."];
			Dialogue_Array[dubois][195] = ["“Oh, you desire that way? We haven’t done anything with that hole for a while.”"];
			Dialogue_Array[dubois][196] = ["Sex"];
			Dialogue_Array[dubois][197] = ["Lilith grinned as the Dubois pressed against her asshole, shoving itself with powerful thrusts, making her hips spread slowly as it gained headway – literally – into her ass."];
			Dialogue_Array[dubois][198] = ["She bit her lip, feeling her pussy quivering as her body was prodded and violated once more,"];
			Dialogue_Array[dubois][199] = ["the creature lapping and licking her hole with its long tongue, slathering it in thick saliva."];
			Dialogue_Array[dubois][200] = ["Before she knew it, the monster was once more inside her, moving through her intestines towards her stomach, where it would once again attempt to impregnate her."];
			Dialogue_Array[dubois][201] = ["The food was still fresh within her, which meant the Dubois would have quite the feast before it started to pump her full of seed once again."];
			Dialogue_Array[dubois][202] = ["She moved her hands along her belly, feeling her stomach writhe and pump as the creature dug into the feast she had left it within her,"];
			Dialogue_Array[dubois][203] = ["biting her lip harder as her hands moved down to her pussy."];
			Dialogue_Array[dubois][204] = ["“Oh Gods! Keep going, go deeper, you feel glorious within me…”"];
			Dialogue_Array[dubois][205] = ["Lilith spoke, knowing the creature was far too busy to hear, turning herself on with her own words."];
			Dialogue_Array[dubois][206] = ["Her fingers once more entered her pussy, playing with herself as she felt her asshole wiggle, tighten and relax as the Dubois moved inside her."];
			Dialogue_Array[dubois][207] = ["She felt her womb and fingers being crushed by its monstrous body in the adjacent hole, sending ripples of ecstasy through her spine."];
			Dialogue_Array[dubois][208] = ["She wanted more, but didn’t want to disturb the creature, thinking it might turn it off. She wanted to grab its long, perfect body and shove it as deep as she could inside her."];
			Dialogue_Array[dubois][209] = ["On one hand, it loved her stomach…but on the other hand, she might scare it…"];
			Dialogue_Array[dubois][210] = ["Guess the Monster's Emotion"];
			Dialogue_Array[dubois][211] = ["Encouraged"];
			Dialogue_Array[dubois][212] = ["Scared"];
			Dialogue_Array[dubois][213] = ["A"];
			Dialogue_Array[dubois][214] = ["“Deeper, love, deeper! Take me! Destroy me!”"];
			Dialogue_Array[dubois][215] = ["Lilith grabbed the large body of the Dubois, shoving it hard inside herself, wanting more of it inside her to quell some animalistic lust."];
			Dialogue_Array[dubois][216] = ["The Dubois felt this, and with a might thrust, pushed itself as deep as it could within her, entering her body as the tail disappeared inside her asshole."];
			Dialogue_Array[dubois][217] = ["Lilith lay on her back for a few moments, her entire body filled by the creature as it explored her belly and organs,"];
			Dialogue_Array[dubois][218] = ["her eyes like pinholes as she couldn’t express the ecstasy she felt."];
			Dialogue_Array[dubois][219] = ["She opened her mouth to scream in joy, but felt no words come out,"];
			Dialogue_Array[dubois][220] = ["her body shuddering and shaking as the action of the Dubois pulling itself in sent her into the mother of all orgasms."];
			Dialogue_Array[dubois][221] = ["Her pussy squirted nearly across the cave, her legs stiff as boards,"];
			Dialogue_Array[dubois][222] = ["her hands gripping her flesh enough to leave deep red marks, and her mouth was wide, unable to be closed."];
			Dialogue_Array[dubois][223] = ["Inside, the Dubois slithered about, entering her stomach, twisting and contorting, and shoving its back half upwards and out of her mouth."];
			Dialogue_Array[dubois][224] = ["Just as Lilith began to scream, the tentacle popped out of her mouth, coiling around her as she let out a blood curdling cry of release."];
			Dialogue_Array[dubois][225] = ["The scream was loud enough to be heard even as her lover filled her entire throat, the cave shuddering as she did,"];
			Dialogue_Array[dubois][226] = ["the Dubois going as fast as it could, feeding off of her arousal as it had fed off her meal."];
			Dialogue_Array[dubois][227] = ["Jump"];
			Dialogue_Array[dubois][228] = ["“Do your duty, love…feast and cum!”"];
			Dialogue_Array[dubois][229] = ["!” Lilith exclaimed, her hands staying off of the Dubois as she gripped at the stones on the ground."];
			Dialogue_Array[dubois][230] = ["She screamed and moaned, feeling the Dubois finish its meal and beginning to thrust inside her."];
			Dialogue_Array[dubois][231] = ["The creature pulled out of her asshole, leaving a gaping pit where its head had been,"];
			Dialogue_Array[dubois][232] = ["coiling around her body as it inserted itself into her mouth, her eyes wide as it entered her stomach from the other end. "];
			Dialogue_Array[dubois][233] = ["It pumped its head inside her, ready to cum where its meal had once been, but now, with enough nutrients to help its children grow inside the noblewoman’s belly."];
			Dialogue_Array[dubois][234] = ["Merge"];
			Dialogue_Array[dubois][235] = ["Lilith screamed into the thick shaft of the Dubois one final time, the creature depositing gallons of cum into her stomach,"];
			Dialogue_Array[dubois][236] = ["her asshole a gaping hole which leaked cum into a pool around her."];
			Dialogue_Array[dubois][237] = ["The volume was enough to both pour out her gaping pit, but to back-up and exit her nose and mouth as well, her entire body covered in the creamy and sticky goo."];
			Dialogue_Array[dubois][238] = ["Her hands grabbed the Dubois pushing it deeper into her stomach, something the creature enjoyed feeling, pushing as much cum as it had to fill her body to the brim."];
			Dialogue_Array[dubois][239] = ["“Gods! Oh, that was…” Lilith was at a loss for words, the Dubois pulling itself out and laying limp next to her, breathing gently to show it was still healthy and alive."];
			Dialogue_Array[dubois][240] = ["Lilith felt her belly was a bit distended; not from food this time, but from the monster’s children inside her stomach."];
			Dialogue_Array[dubois][241] = ["She grinned as she pulled the Dubois closer, laying in the thick pool of cum which had shot out of her asshole, mouth and nose, cuddling the beast."];
			Dialogue_Array[dubois][242] = ["“…no one can do what you do. I think I’ll stay here for now…you can do that once we awaken.”"];
			Dialogue_Array[dubois][243] = ["The Dubois heard this and made a mental note of it, Lilith soon drifting asleep next to her lover, excited not only for when they woke, but what the future might hold for them both…"];
			Dialogue_Array[dubois][244] = [""];
			Dialogue_Array[dubois][245] = ["End"];

			Dialogue_Array[slimeeye][0] = ["Slime Eye"];
			Dialogue_Array[slimeeye][1] = ["Encounter1"];
			Dialogue_Array[slimeeye][2] = ["Encounter2"];
			Dialogue_Array[slimeeye][3] = ["Sex"];
			Dialogue_Array[slimeeye][4] = ["Encounter3"];
			Dialogue_Array[slimeeye][5] = ["Encounter4"];
			Dialogue_Array[slimeeye][6] = [""];
			Dialogue_Array[slimeeye][7] = ["Bonding1"];
			Dialogue_Array[slimeeye][8] = ["Bonding2"];
			Dialogue_Array[slimeeye][9] = ["Sex"];
			Dialogue_Array[slimeeye][10] = ["Lilith: "];
			Dialogue_Array[slimeeye][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[slimeeye][12] = ["Proud"];
			Dialogue_Array[slimeeye][13] = ["Confused"];
			Dialogue_Array[slimeeye][14] = ["B"];
			Dialogue_Array[slimeeye][15] = ["Line A1"];
			Dialogue_Array[slimeeye][16] = ["Line A2"];
			Dialogue_Array[slimeeye][17] = ["Jump"];
			Dialogue_Array[slimeeye][18] = ["Line B1"];
			Dialogue_Array[slimeeye][19] = ["Line B2"];
			Dialogue_Array[slimeeye][20] = ["Merge"];
			Dialogue_Array[slimeeye][21] = ["Mainline1"];
			Dialogue_Array[slimeeye][22] = ["Mainline2"];
			Dialogue_Array[slimeeye][23] = [""];
			Dialogue_Array[slimeeye][24] = ["End"];

			Dialogue_Array[inker][0] = ["Inker"];
			Dialogue_Array[inker][1] = ["Encounter1"];
			Dialogue_Array[inker][2] = ["Encounter2"];
			Dialogue_Array[inker][3] = ["Sex"];
			Dialogue_Array[inker][4] = ["Encounter3"];
			Dialogue_Array[inker][5] = ["Encounter4"];
			Dialogue_Array[inker][6] = [""];
			Dialogue_Array[inker][7] = ["Bonding1"];
			Dialogue_Array[inker][8] = ["Bonding2"];
			Dialogue_Array[inker][9] = ["Sex"];
			Dialogue_Array[inker][10] = ["Lilith: "];
			Dialogue_Array[inker][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[inker][12] = ["Proud"];
			Dialogue_Array[inker][13] = ["Confused"];
			Dialogue_Array[inker][14] = ["B"];
			Dialogue_Array[inker][15] = ["Line A1"];
			Dialogue_Array[inker][16] = ["Line A2"];
			Dialogue_Array[inker][17] = ["Jump"];
			Dialogue_Array[inker][18] = ["Line B1"];
			Dialogue_Array[inker][19] = ["Line B2"];
			Dialogue_Array[inker][20] = ["Merge"];
			Dialogue_Array[inker][21] = ["Mainline1"];
			Dialogue_Array[inker][22] = ["Mainline2"];
			Dialogue_Array[inker][23] = [""];
			Dialogue_Array[inker][24] = ["End"];

			Dialogue_Array[scorpse][0] = ["Scorpse"];
			Dialogue_Array[scorpse][1] = ["Encounter1"];
			Dialogue_Array[scorpse][2] = ["Encounter2"];
			Dialogue_Array[scorpse][3] = ["Sex"];
			Dialogue_Array[scorpse][4] = ["Encounter3"];
			Dialogue_Array[scorpse][5] = ["Encounter4"];
			Dialogue_Array[scorpse][6] = [""];
			Dialogue_Array[scorpse][7] = ["Bonding1"];
			Dialogue_Array[scorpse][8] = ["Bonding2"];
			Dialogue_Array[scorpse][9] = ["Sex"];
			Dialogue_Array[scorpse][10] = ["Lilith: "];
			Dialogue_Array[scorpse][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[scorpse][12] = ["Proud"];
			Dialogue_Array[scorpse][13] = ["Confused"];
			Dialogue_Array[scorpse][14] = ["B"];
			Dialogue_Array[scorpse][15] = ["Line A1"];
			Dialogue_Array[scorpse][16] = ["Line A2"];
			Dialogue_Array[scorpse][17] = ["Jump"];
			Dialogue_Array[scorpse][18] = ["Line B1"];
			Dialogue_Array[scorpse][19] = ["Line B2"];
			Dialogue_Array[scorpse][20] = ["Merge"];
			Dialogue_Array[scorpse][21] = ["Mainline1"];
			Dialogue_Array[scorpse][22] = ["Mainline2"];
			Dialogue_Array[scorpse][23] = [""];
			Dialogue_Array[scorpse][24] = ["End"];

			Dialogue_Array[nodder][0] = ["Nodder"];
			Dialogue_Array[nodder][1] = ["Encounter1"];
			Dialogue_Array[nodder][2] = ["Encounter2"];
			Dialogue_Array[nodder][3] = ["Sex"];
			Dialogue_Array[nodder][4] = ["Encounter3"];
			Dialogue_Array[nodder][5] = ["Encounter4"];
			Dialogue_Array[nodder][6] = [""];
			Dialogue_Array[nodder][7] = ["Bonding1"];
			Dialogue_Array[nodder][8] = ["Bonding2"];
			Dialogue_Array[nodder][9] = ["Sex"];
			Dialogue_Array[nodder][10] = ["Lilith: "];
			Dialogue_Array[nodder][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[nodder][12] = ["Proud"];
			Dialogue_Array[nodder][13] = ["Confused"];
			Dialogue_Array[nodder][14] = ["B"];
			Dialogue_Array[nodder][15] = ["Line A1"];
			Dialogue_Array[nodder][16] = ["Line A2"];
			Dialogue_Array[nodder][17] = ["Jump"];
			Dialogue_Array[nodder][18] = ["Line B1"];
			Dialogue_Array[nodder][19] = ["Line B2"];
			Dialogue_Array[nodder][20] = ["Merge"];
			Dialogue_Array[nodder][21] = ["Mainline1"];
			Dialogue_Array[nodder][22] = ["Mainline2"];
			Dialogue_Array[nodder][23] = [""];
			Dialogue_Array[nodder][24] = ["End"];

			Dialogue_Array[cirrus][0] = ["Cirrus"];
			Dialogue_Array[cirrus][1] = ["Encounter1"];
			Dialogue_Array[cirrus][2] = ["Encounter2"];
			Dialogue_Array[cirrus][3] = ["Sex"];
			Dialogue_Array[cirrus][4] = ["Encounter3"];
			Dialogue_Array[cirrus][5] = ["Encounter4"];
			Dialogue_Array[cirrus][6] = [""];
			Dialogue_Array[cirrus][7] = ["Bonding1"];
			Dialogue_Array[cirrus][8] = ["Bonding2"];
			Dialogue_Array[cirrus][9] = ["Sex"];
			Dialogue_Array[cirrus][10] = ["Lilith: "];
			Dialogue_Array[cirrus][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[cirrus][12] = ["Proud"];
			Dialogue_Array[cirrus][13] = ["Confused"];
			Dialogue_Array[cirrus][14] = ["B"];
			Dialogue_Array[cirrus][15] = ["Line A1"];
			Dialogue_Array[cirrus][16] = ["Line A2"];
			Dialogue_Array[cirrus][17] = ["Jump"];
			Dialogue_Array[cirrus][18] = ["Line B1"];
			Dialogue_Array[cirrus][19] = ["Line B2"];
			Dialogue_Array[cirrus][20] = ["Merge"];
			Dialogue_Array[cirrus][21] = ["Mainline1"];
			Dialogue_Array[cirrus][22] = ["Mainline2"];
			Dialogue_Array[cirrus][23] = [""];
			Dialogue_Array[cirrus][24] = ["End"];

			Dialogue_Array[dolphy][0] = ["Dolphy"];
			Dialogue_Array[dolphy][1] = ["Encounter1"];
			Dialogue_Array[dolphy][2] = ["Encounter2"];
			Dialogue_Array[dolphy][3] = ["Sex"];
			Dialogue_Array[dolphy][4] = ["Encounter3"];
			Dialogue_Array[dolphy][5] = ["Encounter4"];
			Dialogue_Array[dolphy][6] = [""];
			Dialogue_Array[dolphy][7] = ["Lilith: bond"];
			Dialogue_Array[dolphy][8] = ["Lilith: bond2"];
			Dialogue_Array[dolphy][9] = ["Sex"];
			Dialogue_Array[dolphy][10] = ["Lilith: Sex1"];
			Dialogue_Array[dolphy][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[dolphy][12] = ["Pride"];
			Dialogue_Array[dolphy][13] = ["Horny"];
			Dialogue_Array[dolphy][14] = ["B"];
			Dialogue_Array[dolphy][15] = ["Lilith: A1"];
			Dialogue_Array[dolphy][16] = ["Lilith: A2"];
			Dialogue_Array[dolphy][17] = ["Jump"];
			Dialogue_Array[dolphy][18] = ["Lilith: B1"];
			Dialogue_Array[dolphy][19] = ["Lilith: B2"];
			Dialogue_Array[dolphy][20] = ["Merge"];
			Dialogue_Array[dolphy][21] = ["Lilith: Mainline"];
			Dialogue_Array[dolphy][22] = ["Lilith: Mainline2"];
			Dialogue_Array[dolphy][23] = [""];
			Dialogue_Array[dolphy][24] = ["End"];

			Dialogue_Array[redlion][0] = ["Redlion"];
			Dialogue_Array[redlion][1] = ["Encounter1"];
			Dialogue_Array[redlion][2] = ["Encounter2"];
			Dialogue_Array[redlion][3] = ["Sex"];
			Dialogue_Array[redlion][4] = ["Encounter3"];
			Dialogue_Array[redlion][5] = ["Encounter4"];
			Dialogue_Array[redlion][6] = [""];
			Dialogue_Array[redlion][7] = ["Bonding1"];
			Dialogue_Array[redlion][8] = ["Bonding2"];
			Dialogue_Array[redlion][9] = ["Sex"];
			Dialogue_Array[redlion][10] = ["Lilith: "];
			Dialogue_Array[redlion][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[redlion][12] = ["Proud"];
			Dialogue_Array[redlion][13] = ["Confused"];
			Dialogue_Array[redlion][14] = ["B"];
			Dialogue_Array[redlion][15] = ["Line A1"];
			Dialogue_Array[redlion][16] = ["Line A2"];
			Dialogue_Array[redlion][17] = ["Jump"];
			Dialogue_Array[redlion][18] = ["Line B1"];
			Dialogue_Array[redlion][19] = ["Line B2"];
			Dialogue_Array[redlion][20] = ["Merge"];
			Dialogue_Array[redlion][21] = ["Mainline1"];
			Dialogue_Array[redlion][22] = ["Mainline2"];
			Dialogue_Array[redlion][23] = [""];
			Dialogue_Array[redlion][24] = ["End"];

			Dialogue_Array[skitz][0] = ["Skitz"];
			Dialogue_Array[skitz][1] = ["Encounter1"];
			Dialogue_Array[skitz][2] = ["Encounter2"];
			Dialogue_Array[skitz][3] = ["Sex"];
			Dialogue_Array[skitz][4] = ["Encounter3"];
			Dialogue_Array[skitz][5] = ["Encounter4"];
			Dialogue_Array[skitz][6] = [""];
			Dialogue_Array[skitz][7] = ["Bonding1"];
			Dialogue_Array[skitz][8] = ["Bonding2"];
			Dialogue_Array[skitz][9] = ["Sex"];
			Dialogue_Array[skitz][10] = ["Lilith: "];
			Dialogue_Array[skitz][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[skitz][12] = ["Proud"];
			Dialogue_Array[skitz][13] = ["Confused"];
			Dialogue_Array[skitz][14] = ["B"];
			Dialogue_Array[skitz][15] = ["Line A1"];
			Dialogue_Array[skitz][16] = ["Line A2"];
			Dialogue_Array[skitz][17] = ["Jump"];
			Dialogue_Array[skitz][18] = ["Line B1"];
			Dialogue_Array[skitz][19] = ["Line B2"];
			Dialogue_Array[skitz][20] = ["Merge"];
			Dialogue_Array[skitz][21] = ["Mainline1"];
			Dialogue_Array[skitz][22] = ["Mainline2"];
			Dialogue_Array[skitz][23] = [""];
			Dialogue_Array[skitz][24] = ["End"];

			Dialogue_Array[0][0] = [""];
			Dialogue_Array[0][1] = ["Lilith: Looks like it's going to be a fine day!"];
			Dialogue_Array[0][2] = ["Guard: Heading off into the woods, Lilith?"];
			Dialogue_Array[0][3] = ["Lilith: Off to gather more materials!"];
			Dialogue_Array[0][4] = ["Guard: Where do you find the cloth for your wonderful garments?"];
			Dialogue_Array[0][5] = ["Lilith: That's my little secret!"];
			Dialogue_Array[0][6] = ["Guard: Fair enough! Be careful though...there are rumors of strange tracks down by the river."];
			Dialogue_Array[0][7] = ["Lilith: I will, thank you."];
			Dialogue_Array[0][8] = [""];
			Dialogue_Array[0][9] = ["Nice Fabric."];
			Dialogue_Array[0][10] = ["Hmmmm2"];
			Dialogue_Array[0][11] = ["Hmmmm3"];
			Dialogue_Array[0][12] = [""];
			Dialogue_Array[0][13] = ["Waw"];
			Dialogue_Array[0][14] = [""];
			Dialogue_Array[0][15] = ["Hmmmm6"];
			Dialogue_Array[0][16] = [""];
			Dialogue_Array[0][17] = ["What..."];
			Dialogue_Array[0][18] = ["Hmmm7"];
			Dialogue_Array[0][19] = ["Hmmm8"];
			Dialogue_Array[0][20] = ["Hmmm9"];
			Dialogue_Array[0][21] = ["Hmmm10"];
			Dialogue_Array[0][22] = [""];
			Dialogue_Array[0][23] = ["Its over"];
			Dialogue_Array[0][24] = ["Its over2"];
			Dialogue_Array[0][25] = ["Its over3"];
			Dialogue_Array[0][26] = [""];
			Dialogue_Array[0][27] = ["                   [Return]"];
			Dialogue_Array[0][28] = ["It was already dark."];
			Dialogue_Array[0][29] = ["hmmm1"];
			Dialogue_Array[0][30] = ["hmmmm2"];
			Dialogue_Array[0][31] = [""];
			Dialogue_Array[0][32] = ["                [Inside the Castle]"];
			Dialogue_Array[0][33] = ["High up in..."];
			Dialogue_Array[0][34] = ["hmmmmm1"];
			Dialogue_Array[0][35] = [""];
			Dialogue_Array[0][36] = ["Why is this happening?"];
			Dialogue_Array[0][37] = ["No, I need to think quick on my feet."];
			Dialogue_Array[0][38] = ["There is an abandoned house across the bridge on the hill. I can use it as safe house and rest"];
			Dialogue_Array[0][39] = [""];
			Dialogue_Array[0][40] = ["Oh an Encyclopedia about wild beasts, that could be useful someday."];
			Dialogue_Array[0][41] = [""];
			Dialogue_Array[0][42] = ["A rustling in the nearby forest suddenly wakes Lilith from her slumber."];
			Dialogue_Array[0][43] = [""];
			Dialogue_Array[0][44] = [""]; 

			Dialogue_Array[butanga][0] = ["Butanga"];
			Dialogue_Array[butanga][1] = ["Encounter1"];
			Dialogue_Array[butanga][2] = ["Encounter2"];
			Dialogue_Array[butanga][3] = ["Sex"];
			Dialogue_Array[butanga][4] = ["Encounter3"];
			Dialogue_Array[butanga][5] = ["Encounter4"];
			Dialogue_Array[butanga][6] = [""];
			Dialogue_Array[butanga][7] = ["Bonding1"];
			Dialogue_Array[butanga][8] = ["Bonding2"];
			Dialogue_Array[butanga][9] = ["Sex"];
			Dialogue_Array[butanga][10] = ["Lilith: "];
			Dialogue_Array[butanga][11] = ["Guess the Monster's Emotion"];
			Dialogue_Array[butanga][12] = ["Proud"];
			Dialogue_Array[butanga][13] = ["Confused"];
			Dialogue_Array[butanga][14] = ["B"];
			Dialogue_Array[butanga][15] = ["Line A1"];
			Dialogue_Array[butanga][16] = ["Line A2"];
			Dialogue_Array[butanga][17] = ["Jump"];
			Dialogue_Array[butanga][18] = ["Line B1"];
			Dialogue_Array[butanga][19] = ["Line B2"];
			Dialogue_Array[butanga][20] = ["Merge"];
			Dialogue_Array[butanga][21] = ["Mainline1"];
			Dialogue_Array[butanga][22] = ["Mainline2"];
			Dialogue_Array[butanga][23] = [""];
			Dialogue_Array[butanga][24] = ["End"];

		}

	} 
}
