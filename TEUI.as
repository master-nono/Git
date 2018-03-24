package { 
    import flash.display.*;
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    public class TEUI extends MovieClip {

        public var iconpage = 0;
        public var page = 0;
        public var currentID = 0;
        public var CardTraitsorLore = 1;
        public var IconContainer:Sprite = new Sprite();
        public var IconContainer2:Sprite = new Sprite();
        public var IconContainer3:Sprite = new Sprite();
        public var NextBtn_MC:SimpleButton = new NextBtn();
        public var PrevBtn_MC:SimpleButton = new PrevBtn();
    
        public function TEUI(){
            addChild(NextBtn_MC);
            NextBtn_MC.x = 930;
            NextBtn_MC.y = 905;
            NextBtn_MC.rotation = 90;
            addChild(PrevBtn_MC);
            PrevBtn_MC.x = 1015;
            PrevBtn_MC.y = 905;
            PrevBtn_MC.rotation = 90;
            NextBtn_MC.addEventListener(MouseEvent.MOUSE_DOWN, Nextpage);
            PrevBtn_MC.addEventListener(MouseEvent.MOUSE_DOWN, Prevpage);
        }

        public function Load_Icons():void{
            if (!this.contains(IconContainer)){
                addChild(IconContainer);
                IconContainer.x = 680;
                IconContainer.y = 150;
            }
            NextBtn_MC.visible = true;
            PrevBtn_MC.visible = true;
            if (iconpage >= Game(this.parent).AllAllySpecies_Array.length - 12){
                NextBtn_MC.visible = false;
            }
            if (iconpage == 0){
                PrevBtn_MC.visible = false;
            }
            
            for (var i: uint = 0; i < 12; i++){
                var temp_MC = new Monicon();
                /** if (Game(this.parent).TE_Array.indexOf(iconpage+i) == -1){
                    temp_MC.Monster.gotoAndStop(202);
                } else {
                    temp_MC.Monster.gotoAndStop(iconpage+i);
                    if (iconpage == 0 && i == 0){temp_MC.Monster.gotoAndStop(201)};
                } **/

                temp_MC.Monster.gotoAndStop(202);
                if (Game(this.parent).AllAllySpecies_Array[iconpage+i].MaxHp > 0){
                    trace(Game(this.parent).AllAllySpecies_Array[iconpage+i].MaxHp);
                    temp_MC.Monster.gotoAndStop(iconpage+i);
                }
                if (iconpage == 0 && i == 0){temp_MC.Monster.gotoAndStop(201)};
                
                temp_MC.Name_Text.text = "Unknown";
                if (Game(this.parent).AllAllySpecies_Array[iconpage+i].hasOwnProperty("Foundby")){
                    if (Game(this.parent).TE_Array.indexOf(iconpage+i) != -1 || Game(this.parent).AllAllySpecies_Array[iconpage+i].Foundby > 1){
                        temp_MC.Name_Text.text = Game(this.parent).AllAllySpecies_Array[iconpage+i].Species;
                        temp_MC.Monster.buttonMode = true;
                        temp_MC.addEventListener(MouseEvent.ROLL_OVER, TEStats);
                        temp_MC.addEventListener(MouseEvent.ROLL_OUT, TEStats);
                        temp_MC.addEventListener(MouseEvent.CLICK, TEStats);
                        temp_MC.addEventListener(MouseEvent.MOUSE_UP, TEStats);
                    }
                }
                temp_MC.Foundby = Game(this.parent).AllAllySpecies_Array[iconpage+i].Foundby;
                temp_MC.Lore = Game(this.parent).AllAllySpecies_Array[iconpage+i].Lore;
                temp_MC.ID = Game(this.parent).AllAllySpecies_Array[iconpage+i].ID
                temp_MC.x += 180*(i%3);
                temp_MC.y += 190*Math.floor(i/3);
                IconContainer.addChild(temp_MC);
            }
        }

        public function TEStats(evt:MouseEvent):void{
            switch(evt.type){
                case MouseEvent.MOUSE_UP:
                    evt.currentTarget.gotoAndStop(1);
                    break;
                case MouseEvent.ROLL_OVER:
                    evt.currentTarget.gotoAndStop(2);
                    break;
                case MouseEvent.ROLL_OUT:
                    evt.currentTarget.gotoAndStop(1);
                    break;
                case MouseEvent.CLICK:
                    currentID = evt.currentTarget.ID;
                    
                    if (CardTraitsorLore == 1){
                        Load_Card();
                    }
                    if (CardTraitsorLore == 2){
                        Load_Traits();
                    }
                    if (CardTraitsorLore == 3){
                        Load_Lore();
                    }

                    Game(this.parent).UI_App_Container_MC.Stats_Btn.addEventListener(MouseEvent.MOUSE_UP, Stats_Func);
                    Game(this.parent).UI_App_Container_MC.Lore_Btn.addEventListener(MouseEvent.MOUSE_UP, Lore_Func);

                    //UpdateLore(evt.currentTarget.Monster.currentFrame);
                    break;
            }
        }

             public function Stats_Func(evt:MouseEvent):void{
                if (CardTraitsorLore > 2){
                    CardTraitsorLore = 1;
                }
                if (!stage.contains(IconContainer2)){
                    if (CardTraitsorLore == 1){
                        Load_Card();
                    } else {
                        Load_Traits();
                    }
                }
             }

             public function Lore_Func(evt:MouseEvent):void{
                CardTraitsorLore = 3;
                if (!stage.contains(IconContainer3)){
                    Load_Lore();
                }
             }

                public function Load_Card():void{
                    Game(this.parent).UI_App_Container_MC.gotoAndStop(43);
                    Game(this.parent).UI_App_Container_MC.Battle_Btn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoBattle);
                    Game(this.parent).UI_App_Container_MC.Traits_Btn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoTraits);
                    Game(this.parent).UI_App_Container_MC.Wildor_Text.text = " ";
                    if (Game(this.parent).AllAllySpecies_Array[currentID].Foundby > 1){
                        Game(this.parent).UI_App_Container_MC.Wildor_Text.text = "Can be found in nature";
                    }
                    Unload_UI();
                    
                    addChild(IconContainer2);
                    IconContainer2.x = 200;
                    IconContainer2.y = 290;
                    var temp_MC = new StatsCard();
                    temp_MC.MemberNo = Game(this.parent).AllAllySpecies_Array[currentID].MemberNo;
                    temp_MC.gotoAndStop(1);
                    temp_MC.Name_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Species;
                    temp_MC.Kills_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Kills;
                    temp_MC.Hp_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].MaxHp;
                    temp_MC.Att_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Att;
                    temp_MC.Agi_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Agi;
                    temp_MC.Type_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Type;
                    temp_MC.Class_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Class;
                    temp_MC.AttackType_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].AttackType;
                    temp_MC.Effect_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Effect;
                    temp_MC.Monster.gotoAndStop(Game(this.parent).AllAllySpecies_Array[currentID].ID);
                    temp_MC.Royal_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Royal;
                    Game(this.parent).UI_App_Container_MC.Seenin_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Seenin;
                    Game(this.parent).UI_App_Container_MC.Region_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Region;
                    IconContainer2.addChild(temp_MC);
                }

                public function Load_Traits():void{
                    Game(this.parent).UI_App_Container_MC.gotoAndStop(43);
                    Game(this.parent).UI_App_Container_MC.Battle_Btn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoBattle);
                    Game(this.parent).UI_App_Container_MC.Traits_Btn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoTraits);
                    Game(this.parent).UI_App_Container_MC.Wildor_Text.text = " ";
                    if (Game(this.parent).AllAllySpecies_Array[currentID].Foundby > 1){
                        Game(this.parent).UI_App_Container_MC.Wildor_Text.text = "Can be found in nature";
                    }
                    Unload_UI();
                    
                    addChild(IconContainer2);
                    IconContainer2.x = 200;
                    IconContainer2.y = 290;
                    var temp_MC = new TraitsCard();
                    temp_MC.MemberNo = Game(this.parent).AllAllySpecies_Array[currentID].MemberNo;
                    temp_MC.gotoAndStop(1);
                    temp_MC.Name_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Species;
                    temp_MC.Tier_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Tier;
                    temp_MC.Camo_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Camouflage;
                    temp_MC.Intelli_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Intelligence;
                    temp_MC.Travel_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Traveling;
                    temp_MC.Endu_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Endurance;
                    temp_MC.Coop_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Cooperativeness;
                    temp_MC.Appear_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Appearance;
                    temp_MC.Sense_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Senses;
                    temp_MC.Specialty_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Specialty;
                    temp_MC.Monster.gotoAndStop(Game(this.parent).AllAllySpecies_Array[currentID].ID);
                    temp_MC.Royal_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Royal;
                    Game(this.parent).UI_App_Container_MC.Seenin_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Seenin;
                    Game(this.parent).UI_App_Container_MC.Region_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Region;
                    IconContainer2.addChild(temp_MC);
                }

                public function Load_Lore():void{
                    Game(this.parent).UI_App_Container_MC.gotoAndStop(42);
                    Unload_UI();
                    
                    addChild(IconContainer3);
                    IconContainer3.x = 265;
                    IconContainer3.y = 130;
                    var temp_MC = new Monicon();
                    temp_MC.Monster.gotoAndStop(currentID);
                    temp_MC.Name_Text.text = Game(this.parent).AllAllySpecies_Array[currentID].Species;
                    IconContainer3.addChild(temp_MC);
                    
                    if (Game(this.parent).AllAllySpecies_Array[currentID].Lore == null){
                        Game(this.parent).UI_App_Container_MC.Text_Stage.text = " ";
                    } else {
                        Game(this.parent).UI_App_Container_MC.Text_Stage.text = Game(this.parent).AllAllySpecies_Array[currentID].Lore;
                    }
                    //UpdateLore(evt.currentTarget.Monster.currentFrame);
                }

                    public function SwitchtoBattle(e:MouseEvent):void{
                        CardTraitsorLore = 1;
                        Unload_UI();
                        Load_Card();
                    }

                    public function SwitchtoTraits(e:MouseEvent):void{
                        CardTraitsorLore = 2;
                        Unload_UI();
                        Load_Traits();
                    }

        public function Nextpage(e:MouseEvent):void{
            iconpage += 12;
            Unload_TEUI();
            Load_Icons();
        }
            
        public function Prevpage(e:MouseEvent):void{
            iconpage -= 12;
            Unload_TEUI();
            Load_Icons();
        }

        public function Unload_TEUI():void{
            if (this.contains(IconContainer)){
                while (IconContainer.numChildren > 0) {
                    IconContainer.removeChildAt(0);
                }
                removeChild(IconContainer);
            }
        }

        public function Unload_UI():void{
            if (this.contains(IconContainer2)){
                while (IconContainer2.numChildren > 0) {
                    IconContainer2.removeChildAt(0);
                }
                removeChild(IconContainer2);
            }
            if (this.contains(IconContainer3)){
                while (IconContainer3.numChildren > 0) {
                    IconContainer3.removeChildAt(0);
                }
                removeChild(IconContainer3);
            }
        }

    }
}

        