w = 29;
h = 38;

t = 1.7;
ld = 9.8;
sd = 5.0;

x = 8.6/2;
y = 16.4;

module clip (d, x, y, lean) {
    dy = 0.6 * lean;
    translate([x,y,0])
        cylinder(h=t, d=d, $fn=30, center=true);
    translate([x,y+dy,t])
        cylinder(h=t, d=d, $fn=30, center=true);    
}

clip(ld, 0, 0, 1);
clip(sd, x, y, -1);
clip(sd, -x, y, -1);
translate([0,0,-t])
    cube([w,h,t], true);

oh = 19;
ih = oh/2;

translate([0,(h+oh)/2,-t]) {
    difference() {
        cube([w,oh,t],true);
        cube([w/2,ih,1.1*t],true);
    }
}