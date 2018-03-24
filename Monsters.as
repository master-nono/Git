package { 
    import flash.display.*;

    public class Monsters extends Sprite {

        public var ID:int;
        public var Species:String;
        public var Lv:uint;
        public var Kills:String;
        public var MaxHp:int;
        public var Att:int;   
        public var Agi:int;
        public var Type:String;
        public var Class:String;
        public var AttackType:String;
        public var Effect:String;
        public var Royal:String;

        public var Senses:int; 
        public var Intelligence:int;
        public var Traveling:int;
        public var Endurance:int;
        public var Cooperativeness:int;
        public var Appearance:int;
        public var Camouflage:int;
        public var Specialty:String;
        public var Tier:uint;
        public var Habitat:uint;
        public var BornAt:uint;
        public var ToBe:uint;
        public var MemberNo:uint;
        public var Lore:String;
        public var Foundby = 0;//1=breed, 2=wild, 3=both
        public var DiaProgress:uint;
        public var RelationshipPts:uint;
        public var Seenin:String;
        public var Region:String;

        public var Jungle:uint = 1;
        public var Desert:uint = 2;
        public var Volcano:uint = 3;
        public var Mountain:uint = 4;
        public var Cave:uint = 5;
        public var Swamp:uint = 6;
        public var Iceland:uint = 7;
        public var Grassfield:uint = 8;
        public var Lake:uint = 9;

        public var InherSenses:int; 
        public var InherIntelligence:int;
        public var InherTraveling:int;
        public var InherEndurance:int;
        public var InherCooperativeness:int;
        public var InherAppearance:int;
        public var InherCamouflage:int;
        
        //public var Hp:int;
        //public var As:int;
        //public var Ms:int;
        //public var HpBuff:int;
        //public var AttBuff:int;
        //public var AgiBuff:int;
        //public var AsBuff:int;
        //public var MsBuff:int;
        //public var Eff:Boolean;
        //public var Efffor:String;
        //public var Aura:int;
        //public var Busy:int;
        //public var AttackRange:int;
        //public var TargetType:String;
        //public var Aoe:int;
        //public var Preference:int;
        //public var Condition:String;
        //public var AffectedBy:Array = new Array();
        //public var Recharging:int;
        //public var Instances:int;
        //public var CurrentInstances:int;
    
        public function Monsters(id :uint){

            DiaProgress = 0;
            RelationshipPts = 0;

            if (id == 0) {
                ID = 201;
                Species = "Unknown";
                Lv = 0;
                Kills = "N/A Kills";
                MaxHp = 10;
                Att = 1;
                Agi = 1;
                Type = "Unknown";
                Class = "Unknown";
                AttackType = "Melee";
                Effect = "Unknown";
                Senses = 20;
                Intelligence = 5;
                Traveling = 20;
                Endurance = 10;
                Cooperativeness = 50;
                Appearance = 10;
                Camouflage = 39;
                Specialty = "N/A";
                Tier = 0;
                Habitat = Lake;
                BornAt = 0;
                ToBe = 0;
                Royal = ""
                MemberNo = 0;
                Foundby = 3;
                InherSenses = 0;
                InherIntelligence = 0;
                InherTraveling = 0;
                InherEndurance = 0;
                InherCooperativeness = 0;
                InherAppearance = 0;
                InherCamouflage = 0;
                Lore = "";
            }
            /** if (id == 1) {
                ID = 1;
                Species = "Weta";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 100;
                Att = 17;
                Agi = 85;
                Type = "Offense";
                Class = "Armor";
                AttackType = "Melee";
                Effect = "Take no damage from the first two instances of attack";
                Senses = 15;
                Intelligence = 28;
                Traveling = 8;
                Endurance = 68;
                Cooperativeness = 33;
                Appearance = 56;
                Camouflage = 26;
                Specialty = "N/A";
                Tier = 1;
                Habitat = Jungle;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 3;
                Seenin = "Seen in the North";
                Region = "Region: Valden";
                Lore = "An aggressive species indigenous to hot dry climates, the Weta primarily relies on its quick reflexes and jellyfish-like stinging tentacles to subdue its prey. The Weta’s sting, unlike most poisonous stinging creatures, has a unique effect on female victims in that it causes their nipples to become especially sensitive to further stimulation. In some cases it can even cause outright lactation to occur spontaneously. It then uses this enhanced sensitivity to subdue them and subsequently impregnate them.";
            }
            if (id == 2) {
                ID = 2;
                Species = "Wolfong";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 95;
                Att = 19;
                Agi = 80;
                Type = "Offense";
                Class = "Giant";
                AttackType = "Melee";
                Effect = "Increase attack range";
                Senses = 61;
                Intelligence = 63;
                Traveling = 53;
                Endurance = 23;
                Cooperativeness = 51;
                Appearance = 20;
                Camouflage = 12;
                Specialty = "N/A";
                Tier = 1;
                Habitat = Volcano;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 1;
                Seenin = "No record";
                Region = "Region: Unknown";
                Lore = "";
            } **/
            if (id == 3) {
                ID = 3;
                Species = "Dolphy";
                Lv = 1;
                Kills = "3 Kills";
                MaxHp = 65;
                Att = 7;
                Agi = 115;
                Type = "Offense";
                Class = "Speed";
                AttackType = "Range";
                Effect = "Increase 100% move speed when nothing is blocking its way";
                Senses = 43;
                Intelligence = 83;
                Traveling = 80;
                Endurance = 71;
                Cooperativeness = 88;
                Appearance = 71;
                Camouflage = 24;
                Specialty = "80% chance to save a turn when exploring Ally's territory";
                Tier = 1;
                Habitat = Grassfield;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 3;
                Seenin = "Seen in the Central East";
                Region = "Region: Silvergrass";
                Lore = "Even among tentacle monster species, the Dolphy has an above average preference for the lewd and the perverse. It is native to plains and parries and prides itself on its exceptional running speed. Considered below average as a combatant, the Dolphy tries to prioritize obfuscation techniques to escape injury. It possesses two separate heads, but one of them is false, keeping its real head on its tail for added protection.";
            }
            if (id == 4) {
                ID = 4;
                Species = "Red Lion";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 105;
                Att = 20;
                Agi = 95;
                Type = "Offense";
                Class = "Power";
                AttackType = "Melee";
                Effect = "Attack increase by 5";
                Senses = 18;
                Intelligence = 55;
                Traveling = 46;
                Endurance = 60;
                Cooperativeness = 81;
                Appearance = 13;
                Camouflage = 18;
                Specialty = "N/A";
                Tier = 1;
                Habitat = Mountain;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the West";
                Region = "Region: Orham";
                Lore = "Native to mountainous environments, the savage-looking Red Lion is deceptively gentle. These creatures are known for their surprisingly attentive love-making and as such are regarded as a rare treasure. Red Lions are non-aggressive and can even be domesticated as pets if treated well.";
            }
            if (id == 5) {
                ID = 5;
                Species = "Inker";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 75;
                Att = 6;
                Agi = 90;
                Type = "Defense";
                Class = "Intelligence";
                AttackType = "Range";
                Effect = "Increase its agility by 40 when enemy falls within Inker's melee range";
                Senses = 46;
                Intelligence = 78;
                Traveling = 57;
                Endurance = 22;
                Cooperativeness = 41;
                Appearance = 24;
                Camouflage = 26;
                Specialty = "N/A";
                Tier = 1;
                Habitat = Swamp;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the Central";
                Region = "Region: Highburn";
                Lore = "Sly and slimy, the Inker is a creature with a skulking and defensive nature. Indigenous to warm, damp places, the Inker employs its slimy nature brilliantly to forge potent defenses. By secreting a mixture of a dozen different types of slime, this sly beast creates “Trap zones” and even uses itself as bait to lure prey into its traps. Once lured in, the victim will quickly find their movements clumsy due to the sticky and slippery surfaces and shortly thereafter they will be bound tightly by the Inker’s many tendrils. Following mating, the inker produces an excessive amount of additional ejaculate which not only serves to thoroughly impregnate its hapless target, but also to create yet another layer of slime to deter any potential predators as it quickly makes its escape.";
            }
            if (id == 9) {
                ID = 9;
                Species = "Butanga";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 100;
                Att = 15;
                Agi = 90;
                Type = "Support";
                Class = "Armor";
                AttackType = "Melee";
                Effect = "Reduce damage taken by 25%";
                Senses = 24;
                Intelligence = 36;
                Traveling = 29;
                Endurance = 58;
                Cooperativeness = 51;
                Appearance = 28;
                Camouflage = 31;
                Specialty = "N/A";
                Tier = 1;
                Habitat = Jungle;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the Central";
                Region = "Region: Highburn";
                Lore = "Solitary are they. Formed of silence and docility. But that is not to say they are defenseless by any means. Living deep in the old places of the world, the are usually not interested in the ‘fairer sex’. However, under certain circumstances they become ardent lovers. The trigger is not well known, be it season, moon phase or simply temperature. Once their ‘rut’ is over, they return to their lonely ways. Leaving the object of their affections to care for the young. During these times they like to demonstrate their dominance by keeping their body balanced, proving their strength and agility.";
            }
            if (id == 13) {
                ID = 13;
                Species = "Scorpse";
                Lv = 1;
                Kills = "4 Kills";
                MaxHp = 90;
                Att = 19;
                Agi = 100;
                Type = "Offense";
                Class = "Venom";
                AttackType = "Melee";
                Effect = "Reduce enemy agility by 10 on each attack";
                Senses = 43;
                Intelligence = 78;
                Traveling = 38;
                Endurance = 29;
                Cooperativeness = 31;
                Appearance = 26;
                Camouflage = 20;
                Specialty = "N/A";
                Tier = 2;
                Habitat = Desert;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the Central";
                Region = "Region: Valpine";
                Lore = "The Scorpse, as can easily be easily gathered from its appearance, is a venomous species, but not in the traditional sense. During copulation, the Socrpse generates copious amounts of pre-ejaculate fluid which acts both as mild paralytic and an aphrodisiac. It prefers to mate via long, slow, deliberate sessions which bring its mate to orgasm countless times. Once finished, its foam-like semen forms a plug in the chosen hole, trapping the sperm inside and ensuring a higher impregnation rate. The Scorpse is nature to hot, dry environments and to combat the heat, it regularly covers its carapace in an oily film possessing the same venomous qualities as its semen.";
            }
            if (id == 17) {
                ID = 17;
                Species = "Dubois";
                Lv = 1;
                Kills = "4 Kills";
                MaxHp = 95;
                Att = 13;
                Agi = 105;
                Type = "Defense";
                Class = "Intelligence";
                AttackType = "Melee";
                Effect = "Agility increase by 40 deal damage to enemy's second unit";
                Senses = 61;
                Intelligence = 53;
                Traveling = 39;
                Endurance = 34;
                Cooperativeness = 59;
                Appearance = 34;
                Camouflage = 69;
                Specialty = "N/A";
                Tier = 2;
                Habitat = Cave;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the Central";
                Region = "Region: Unknown";
                Lore = "Stealth, patience and cunning are what Dubois uses to thwart it’s prey. Thus, after pouncing upon their victims from a place of hiding, they simply wait. Once the prone quarry opens their mouth to scream (or talk) they strike. Their reproductive organ is long and flexible, but also quite supple, perfect for penetrating orally. After thrusting deeply, the beast deposits a healthy load directly into the victim's stomach. Their sperm thrives in acidic environments, hence the stomach is a perfect incubation chamber for their young. Obviously this is a highly unusual method of procreation, and can therefore be quite uncomfortable for the expectant ‘mother’. The creature itself retains this preference for acidic environments, and can often be found in places most other creatures would not dare tread.";
            }
            if (id == 33) {
                ID = 33;
                Species = "Nodder";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 115;
                Att = 15;
                Agi = 85;
                Type = "Support";
                Class = "Giant";
                AttackType = "Melee";
                Effect = "Turn enemy into ally upon its second attack";
                Senses = 44;
                Intelligence = 71;
                Traveling = 31;
                Endurance = 51;
                Cooperativeness = 52;
                Appearance = 31;
                Camouflage = 32;
                Specialty = "Enable intelligence exchange";
                Tier = 3;
                Habitat = Iceland;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the South East";
                Region = "Region: Snowkeep";
                Lore = "A very hairy species, the Nodder is indigenous to extremely cold climates. Its thick hair both serves as a means of warmth and also an extension of its nature as a Tentacle Monster. Each individual hair follicle is capable to exchange mental imagery and is a tentacle in its own right. This gives the Nodder enchanced physical and mental manipulation ability, allowing this species to be extremely detail oriented when pleasing a potential mate.";
            }
            if (id == 34) {
                ID = 34;
                Species = "Slime Eye";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 85;
                Att = 14;
                Agi = 95;
                Type = "Support";
                Class = "Venom";
                AttackType = "Melee";
                Effect = "Turn enemy into ally upon its second attack";
                Senses = 51;
                Intelligence = 94;
                Traveling = 19;
                Endurance = 17;
                Cooperativeness = 50;
                Appearance = 31;
                Camouflage = 37;
                Specialty = "Build special nest for its Queen";
                Tier = 3;
                Habitat = Grassfield;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the Central East";
                Region = "Region: Unknown";
                Lore = "The Slime Eye is notably among the most intelligent of all Tentacle monster species, a fact it uses to its great advantage. But the Slime Eye is especially manipulative. It takes great pleasure in confusing and distracting its prey, making them walk headlong into elaborate traps. To aid this manipulation, the Slime Eye produces a series of mind-altering chemicals that it releases into the nearby air. This vaporous mist causes creatures to entire into a state of euphoria after even a single whiff. While in this dream-like state, the Slime Eye can take its time and perpetrate any number of unnamable lewd acts upon its mind-fogged prey. The Slime Eye is native to red woods nearby well-traveled roads for easy access to any prey who might wander too close to its vapors.";
            }
            if (id == 37) {
                ID = 37;
                Species = "Cirrus";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 110;
                Att = 25;
                Agi = 110;
                Type = "Offense";
                Class = "Power";
                AttackType = "Melee";
                Effect = "Reduce enemy offense class's attack speed to 0";
                Senses = 36;
                Intelligence = 46;
                Traveling = 32;
                Endurance = 36;
                Cooperativeness = 18;
                Appearance = 21;
                Camouflage = 23;
                Specialty = "N/A";
                Tier = 4;
                Habitat = Jungle;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the East";
                Region = "Region: Easthill";
                Lore = "The Cirrus is audacity personified. To this violent and arrogant species, a mate is little more than property to be marked and mounted. During their vigorous copulation, they strike at their partner with vine-like appendages that leave obviously raised welts, a clear sign that they were claimed by a Cirrus. Not limited to whipping, the Cirrus are known to choke, bite, and scratch to further assert their unquestionable dominance. While they display no direct interest in their partner’s satisfaction, the Cirrus are such potent love makers that they often leave their victims in a state of mindless bliss, if perhaps a bit sore for the next week or so. The Cirrus is native to jungles environments that suit their physique and temperament.";
            }
            if (id == 41) {
                ID = 41;
                Species = "Skitz";
                Lv = 1;
                Kills = "2 Kills";
                MaxHp = 130;
                Att = 19;
                Agi = 85;
                Type = "Defense";
                Class = "Giant";
                AttackType = "Melee";
                Effect = "Offer vision on the second line of enemies";
                Senses = 36;
                Intelligence = 72;
                Traveling = 38;
                Endurance = 55;
                Cooperativeness = 43;
                Appearance = 31;
                Camouflage = 22;
                Specialty = "N/A";
                Tier = 4;
                Habitat = Jungle;
                BornAt = 9999;
                Royal = ""
                MemberNo = 0;
                Foundby = 2;
                Seenin = "Seen in the North West";
                Region = "Region: Rayacre";
                Lore = "These smug-looking creatures are naturally playful, though their antics are far from harmless. The Skitz are native to jungle regions and are known for using their semen in frivolous ways; most notable among them being ejaculating all over the face and in the eyes of their mates. This is not conducive to mating at all, and in fact it seems to be more of a prank perpetrated for the pursuit of pure amusement.";
            }




            if (id == 501) {
                ID = 501;
                Species = "P.goff";
                Kills = "2 Kills";
                MaxHp = 96;
                Att = 21;
                Agi = 100;
                Type = "Offense";
                Class = "Power";
                AttackType = "Melee";
                Effect = "Increase attack speed by 20%";
            }
            if (id == 502) {
                ID = 502;
                Species = "Carcus";
                Kills = "4 Kills";
                MaxHp = 125;
                Att = 12;
                Agi = 75;
                Type = "Defense";
                Class = "Armor";
                AttackType = "Melee";
                Effect = "Reflect 60% damage dealt by enemy melee unit";
            }
            if (id == 503) {
                ID = 503;
                Species = "Grenepedes";
                Kills = "4 Kills";
                MaxHp = 85;
                Att = 6;
                Agi = 110;
                Type = "Defense";
                Class = "Speed";
                AttackType = "Range";
                Effect = "Dogde all enemy Intelligence class attack";
            }

        }


    }
}

        