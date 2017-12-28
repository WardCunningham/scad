r = 17;
dr = 3;
h = 10;
difference(){
    cylinder(h=h,r=r+dr);
    translate([0,0,-1]) cylinder(h=h+2,r=r);
    translate([0,-17-2,2]) cube([40,20,2*h+2],true);
}
translate([r+dr+1,0,0])
    difference() {
        cylinder(h=2,r=3);
        translate([0,0,-1])cylinder(h=4,r=2);
    }

translate([-10,r,0])rotate([0,0,0]) {
    difference() {
        cube([20,13,20]);
        translate([10,0,15])rotate([-55,0,0]) {
            translate([0,0,-10])cylinder(h=40,r=9);
        }
    }
}