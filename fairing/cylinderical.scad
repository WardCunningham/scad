
function radius (i) = 10 * pow(1.15,i);

module outside (h, i) {
    cylinder(h, radius(i), radius(i+1));
}

module inside (h, i) {
    extension = .01;
    thickness = 1.5;
    translate([0,0,-extension/2])
        cylinder(h+extension, radius(i-thickness), radius(i+1-thickness));
}

module fairing () {
for (i = [0:15]) {
    step = 5;
    translate([0,0,step*i])
        difference() {
            outside(step, i);
            inside(step, i);
        }
}
}

difference () {
    fairing ();
    translate ([0,0,-1]) cube(100,100,100);
}