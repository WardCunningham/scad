s = 60;
t = 12;

module base() {
    linear_extrude(height = 4)
      polygon(
        [[-s,-12], [-15,t],
        [s,-12],   [15,t],
        [s/2,s],  [20,s-t],
        [-s/2,s], [-20,s-t]],
        paths=[[0,2,4,6], [1,3,5,7]]);
    translate([-30,7,3])
      brace();
    translate([30-3,7,3])
      brace();
}

module brace() {
  rotate([90,0,90])
    linear_extrude(height = 3)
      polygon([[0,0],[30,0],[0,15],[0,0]]);
}

module clamp(s) {
  w = 5; h = 25;
  translate([-s,0,2])
  rotate([90,0,90])
    linear_extrude(height = 2*s)
      polygon(
        [[0,0],[w,0],[w+4,15],[w+5,h],
        [w+7,h],[w+7,-2],[-3.5,-2],[-3.5,10],
        [-1.5,10],[-1.5,0],[0,0]]);
}
      
base();
translate([0,-5,3])
  rotate([-8,0,0])
    clamp(1.1*s);
