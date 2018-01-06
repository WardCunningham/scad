module hole (z,r1,r2) {
    i = 2;
    translate([0,0,-1]) cylinder (z+2, r=r1);
    translate([0,0,-1]) cylinder (i+1, r=r2);
    translate([0,0,z-i]) cylinder (i+1, r=r2);
}

module slot (z) {
    s = 6;
    d = 10;
    translate([-d,-10,(z-s)/2]) cube([20,30,s]);
}
   
module body (x,y,z) {
    x2 = 13.5;
    difference() {
        rotate([0,0,-30]) translate([-x,-y,0]) cube([x,2*y,z]);
        translate([-x2-10,-2,-1]) cube([10,20,z+2]);
    }
    translate([-x2,-y,0]) cube([x2,2*y,z]);
    cylinder(z, r=y);    
}

module feedthrough (z) {
    rf = 4.5/2;
    translate([0,rf+1,z/2]) rotate([90,180,90]) {
        cylinder(5, r=rf);
        translate([0,-rf,0]) cube([5,2*rf,5]);
    }
}

module platform (z) {
    d = 43;
    e = 4.5;
    rm = 23/2;
    translate([-e,0,0]) difference() {
        cube([e,d,z]);
        translate([-2,-2,2]) cube([e,d,z-4]);
        translate([-rm+2,d+1,z/2]) rotate([90,0,0]) cylinder(d+2,r=rm);
        feedthrough(z);
    }
    
}

module hinge () {
    x = 20;
    y = 8;
    z = 13;
    s = 6.5;
    %difference() {
        body(x,y,z);
        #hole(z,6.2/2,10.2/2);
        slot(z);
    }
    *translate([-13.3,-26.07,0])
        platform(z);
}



hinge();