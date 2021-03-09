// https://cdn.sparkfun.com/datasheets/Components/Switches/MX%20Series.pdf

$cherry_mx_switch_width=19.05;

// The pcb cutouts are defined on a grid with 0.05 inch spacing,
// which in metric is 1.27mm. The holes are described by diameter
// on the datasheet.
module cherry_mx_pcb_cutout(pins=true, led=true, diode=true) {
    module gridpos(x, y) {
        translate([1.27*x, 1.27*y, 0])
        children();
    }

    module hole(d) {
        circle(d/2, $fn=100);
    }

    gridpos( 0, 0) hole(4);
    gridpos(-3, 2) hole(1.5);
    gridpos( 2, 4) hole(1.5);

    if (pins) {
        gridpos(-4, 0) hole(1.7);
        gridpos( 4, 0) hole(1.7);
    }

    if (led) {
        gridpos(-1, -4) hole(1);
        gridpos( 1, -4) hole(1);
    }

    if (led) {
        gridpos(-3, -4) hole(1);
        gridpos( 3, -4) hole(1);
    }
}

module cherry_mx_plate_cutout() {
    square([14, 14], center=true);
}

module cherry_mx_switch_cutout(u, height) {
    difference() {
        cube([u*$cherry_mx_switch_width, $cherry_mx_switch_width, height], center=true);

        linear_extrude(height*2, center=true)
        children();
    }
}

module cherry_switch_pcb(u, height) {
    cherry_mx_switch_cutout(u, height)
    cherry_mx_pcb_cutout();
}

module cherry_switch_plate(u, height) {
    difference() {
        cube([u*$cherry_mx_switch_width, $cherry_mx_switch_width, height], center=true);
        
        linear_extrude(height*2, center=true)
        cherry_mx_plate_cutout();
    }
}
