
// Sphere diam	 12.0mm (.47")
// Sphere chop	  8.5mm (.33")
// Stem diam	  6.0mm (.24")
// Stem length	 20.0mm (.79")

rs = 12.0/2;
hs = 8.5;

rc = 6.0/2;
hc = 20.0 + hs/2;

// the cylinder diameter is measuring about 0.5mm short of 6mm

rc = 6.5/2;

module coupler() {
    intersection() {
        sphere(r=rs, $fn=30);
        cube([2*rs, 2*rs, hs], true);
    }
    cylinder(hc, rc, rc, $fn=20);
} 

for(x=[0:1])
    translate([2.1*rs*x,0,0])
        coupler();