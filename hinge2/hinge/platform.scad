md = 21.2;
ml = 41.5;
mt = 1.55; mt = 2;

sl = ml;
sw = 10.0;

fn = 60;

// microphone part ////////////////////////

module tube () {
    difference() {
        cylinder(h=1.1*ml, d=md, center=true, $fn=fn);
        cylinder(h=1.1*ml, d=md-2*mt, center=true, $fn=fn);
        translate([0, md/2.5, 0])
            cube([sw, 6, 1.1*sl],true);
    }
}


pw = 13.15;
ph = 8.13;
pl = ml;

module bracket () {
    difference() {
        cube([pw, ph, pl],true);
        translate([0, -ph, 0])
            tube();
        translate([0, -ph, ml/2])
            cylinder(h=2*2, d=md, center=true, $fn=fn);
        translate([0, -ph, -ml/2])
            cylinder(h=2*7, d=md, center=true, $fn=fn);
    }
}

fd = 3.8;
fl = 7.8;

module feedthrough () {
    translate([0, 0, -17]) {
        rotate([90,0,0])
            cylinder(h=1.1*ph, d=fd, center=true, $fn=30);
        translate([0,3,-3.5])
            cube([fd,fd,2*fd],true);
        cube([fl,6,fl], true);
    }
}

module mic_part () {
    difference() {
        bracket();
        feedthrough();
    }
}


// stand part /////////////

module hole (z,r1,r2) {
    i = 2; 
    fn = 30;
    translate([0,0,-1]) cylinder (z+2, r=r1, $fn=fn);
    translate([0,0,-1]) cylinder (i+1, r=r2, $fn=fn);
    translate([0,0,z-i]) cylinder (i+1, r=r2, $fn=fn);
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


module hinge () {
    x = 20;
    y = 8;
    z = pw;
    s = 6.5;
    difference() {
        body(x,y,z);
        hole(z,6.2/2,10.2/2);
        slot(z);
    }
    *translate([-13.3,-26.07,0])
        platform(z);
}


// final assembly /////////

module assembly() {
    print = [90,180,0];
    design = [0,0,0];
    rotate(print) {
        mic_part();
        translate([-pw/2,17.4,3.83])
            //cube([pw,10,4], true);
            rotate([90,0,90])
                hinge();
    }
}

module testprint() {
    intersection() {
        assembly();
        translate([0,17,-5])
            cube([20,25,20],true);
    }
}

if (1) assembly();
else testprint();