package { 
    import flash.display.*;
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    public class MonsterUI extends MovieClip {

        public var currentlyon = 1;
        public var iconpage = 0;
        public var page = 0;
        public var IconContainer:Sprite = new Sprite();
        public var CardsContainer:Sprite = new Sprite();
        public var TraitsContainer:Sprite = new Sprite()
        public var iconsbtn:SimpleButton = new UIIcons();
        public var battlebtn:SimpleButton = new UIBattle();
        public var traitsbtn:SimpleButton = new UITraits();
        public var Cards_Array:Array = new Array();
        public var NextBtn_MC:SimpleButton = new NextBtn();
        public var PrevBtn_MC:SimpleButton = new PrevBtn();
    
        public function MonsterUI(){
            currentlyon = 1;
            addChild(iconsbtn);
            iconsbtn.x = 95;
            iconsbtn.y = 360;
            addChild(battlebtn);
            battlebtn.x = 245;
            battlebtn.y = 360;
            addChild(traitsbtn);
            traitsbtn.x = 395;
            traitsbtn.y = 360;
            addChild(NextBtn_MC);
            NextBtn_MC.x = 1140;
            NextBtn_MC.y = 655;
            addChild(PrevBtn_MC);
            PrevBtn_MC.x = 1140;
            PrevBtn_MC.y = 740;
            iconsbtn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoIcons);
            battlebtn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoBattle);
            traitsbtn.addEventListener(MouseEvent.MOUSE_DOWN, SwitchtoTraits);
            NextBtn_MC.addEventListener(MouseEvent.MOUSE_DOWN, Nextpage);
            PrevBtn_MC.addEventListener(MouseEvent.MOUSE_DOWN, Prevpage);
        }

        public function Load_Icons():void{
            if (!this.contains(IconContainer)){
                //Game(this.parent).UI_App_Container_MC.gotoAndStop(11);
                Game(this.parent).SortMonsters();
                addChild(IconContainer);
                IconContainer.x = 85;
                IconContainer.y = 450;
            }
            NextBtn_MC.visible = true;
            PrevBtn_MC.visible = true;
            if (iconpage >= Game(this.parent).MonstersInventory_Array.length - 18){
                NextBtn_MC.visible = false;
            }
            if (iconpage == 0){
                PrevBtn_MC.visible = false;
            }
            
            for (var i: uint = 0; i < 18; i++){
                if (Game(this.parent).MonstersInventory_Array[iconpage+i] != null){
                    var temp_MC = new Monicon();
                    temp_MC.MemberNo = Game(this.parent).MonstersInventory_Array[iconpage+i].MemberNo;
                    temp_MC.Royal_Text.text = Game(this.parent).MonstersInventory_Array[iconpage+i].Royal;
                    temp_MC.Monster.gotoAndStop(Game(this.parent).MonstersInventory_Array[iconpage+i].ID);
                    temp_MC.Lv_Text.text = "Lv " + Game(this.parent).MonstersInventory_Array[iconpage+i].Lv;
                    temp_MC.RP_Text.text = "RP " + Game(this.parent).MonstersInventory_Array[iconpage+i].RelationshipPts;
                    temp_MC.x += 160*(i%6);
                    temp_MC.y += 180*Math.floor(i/6);
                    IconContainer.addChild(temp_MC);
                    temp_MC.buttonMode = true;
                    if (Game(this.parent).thefeature == 11){
                        temp_MC.addEventListener(MouseEvent.ROLL_OVER, RArmyFunc);
                        temp_MC.addEventListener(MouseEvent.ROLL_OUT, RArmyFunc);
                        temp_MC.addEventListener(MouseEvent.CLICK, RArmyFunc);
                        temp_MC.addEventListener(MouseEvent.MOUSE_UP, RArmyFunc);
                    }
                    if (Game(this.parent).thefeature == 21){
                        temp_MC.addEventListener(MouseEvent.ROLL_OVER, HuntFunc);
                        temp_MC.addEventListener(MouseEvent.ROLL_OUT, HuntFunc);
                        temp_MC.addEventListener(MouseEvent.CLICK, HuntFunc);
                        temp_MC.addEventListener(MouseEvent.MOUSE_UP, HuntFunc);
                    }
                    if (Game(this.parent).thefeature == 51){
                        temp_MC.addEventListener(MouseEvent.ROLL_OVER, ScoutFunc);
                        temp_MC.addEventListener(MouseEvent.ROLL_OUT, ScoutFunc);
                        temp_MC.addEventListener(MouseEvent.CLICK, ScoutFunc);
                        temp_MC.addEventListener(MouseEvent.MOUSE_UP, ScoutFunc);
                    }
                    if (Game(this.parent).thefeature == 71){
                        temp_MC.addEventListener(MouseEvent.ROLL_OVER, BondFunc);
                        temp_MC.addEventListener(MouseEvent.ROLL_OUT, BondFunc);
                        temp_MC.addEventListener(MouseEvent.CLICK, BondFunc);
                        temp_MC.addEventListener(MouseEvent.MOUSE_UP, BondFunc);
                    }
                    if (Game(this.parent).thefeature == 81){
                        temp_MC.addEventListener(MouseEvent.ROLL_OVER, ExploreFunc);
                        temp_MC.addEventListener(MouseEvent.ROLL_OUT, ExploreFunc);
                        temp_MC.addEventListener(MouseEvent.CLICK, ExploreFunc);
                        temp_MC.addEventListener(MouseEvent.MOUSE_UP, ExploreFunc);
                    }
                }
            }
        }

        public function Load_Cards():void{
            if (!this.contains(CardsContainer)){
                //Game(this.parent).UI_App_Container_MC.gotoAndStop(12);
                addChild(CardsContainer);
                CardsContainer.x = 105;
                CardsContainer.y = 410;
            }
            NextBtn_MC.visible = true;
            PrevBtn_MC.visible = true;
            if (page >= Game(this.parent).MonstersInventory_Array.length - 3){
                NextBtn_MC.visible = false;
            }
            if (page == 0){
                PrevBtn_MC.visible = false;
            }

            for (var i:uint = 0; i < 3; i++){
                if (Game(this.parent).MonstersInventory_Array[page+i] != null){
                    Cards_Array[i] = new StatsCard();
                    CardsContainer.addChild(Cards_Array[i]);
                    Cards_Array[i].MemberNo = Game(this.parent).MonstersInventory_Array[page+i].MemberNo;
                    Cards_Array[i].gotoAndStop(1);
                    Cards_Array[i].Name_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Species;
                    Cards_Array[i].Kills_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Kills;
                    Cards_Array[i].Hp_Text.text = Game(this.parent).MonstersInventory_Array[page+i].MaxHp;
                    Cards_Array[i].Att_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Att;
                    Cards_Array[i].Agi_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Agi;
                    Cards_Array[i].Type_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Type;
                    Cards_Array[i].Class_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Class;
                    Cards_Array[i].AttackType_Text.text = Game(this.parent).MonstersInventory_Array[page+i].AttackType;
                    Cards_Array[i].Effect_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Effect;
                    Cards_Array[i].Monster.gotoAndStop(Game(this.parent).MonstersInventory_Array[page+i].ID);
                    Cards_Array[i].Royal_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Royal;
                    Cards_Array[i].x += 330*i;
                    Cards_Array[i].buttonMode = true;
                    if (Game(this.parent).thefeature == 11){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, RArmyFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, RArmyFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, RArmyFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, RArmyFunc);
                    }
                    if (Game(this.parent).thefeature == 21){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, HuntFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, HuntFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, HuntFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, HuntFunc);
                    }
                    if (Game(this.parent).thefeature == 51){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, ScoutFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, ScoutFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, ScoutFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, ScoutFunc);
                    }
                    if (Game(this.parent).thefeature == 71){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, BondFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, BondFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, BondFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, BondFunc);
                    }
                    if (Game(this.parent).thefeature == 81){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, ExploreFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, ExploreFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, ExploreFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, ExploreFunc);
                    }
                }
            }
            
        }

        public function Load_Traits():void{
            if (!this.contains(TraitsContainer)){
                //Game(this.parent).UI_App_Container_MC.gotoAndStop(13);
                addChild(TraitsContainer);
                TraitsContainer.x = 105;
                TraitsContainer.y = 410;
            }
            NextBtn_MC.visible = true;
            PrevBtn_MC.visible = true;
            if (page >= Game(this.parent).MonstersInventory_Array.length - 3){
                NextBtn_MC.visible = false;
            }
            if (page == 0){
                PrevBtn_MC.visible = false;
            }

            for (var i:uint = 0; i < 3; i++){
                if (Game(this.parent).MonstersInventory_Array[page+i] != null){
                    Cards_Array[i] = new TraitsCard();
                    TraitsContainer.addChild(Cards_Array[i]);
                    Cards_Array[i].MemberNo = Game(this.parent).MonstersInventory_Array[page+i].MemberNo;
                    Cards_Array[i].gotoAndStop(1);
                    Cards_Array[i].Name_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Species;
                    Cards_Array[i].Tier_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Tier;
                    Cards_Array[i].Camo_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Camouflage;
                    Cards_Array[i].Intelli_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Intelligence;
                    Cards_Array[i].Travel_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Traveling;
                    Cards_Array[i].Endu_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Endurance;
                    Cards_Array[i].Coop_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Cooperativeness;
                    Cards_Array[i].Appear_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Appearance;
                    Cards_Array[i].Sense_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Senses;
                    Cards_Array[i].Specialty_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Specialty;
                    Cards_Array[i].Monster.gotoAndStop(Game(this.parent).MonstersInventory_Array[page+i].ID);
                    Cards_Array[i].Royal_Text.text = Game(this.parent).MonstersInventory_Array[page+i].Royal;
                    Cards_Array[i].x += 330*i;
                    Cards_Array[i].buttonMode = true;
                    if (Game(this.parent).thefeature == 11){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, RArmyFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, RArmyFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, RArmyFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, RArmyFunc);
                    }
                    if (Game(this.parent).thefeature == 21){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, HuntFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, HuntFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, HuntFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, HuntFunc);
                    }
                    if (Game(this.parent).thefeature == 51){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, ScoutFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, ScoutFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, ScoutFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, ScoutFunc);
                    }
                    if (Game(this.parent).thefeature == 71){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, BondFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, BondFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, BondFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, BondFunc);
                    }
                    if (Game(this.parent).thefeature == 81){
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OVER, ExploreFunc);
                        Cards_Array[i].addEventListener(MouseEvent.ROLL_OUT, ExploreFunc);
                        Cards_Array[i].addEventListener(MouseEvent.CLICK, ExploreFunc);
                        Cards_Array[i].addEventListener(MouseEvent.MOUSE_UP, ExploreFunc);
                    }
                }
            }
        }

        public function RArmyFunc(evt:MouseEvent):void{
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
                    evt.currentTarget.gotoAndStop(1);
                    if (evt.currentTarget.Royal_Text.text != "Royal" && Game(this.parent).RoyalArmy_Array.length < 9 && evt.currentTarget.Monster.currentFrame != 201){
                        evt.currentTarget.Royal_Text.text = "Royal";
                        Game(this.parent).RoyalArmy_Array.push(evt.currentTarget.MemberNo);
                        for (var i: uint = 0; i < Game(this.parent).MonstersInventory_Array.length; i++){
                            if (Game(this.parent).MonstersInventory_Array[i].MemberNo == evt.currentTarget.MemberNo){
                                Game(this.parent).MonstersInventory_Array[i].Royal = "Royal";
                            }
                        }
                        Game(this.parent).UpdateRoyalArmy();
                    }
                break;
            }
        }

        public function HuntFunc(evt:MouseEvent):void{
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
                    evt.currentTarget.gotoAndStop(1);
                    if (Game(this.parent).AssignMon.length < 1){
                        Game(this.parent).AssignMon.push(evt.currentTarget.MemberNo);
                        Game(this.parent).UpdateAssignMon();
                    }
                break;
            }
        }

        public function ScoutFunc(evt:MouseEvent):void{
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
                    evt.currentTarget.gotoAndStop(1);
                    if (Game(this.parent).AssignMon.length < 1){
                        Game(this.parent).AssignMon.push(evt.currentTarget.MemberNo);
                        Game(this.parent).UpdateAssignMon();
                    }
                break;
            }
        }

        public function BondFunc(evt:MouseEvent):void{
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
                    evt.currentTarget.gotoAndStop(1);
                    if (Game(this.parent).AssignMon.length < 1){
                        Game(this.parent).AssignMon.push(evt.currentTarget.MemberNo);
                        Game(this.parent).UpdateAssignMon();
                    }
                break;
            }
        }

        public function ExploreFunc(evt:MouseEvent):void{
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
                    evt.currentTarget.gotoAndStop(1);
                    if (Game(this.parent).AssignMon.length < 1){
                        Game(this.parent).AssignMon.push(evt.currentTarget.MemberNo);
                        Game(this.parent).UpdateAssignMon();
                    }
                break;
            }
        }

        public function Nextpage(e:MouseEvent):void{
            if (currentlyon == 1){
                iconpage += 18;
                Unload_MonsterUI();
                Load_Icons();
            }
            if (currentlyon == 2){
                page += 3;
                Unload_MonsterUI();
                Load_Cards();
            }
            if (currentlyon == 3){
                page += 3;
                Unload_MonsterUI();
                Load_Traits();
            }
        }
            
        public function Prevpage(e:MouseEvent):void{
            if (currentlyon == 1){
                iconpage -= 18;
                Unload_MonsterUI();
                Load_Icons();
            }
            if (currentlyon == 2){
                page -= 3;
                Unload_MonsterUI();
                Load_Cards();
            }
            if (currentlyon == 3){
                page -= 3;
                Unload_MonsterUI();
                Load_Traits();
            }
        }

        public function Unload_MonsterUI():void{
            if (this.contains(IconContainer)){
                while (IconContainer.numChildren > 0) {
                    IconContainer.removeChildAt(0);
                }
                removeChild(IconContainer);
            }
            if (this.contains(CardsContainer)){
                while (CardsContainer.numChildren > 0) {
                    CardsContainer.removeChildAt(0);
                }
                removeChild(CardsContainer);
            }
            if (this.contains(TraitsContainer)){
                while (TraitsContainer.numChildren > 0) {
                    TraitsContainer.removeChildAt(0);
                }
                removeChild(TraitsContainer);
            }
        }

        public function SwitchtoIcons(e:MouseEvent):void{
            currentlyon = 1;
            Unload_MonsterUI();
            Load_Icons();
        }

        public function SwitchtoBattle(e:MouseEvent):void{
            currentlyon = 2;
            Unload_MonsterUI();
            Load_Cards();
        }

        public function SwitchtoTraits(e:MouseEvent):void{
            currentlyon = 3;
            Unload_MonsterUI();
            Load_Traits();
        }

    }
}

        