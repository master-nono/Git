package { 
    import flash.display.*;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import flash.geom.Rectangle;

    public class MapUI extends MovieClip {

        public var Map_MC:MovieClip = new Map_Container();
        public var start_ptx:uint = 0;
        public var start_pty:uint = 0;
        public var end_ptx:uint = 1;
        public var end_pty:uint = 1;

        public function MapUI(worldstatus: Array, current_hex){
            addChild(Map_MC);
            Map_MC.x = -200;
            Map_MC.y = -200;
            addEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);

            for (var i: uint = 1; i < 244; i++){
                if (Map_MC.getChildAt(i) != null){
                    var mc:SimpleButton = Map_MC.getChildAt(i) as SimpleButton;
                    var hex = new hexstatus();
                    hex.x = mc.x;
                    hex.y = mc.y;
                    var myString:String = mc.name;
                    myString = myString.replace("hex", "");
                    var a = Number(myString);
                    if (worldstatus[a].TStatus == "Notava" || worldstatus[a].Connected == 0){ 
                        hex.gotoAndStop(1);
                    }
                    if (worldstatus[a].TStatus == "Enemy" && worldstatus[a].Connected == 1){
                        hex.gotoAndStop(2);
                        mc.addEventListener(MouseEvent.MOUSE_DOWN, handlebtn);
                        mc.addEventListener(MouseEvent.MOUSE_UP, handlebtn);
                    }
                    if (worldstatus[a].TStatus == "Ally"){
                        hex.gotoAndStop(4);
                        mc.addEventListener(MouseEvent.MOUSE_DOWN, handlebtn);
                        mc.addEventListener(MouseEvent.MOUSE_UP, handlebtn);
                    }
                    if (worldstatus[a].TStatus == "Humana"){ 
                        hex.gotoAndStop(5);
                        mc.addEventListener(MouseEvent.MOUSE_DOWN, handlebtn);
                        mc.addEventListener(MouseEvent.MOUSE_UP, handlebtn);
                    }
                    if (a == current_hex || (a == 905 && current_hex < 3)){ 
                        hex.gotoAndStop(3);
                    }
                    Map_MC.addChildAt(hex, 1);
                    i++;
                }
            }
           
        }

        public function Control_Map_Down(e:MouseEvent):void{
            var Bounds:Rectangle = new Rectangle(-1050, -340, 1050, 340);
            this.startDrag(false, Bounds);
            this.addEventListener(MouseEvent.MOUSE_UP, Control_Map_Up);
        }

        public function Control_Map_Up(e:MouseEvent):void{
            this.stopDrag();
            this.removeEventListener(MouseEvent.MOUSE_UP, Control_Map_Up);
        }

        public function handlebtn(evt:MouseEvent):void{
            switch(evt.type){
                case MouseEvent.MOUSE_DOWN:
                    start_ptx = stage.mouseX;
                    start_pty = stage.mouseY;
                    break;

                case MouseEvent.MOUSE_UP:
                    end_ptx = stage.mouseX;
                    end_pty = stage.mouseY;
                    var myString:String = evt.currentTarget.name;
                    myString = myString.replace("hex", "");
                    var a = Number(myString);
                    Game(this.parent).current_hex = a;
                    Game(this.parent).Load_Lv2(a);
                    Game(this.parent).Lv2_Map_Container_MC.addEventListener(MouseEvent.MOUSE_DOWN, Game(this.parent).Control_Map_Down);
                    Game(this.parent).Load_UI_Board(a);
                    trace(a);
                    //my_cursor_mc.mouseEnabled = false; 

                    Explore_App();
                    break;
            }
        }

        public function Explore_App():void{
            trace(start_ptx, end_ptx, start_pty, end_pty);
            if(start_ptx == end_ptx && start_pty == end_pty){
                removeEventListener(MouseEvent.MOUSE_DOWN, Control_Map_Down);
                Game(this.parent).removeChild(Game(this.parent).theMap);
            }
        }


    }
}

        