// pin

d = 6.76; d = 7.6;
l = 31.5; l = 32.5; l = 32.5 + 1.71;
s = 47.61; s = 50; s=51;

// flange

fw = 15.14;
fh = 19.39;
ft = 2.3;

// notch

nz = 12.6; 
nw = 3.2;
nd = 0.8;

// plate

pw = 41.5; pw = s + d + 2;
ph = 20.0;
pt = 3.15;

// platform

tl = 199;
tw = 87;
td = 10.25;


module pin () {
    $fn = 30;
    difference() {
        cylinder(l, d=d, true);
        translate([d/2,0,l])
            rotate([0,45,0])
                cube(d*1.415, true);
        translate([d/2-nd,0,l-nz])
            cube([d/2,d,nw], true);
    }
}

module flange() {
    translate([0,-ft/2,0])
        difference() {
            cube([fw,ft,fh]);
            translate([-1,-.1,l-nz-0.5])
                rotate([0,30,0])
                    cube([22,ft+.2,fh]);
        }
}

module plate() {
    translate([0,-ph/5,0])
        cube([pw,ph,pt], true);
}

translate([-s/2,0,0]) {
    pin();
    flange();
}

translate([s/2,0,0]) {
    pin();
    rotate([0,0,180])
        flange();
}

plate();