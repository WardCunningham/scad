 
 // https://doc.cgal.org/latest/Minkowski_sum_3/index.html
 
 $fn=50;
 cube([10,10,1]);
 cylinder(r=2,h=1);
 
translate([0,0,10])
minkowski()
{
  cube([10,10,1]);
  cylinder(r=2,h=1);
}
 
translate([0,0,20])
minkowski()
{
  cube([10,10,1]);
  sphere(2);
}
 
translate([0,0,30])
minkowski()
{
  union() {
      cube([10,10,1]);
      cube([10,1,10]);
  }
  //intersection() {
      sphere(2);
  //    cube(2);
  //}
}
