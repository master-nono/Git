package  {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class McButton extends MovieClip {

        public function McButton() 
        {
            super();
            mouseChildren = false;
            useHandCursor = buttonMode = true;

            addEventListener(MouseEvent.ROLL_OVER, handleMouse);
            addEventListener(MouseEvent.ROLL_OUT, handleMouse);
            addEventListener(MouseEvent.MOUSE_DOWN, handleMouse);
            addEventListener(MouseEvent.MOUSE_UP, handleMouse);

            gotoAndStop(1);
        }

        public function handleMouse(evt:MouseEvent):void{
            switch(evt.type){
                case MouseEvent.MOUSE_UP:
                case MouseEvent.ROLL_OVER:
                    gotoAndStop(2);
                    break;

                case MouseEvent.ROLL_OUT:
                    gotoAndStop(1);
                    break;

                case MouseEvent.MOUSE_DOWN:
                    gotoAndStop(3);
                    break;
            }
        }
    }
}