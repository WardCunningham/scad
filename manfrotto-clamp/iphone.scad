w = 67.25;
h = 138.4;
d = 7.1;

bt = 2;

$fn = 10;

module camera() {
    translate([13,6.5,bt/2]) {
        cylinder(d=7.5, h=1.1*bt, center=true);
    }
}

module back() {
    bw = 6;
    difference() {
        cube ([w,h,bt]);
        translate([bw,bw,-.05*bt])cube ([w-2*bw,h-2*bw,1.1*bt]);
        camera();
    }
}

module corner() {
    cw = 12;
    cr = 1;
    // minkowski() {
        translate([-bt,-bt,0]) {
            cube ([cw,bt,d+bt]);
            cube ([bt,cw,d+bt]);
            translate([0,0,d+bt])
                cube ([cw,cw,bt]);
        }
    // sphere(cr);
    // }
}
    
module frame() {
    back();
    translate([0,0,0])scale([1,1,1])corner();
    translate([w,0,0])scale([-1,1,1])corner();
    translate([0,h,0])scale([1,-1,1])corner();
    translate([w,h,0])scale([-1,-1,1])corner();
}


od = 15.75;
ol = 4.15;
id = 11.75;
il = 17.0;
fd = 11.1;
sl = 10.3;

cw = 25;
module axle () {
    ch = d+2*bt;
    cl = 1;
    co = 20;

    translate([od/2,-co,0]) {
        rotate([90,0,0]) {
            difference() {
                cylinder(d=id, h=sl+il+ol, $fn=30);
                translate([id/2-(id-fd),-il/2,sl])
                    cube([il,il,il]);
            }
            cylinder(d=od, h=sl, $fn=30);
            hull() {
                cylinder(d=od, h=0.1, $fn=30);
                translate([-od/2,-cw/2,-co])
                    cube([ch, cw, cl]);
            }
            translate([0,0,sl+il]) cylinder(d=od, h=ol, $fn=30);
        }
    }
}

module clip() {
    translate([w,h/2,0]) {
        rotate([0,-90,90]) {
            axle();
        }   
        cylinder(h=bt,d=cw);
        translate([0,0,d+bt]) cylinder(h=bt,d=cw);
    }
}

frame();
clip();
//axle();
