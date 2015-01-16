// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// Modified by dviejo for prusa i3 'dual frame' mutation

belt_tooth_distance = 2;
belt_tooth_ratio = 0.8;

extraHeight = 4;


module belt_holder_base(beltOffset=0){
 translate([-33-8.5,0+beltOffset,-1]) cube([33,15,16]); 
 translate([-33-8.5,11,-1]) cube([33,15,16]);
 translate([-50,22,-1]) cube([50,4+extraHeight,16]);
}

module belt_holder_beltcut(beltOffset=0){
 position_tweak=0.5; //-0.2
 // Belt slit
 translate([-66,-0.5+10+beltOffset,belt_tooth_distance+1.5]) cube([67,0.8,15]);
 // Smooth insert cutout
 translate([-66,-0.5+10+beltOffset,12]) rotate([45,0,0]) cube([67,15,15]);
 // Individual teeth
 for ( i = [0 : 23] ){
   translate([0-i*belt_tooth_distance+position_tweak,-0.5+8+beltOffset,4.5]) 
     cube([belt_tooth_distance-belt_tooth_ratio,2.8,15]);
 }
 // Middle opening
 translate([-2-25,-1+beltOffset,3]) cube([4,11,15]);	
}

module belt_holder_holes(){
 translate([-4.5,0,7.5]) rotate([-90,0,0]) cylinder(h=50, r=1.7, $fn=10);
 translate([-45.5,0,7.5]) rotate([-90,0,0]) cylinder(h=50, r=1.7, $fn=10);
 
 //bolt caps
 translate([-4.5,0,7.5]) rotate([-90,0,0]) cylinder(h=22+extraHeight, r=3.15, $fn=15);
 translate([-45.5,0,7.5]) rotate([-90,0,0]) cylinder(h=22+extraHeight, r=3.15, $fn=15);
}

// Final part
module belt_holder(){
  off=1;
 difference(){
  belt_holder_base(beltOffset=off);
  belt_holder_beltcut(beltOffset=off);
  belt_holder_holes();
 }
}

belt_holder();