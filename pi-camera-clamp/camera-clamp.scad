w = 36;
h = 77;
t = 10;

module base () {
    translate([0,0,0])
        cube([w+6,h+6,t],true);
}

module slot (x,y) {
    d = 15;
    l = 1.2*t;
    translate([x*(w-d), y*(w-d), -l/2])
      cylinder(h=l,r=4, $fn=30);
}

module slots () {
    slot(+1,+1);
    slot(+1,-1);
    slot(-1,+1);
    slot(-1,-1);
}

module recess () {
    translate([0,0,8])
        cube ([w,h,10],true);
}

module shaft () {
    d = 12.5;
    l = 1.2*h;
    translate([0,l/2,2-d/2])
        rotate([90,0,0])
            cylinder(h=l,r=d/2,$fn=90);
}

module shape () {
    d = 1.39*w;
    l = 1.2*h;
    translate([0,l/2,.36*d])
        rotate([90,0,0])
            cylinder(h=l,r=d/2,$fn=90);
}
        

difference () {
    difference () {
        base();
        slots();
        recess();
        shaft();
    }
    difference () {
        base();
        shape();
    }
}
