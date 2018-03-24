package { 
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import com.greensock.TweenLite;
    import com.greensock.easing.*;
    import com.greensock.*;
    import flash.events.Event; 
    import flash.media.Sound; 
    import flash.media.SoundChannel; 
    import flash.media.SoundMixer;

    public class Sounds extends MovieClip {

        public var someSound:Sound_Butanga = new Sound_Butanga();
        public var someChannel:SoundChannel = someSound.play(0, 9999);

        public function Sounds(id :uint){
            TweenMax.to(someChannel, 0, {volume:0, onComplete:stopSound});
            TweenMax.to(someChannel, 4, {volume:1, onComplete:stopSound});
        }

        public function stopSound(){
            
        }
    }
}

        