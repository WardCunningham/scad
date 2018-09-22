h = 2;
w = 4;
l = 60;

//translate([0,-2,5])import("zipper-pull.stl");

module turn() {
    intersection () {
        rotate([90,0,0])
            difference() {
                cylinder(r=h+h, h=w, $fn=40, center=true);
                cylinder(r=h, h=w*1.1, $fn=20, center=true);
            };
         translate([w/2,0,-w/2])
            cube([w,w*1.1,w],true);
    }
       
}

module cap() {
    translate([3*h/2,0,h/2])
        cube([h+2,w+2,h],true);
}

module tail() {
    d = -3*h/2;
    difference() {
        translate([-l/2,0,d])
            cube([l,w,h],true);
        for(i=[l/6:2*h:l]) {
            x = max(w*(l-i)/l, 1);
            translate([-i,-x,d])
                cube([1/2,w,h*1.3],true);
            translate([-i+h,x,d])
                cube([1/2,w,h*1.3],true);
        }
    }
}

cap();
turn();
tail();