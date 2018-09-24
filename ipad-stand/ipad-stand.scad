s = 60;
t = 12;

module base() {
    linear_extrude(height = 4)
      polygon(
        [[-s,0], [-15,t],
        [s,0],   [15,t],
        [s/2,s],  [20,s-t],
        [-s/2,s], [-20,s-t]],
        paths=[[0,2,4,6], [1,3,5,7]]);
    translate([-30,5,0])
      cube([3,30,15]);
    translate([30-3,5,0])
      cube([3,30,15]);
}

module clamp() {
  translate([15,13,18])
    sphere(3,true,$fn=20);
  translate([-15,13,18])
    sphere(3,true,$fn=20);
  translate([-s,0,2])
  rotate([90,0,90])
    linear_extrude(height = 2*s)
      polygon(
        [[-1.5,4],[-1,4],[-1,1],[0,0],[4,0],[8,15],[9,20],
        [11,20],[11,-2],[-3.5,-2],[-3.5,10],
        [-1.5,10],[-1.5,4]]);
}
      

module oldclamp() {
    
// choose a such that cg of tablet at 90mm displaced s/2 or 25mm
// google arctan (25/90) in degrees 

    a = 15.5;
    z = 10;
    translate([0,0,9.5])
    rotate([-a,0,0])
      difference() {
        cube([2*s-15, z+4, 15], true);
        translate([0,0,4.5])cube([2*s, z, 2*z], true);
    }  
}


base();
translate([0,-5,3])
  rotate([-8,0,0])
    clamp();
translate([0,-30,0])
  clamp();