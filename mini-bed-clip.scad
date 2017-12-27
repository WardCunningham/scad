r = 17.825;
h = 5;
difference(){
    cylinder(h=5,r=r+1);
    translate([0,0,-1]) cylinder(h=7,r=r);
    translate([0,-17,2]) cube([40,20,7],true);
}
translate([21,0,0])
    difference() {
        cylinder(h=2,r=3);
        translate([0,0,-1])cylinder(h=4,r=2);
    }
