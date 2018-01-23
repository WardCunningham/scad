r = 17;
dr = 3;
h = 15;

module clip () {
difference(){
    cylinder(h=h,r=r+dr);
    translate([0,0,-1]) cylinder(h=h+2,r=r,$fn=90);
    translate([0,-17-2,2]) cube([40,20,2*h+2],true);
}
//translate([r+dr+1,0,0])
//    difference() {
//        cylinder(h=2,r=3,$fn=24);
//        translate([0,0,-1])cylinder(h=4,r=2,$fn=24);
//    }
}

module tablet () {
    difference() {
        scale(.5)scale([1.8,1.1,1.8]) {
            sphere(10);
            cylinder(30, r=10);
            rotate([0,90,0]) { cylinder(30, r=10); }
            translate([0,-10,0]) { cube([30,20,30]); }
        }
        translate([-20,2,-20]) { cube([80,15,80]); }
    }
}

module socket () {
    translate([0,-.5,0]) rotate([0,-56,0]) {
        difference() {
            translate([0,.5,0]) scale(1.4) tablet();
            //translate([-12,-8,-12]) { cube([35,12,35]); }
            tablet();
        }
    }
}

clip();
difference() {
    translate([0,r+9,11]) socket();
    translate([-10,15,-20]) cube(20);
    translate([-40,0,h+0.2]) cube(80);
}
