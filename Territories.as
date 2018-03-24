package { 
    import flash.display.*;

    public class Territories extends Sprite {

        public var ID:int;
        public var Name:String;
        public var Food:int;
        public var Mineral:int;
        public var TStatus:String;
        public var Connected:uint;
        public var Unlocked:uint;
        public var Country:String;
        public var Locals:Array;
        public var Species:String;
        
        public function Territories(id :uint){
            
            TStatus = "Notava";
            Unlocked = 0;
            Locals = [];

            if (id == 1) {
                ID = 1;
                Name = "Secret Garden"
                Food = 9;
                Mineral = 5;
                TStatus = "Ally";
                Connected = 1;
                Unlocked = 1;
                Country = "Tentacles";
            }
            if (id == 904) {
                ID = 904;
                Name = "Silvergrass"
                Food = 18;
                Mineral = 10;
                TStatus = "Enemy";
                Connected = 1;
                Country = "Arthropod Kingdom";
                Locals = [501, 501, 501, 502, 502, 502, 503];
                Species = "Dolphy";
            }
            if (id == 905) {
                ID = 905;
                Name = "Springmount"
                Food = 25;
                Mineral = 20;
                TStatus = "Ally";
                Connected = 1;
                Unlocked = 1;
                Country = "Humana Kingdom";
            }
            if (id == 906) {
                ID = 906;
                Name = "Snowkeep"
                Food = 12;
                Mineral = 19;
                TStatus = "Enemy";
                Connected = 1;
                Country = "Arthropod Kingdom";
                Locals = [501, 501, 501, 502, 502, 502, 502, 503];
                Species = "Nodder";
            }
            if (id == 805) {
                ID = 805;
                Name = "Highburn"
                Food = 23;
                Mineral = 14;
                TStatus = "Enemy";
                Connected = 1;
                Country = "Arthropod Kingdom";
                Locals = [501, 501, 502, 502, 502, 503, 503];
                Species = "Butanga, Inker";
            }
            if (id == 806) {
                ID = 806;
                Name = "Valpine"
                Food = 22;
                Mineral = 17;
                TStatus = "Enemy";
                Connected = 1;
                Country = "Arthropod Kingdom";
                Locals = [501, 501, 501, 501, 501, 501, 501, 502];
                Species = "Scorpse";
            }
            if (id == 1005) {
                ID = 1005;
                Name = "Easthill"
                Food = 28;
                Mineral = 17;
                TStatus = "Enemy";
                Connected = 1;
                Country = "Arthropod Kingdom";
                Locals = [501, 501, 501, 502, 502, 502, 502, 503];
                Species = "Cirrus";
            }
            if (id == 1006) {
                ID = 1006;
                Name = "Lowerbank"
                Food = 34;
                Mineral = 12;
                TStatus = "Enemy";
                Connected = 1;
                Country = "Arthropod Kingdom";
                Locals = [501, 501, 502, 502, 502, 502, 503, 503];
                Species = "";
            }
            if (id == 1007) {
                ID = 1007;
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "Arthropod Kingdom";
            }
            if (id == 703) {
                ID = 703;
                Name = "Corpond";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
            if (id == 803) {
                ID = 803;
                Name = "Valden";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
            if (id == 608) {
                ID = 608;
                Name = "Crystalice";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
            if (id == 707) {
                ID = 707;
                Name = "Greyton";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
            if (id == 1107) {
                ID = 1107;
                Name = "Esterwind";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
            if (id == 404) {
                ID = 404;
                Name = "Rayacre";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
            if (id == 405) {
                ID = 405;
                Name = "Orham";
                Food = 25;
                Mineral = 5;
                TStatus = "Enemy";
                Connected = 0;
                Country = "";
            }
        }

    }
}

        