include <cherry_mx_switch_cutouts.scad>

num_switches_x = 4;
num_switches_y = 3;

plate_width = $cherry_mx_switch_width*num_switches_x + 10;
plate_length = $cherry_mx_switch_width*num_switches_y + 10;
plate_depth = 5;

case_width = plate_width + 8;
case_length = plate_length + 8;
case_depth = 18.5 + 10;

module plate() {

    difference() {
        cube([plate_width, plate_length, plate_depth], center=true);

        for (x = [-(num_switches_x/2 - 0.5) : (num_switches_x/2 - 0.5)]) {
            for (y = [-(num_switches_y/2 - 0.5) : (num_switches_y/2 - 0.5)])  {
                translate([x*$cherry_mx_switch_width, y*$cherry_mx_switch_width, 0])
                linear_extrude(plate_depth*2, center=true)
                cherry_mx_plate_cutout();
            }
        }
        
        for (x = [-1, 1]) {
            for (y = [-1, 1]) {
                translate([x*plate_width/2 + x*-3.5, y*plate_length/2 - y*3.5, 0])
                linear_extrude(plate_depth*2, center=true)
                circle(1.6, $fn=100);
            }
        }
    }
}

module body() {
    difference() {
        cube([case_width, case_length, case_depth], center=true);
        
        translate([0, 0, (case_depth - 15.2)/2])
        cube([plate_width+0.4, plate_length+0.4, 15.201], center=true);
        
        cube([plate_width-14, plate_length+0.4, case_depth*2], center=true);

        cube([plate_width+0.4, plate_length-14, case_depth*2], center=true);

        for (x = [-1, 1]) {
            for (y = [-1, 1]) {
                translate([x*plate_width/2 + x*-3.5, y*plate_length/2 - y*3.5, 0])
                linear_extrude(case_depth*2, center=true)
                circle(1.5, $fn=100);
            }
        }
        
        translate([case_width/2, 0, -(case_depth-15.2)/2])
        cube([8, 10, 3.5], center=true);
        
        translate([(case_width-2)/2-2.001, 0, -(case_depth-15.2+3.5+1.499)/2])
        cube([2, 18, 1.5], center=true);
    }
    
    translate([(case_width-22)/2-3.8, 0, -(case_depth-4.5)/2])
    cube([22, 10, 4.5], center=true);
    
    translate([(case_width)/2-24.8, 0, -(case_depth-4.5-4.5)/2])
    cube([2, 10, 4.5], center=true);
}

module bottom() {
    difference() {
        cube([plate_width, plate_length, 2], center=true);

        for (x = [-1, 1]) {
            for (y = [-1, 1]) {
                translate([x*plate_width/2 + x*-3.5, y*plate_length/2 - y*3.5, 0])
                linear_extrude(case_depth*2, center=true)
                circle(1.5, $fn=100);
            }
        }
    }
}

//translate([0, 0, 20]) plate();

//body();

translate([0, 0, -20]) bottom();