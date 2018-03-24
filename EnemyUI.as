package { 
    import flash.display.*;
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    
    public class EnemyUI extends MovieClip {

        public var page = 0;
        public var CardsContainer:Sprite = new Sprite();
        public var Cards_Array:Array = new Array();
        public var Enemy_Array:Array = new Array();
        public var NextBtn_MC:SimpleButton = new NextBtn();
        public var PrevBtn_MC:SimpleButton = new PrevBtn();
    
        public function EnemyUI(){
            addChild(NextBtn_MC);
            NextBtn_MC.x = 1140;
            NextBtn_MC.y = 625;
            addChild(PrevBtn_MC);
            PrevBtn_MC.x = 1140;
            PrevBtn_MC.y = 710;
            NextBtn_MC.addEventListener(MouseEvent.MOUSE_DOWN, Nextpage);
            PrevBtn_MC.addEventListener(MouseEvent.MOUSE_DOWN, Prevpage);
        }

        public function Init():void{
            for(var i2:uint = 0; i2 < Game(this.parent).AllTerritories_Array[Game(this.parent).current_hex].Locals.length; i2++){
                var new_mon = new Monsters(Game(this.parent).AllTerritories_Array[Game(this.parent).current_hex].Locals[i2]);
                Enemy_Array.push(new_mon);
            }
            Load_Cards();
        }

        public function Load_Cards():void{
            if (!this.contains(CardsContainer)){
                addChild(CardsContainer);
                CardsContainer.x = 150;
                CardsContainer.y = 340;
            }
            NextBtn_MC.visible = true;
            PrevBtn_MC.visible = true;
            if (page >= Enemy_Array.length - 3){
                NextBtn_MC.visible = false;
            }
            if (page == 0){
                PrevBtn_MC.visible = false;
            }

            for (var i:uint = 0; i < 3; i++){
                if (Enemy_Array[page+i] != null){
                    Cards_Array[i] = new StatsCard();
                    CardsContainer.addChild(Cards_Array[i]);
                    Cards_Array[i].gotoAndStop(1);
                    Cards_Array[i].Name_Text.text = Enemy_Array[page+i].Species;
                    Cards_Array[i].Kills_Text.text = Enemy_Array[page+i].Kills;
                    Cards_Array[i].Hp_Text.text = Enemy_Array[page+i].MaxHp;
                    Cards_Array[i].Att_Text.text = Enemy_Array[page+i].Att;
                    Cards_Array[i].Agi_Text.text = Enemy_Array[page+i].Agi;
                    Cards_Array[i].Type_Text.text = Enemy_Array[page+i].Type;
                    Cards_Array[i].Class_Text.text = Enemy_Array[page+i].Class;
                    Cards_Array[i].AttackType_Text.text = Enemy_Array[page+i].AttackType;
                    Cards_Array[i].Effect_Text.text = Enemy_Array[page+i].Effect;
                    Cards_Array[i].Monster.gotoAndStop(Enemy_Array[page+i].ID);
                    Cards_Array[i].x += 330*i;
                }
            }
            
        }

        public function Nextpage(e:MouseEvent):void{
                page += 3;
                Unload_MonsterUI();
                Load_Cards();
        }
            
        public function Prevpage(e:MouseEvent):void{
                page -= 3;
                Unload_MonsterUI();
                Load_Cards();
        }

        public function Unload_MonsterUI():void{
            if (this.contains(CardsContainer)){
                while (CardsContainer.numChildren > 0) {
                    CardsContainer.removeChildAt(0);
                }
                removeChild(CardsContainer);
            }
        }

    }
}

        