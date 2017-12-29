// abstract computer terminal
// ward cunningham, 12/26,2017

// keyboard
cube([20,20,5],true);
module button (x,y) { translate([x,y,2.5]){ cube(2,true); } }
button(0,-8); button(0,-5); button(0,-2);
button(3,-8); button(3,-5);

// monitor
translate([-5,0,10])rotate([0,-110,0]) {
    difference() {
        // cabinet
        rotate([0,0,45]) { cylinder(9,14,7,$fn=4); }
        // screen
        translate([0,0,-2]) cube([16,17,5],true);
}
}