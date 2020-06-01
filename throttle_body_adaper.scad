
$fn=128;

module flange() {
  difference() {
    hull() {
      cylinder(h=12, d=70);
      translate([(96-30)/2,0,0])
        cylinder(h=12, d=30);
      translate([-(96-30)/2,0,0])
        cylinder(h=12, d=30);
    }
    translate([0,0,-.05])
      cylinder(h=12.1, d1=58, d2=50);
    hull() {
      translate([(73+7)/2, 0, 0])
        cylinder(h=100, d=7, center=true);
      translate([100, 0, 0])
        cylinder(h=100, d=7, center=true);
    }
    hull() {
      translate([-(73+7)/2, 0, 0])
        cylinder(h=100, d=7, center=true);
      translate([-100, 0, 0])
        cylinder(h=100, d=7, center=true);
    }
  }
}

module pipe() {
  difference() {
    union() {
      rotate_extrude(angle=90, convexity=4)
        translate([50, 0, 0])
          circle(d=60);
    }

    union() {
      rotate_extrude(angle=90, convexity=4)
        translate([50, 0, 0])
          circle(d=50);
      translate([50, 0.1, 0])
        rotate([90,0,0])
          cylinder(h=5.2, d=50);
      translate([0.1, 50, 0])
        rotate([0,-90,0])
          cylinder(h=5.2, d=50);
    }
  }
}

module adapter() {
  difference() {
    union() {
      translate([0,0,0.1])
        cylinder(h=9.9, d=57);
      linear_extrude(5, convexity=10) {
        difference() {
          union() {
            hull() {
              for (x=[-30,30], y=[-30,30]) {
                translate([x, y])
                  circle(d=16);
              }
            }
            circle(d=80);
          }
          for (x=[-30,30], y=[-30,30]) {
            translate([x, y])
              circle(d=8);
          }
        }
      }
    }
    cylinder(h=100, d=50, center=true);
  }
}

translate([50,0,-11.9])
  rotate([0,0,90])
    flange();

translate([0, 0, 0])
  rotate([90,0,0])
    pipe();

translate([0.1, 0, 50])
  rotate([0, -90, 0])
    adapter();
