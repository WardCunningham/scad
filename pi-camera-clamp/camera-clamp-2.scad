w = 36;
h = 77;
t = 10;

module base () {
    translate([0,0,0])
        cube([w,h,t],true);
        cube([w+10,40,t],true);
}

module slot (x,y) {
    d = 20;
    hh = 61.5;
    ww = 23;
    l = 1.2 * t;
    
    translate([x*(ww/2), y*(hh/2), -l/2])
      cylinder(h=l,r=8.5/2, $fn=30);
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
    translate([0,l/2,4-d/2])
        rotate([90,0,0])
            cylinder(h=l,r=d/2,$fn=90);
}

module shape (x) {
    d = w/2;
    l = 1.2*h;
    translate([x*w/2,l/2,-t/2])
        rotate([90,0,0])
            cylinder(h=l,r=d/2,$fn=90);
}

module shapes () {
    shape(+1);
    shape(-1);
}
        

difference () {
    base();
    slots();
    //recess();
    shaft();
    shapes();
}

