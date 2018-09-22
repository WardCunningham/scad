r = 17;
dr = 3;
h = 15;

top = -1; // 1 or -1

module slot (p) {
    translate(p) rotate([0,0,45]) cube([5,5,3],true);
}
    
module clip () {
difference(){
    dy = -17-2-4;
    cylinder(h=h,r=r+dr);
    translate([0,0,-1]) cylinder(h=h+2,r=r,$fn=90);
    translate([0,dy,2]) cube([40,20,2*h+2],true);

    if (top < 0) {
      slot([11,15,0]);
      slot([-11,15,0]);
      slot([11,15,15]);
      slot([-11,15,15]);
    
      slot([13,dy+11,4]);
      slot([13,dy+11,11]);
      slot([-13,dy+11,4]);
      slot([-13,dy+11,11]);
    }
}


translate([top*(r+dr+3),0,0])
    difference() {
        $fn=24;
        r = 4;
        cylinder(h=5,r=r);
        translate([0,0,-1])cylinder(h=7,r=r-1);
        slot([0,-5,1]);
        slot([0,-5,3.99]);
    }
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
