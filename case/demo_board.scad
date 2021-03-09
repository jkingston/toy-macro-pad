include <cherry_mx_switch_cutouts.scad>

module demo_pcb() {
    pcb_height=1.5;
    union() {
        translate([-$cherry_mx_switch_width, 0, 0])
        cherry_switch_pcb(1, pcb_height);

        cherry_switch_pcb(1, pcb_height);

        translate([$cherry_mx_switch_width, 0, 0])
        cherry_switch_pcb(1, pcb_height);
    }
}

module demo_plate() {
    plate_height=5;
    union() {
        translate([-$cherry_mx_switch_width, 0, 0])
        cherry_switch_plate(1, plate_height);

        cherry_switch_plate(1, plate_height);

        translate([$cherry_mx_switch_width, 0, 0])
        cherry_switch_plate(1, plate_height);
    }
}

//pcb_zpos=-1.5/2;
//translate([0, 0, pcb_zpos])
//demo_pcb();

//plate_zpos=5-4/2;
//translate([0, 0, plate_zpos])
demo_plate();
