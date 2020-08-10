// the molkky playset

/* This Thing uses the "Chamfered primitives for OpenSCAD" library: https://www.thingiverse.com/thing:1305888 */
include <Chamfer.scad>;

skittleHeight=150;
batonHeight=225;
diameter=55;
radius=diameter/2;
skittleChamfer=2;
batonChamfer=5;
spacing=5;


translate([0*(diameter+spacing),0*(diameter+spacing),0])
    MolkkySkittle("1", skittleHeight, diameter, skittleChamfer);
translate([1*(diameter+spacing),0*(diameter+spacing),0])
    MolkkySkittle("2", skittleHeight, diameter, skittleChamfer);

translate([-0.5*(diameter+spacing),1*(diameter+spacing),0])
    MolkkySkittle("3", skittleHeight, diameter, skittleChamfer);
translate([0.5*(diameter+spacing),1*(diameter+spacing),0])
    MolkkySkittle("10", skittleHeight, diameter, skittleChamfer);
translate([1.5*(diameter+spacing),1*(diameter+spacing),0])
    MolkkySkittle("4", skittleHeight, diameter, skittleChamfer);
    
translate([-1*(diameter+spacing),2*(diameter+spacing),0])
    MolkkySkittle("5", skittleHeight, diameter, skittleChamfer);
translate([0*(diameter+spacing),2*(diameter+spacing),0])
    MolkkySkittle("11", skittleHeight, diameter, skittleChamfer);
translate([1*(diameter+spacing),2*(diameter+spacing),0])
    MolkkySkittle("12", skittleHeight, diameter, skittleChamfer);
translate([2*(diameter+spacing),2*(diameter+spacing),0])
    MolkkySkittle("6", skittleHeight, diameter, skittleChamfer);

translate([-0.5*(diameter+spacing),3*(diameter+spacing),0])
    MolkkySkittle("7", skittleHeight, diameter, skittleChamfer);
translate([0.5*(diameter+spacing),3*(diameter+spacing),0])
    MolkkySkittle("9", skittleHeight, diameter, skittleChamfer);
translate([1.5*(diameter+spacing),3*(diameter+spacing),0])
    MolkkySkittle("8", skittleHeight, diameter, skittleChamfer);

translate([-1.5*(diameter+spacing),3*(diameter+spacing),0])
    MolkkyBaton(batonHeight, diameter, batonChamfer);


module MolkkySkittle(number, height=150, diameter=55, chamfer=5) {
    radius=diameter/2;
    difference() {
        union() {
            difference() {
                chamferCylinder(height, radius, radius, chamfer);
                translate([-diameter/2,-diameter/2,height-diameter]) {
                    rotate([45,0,0]) {
                        union() {
                            cube([diameter,diameter*sqrt(2),diameter]);
                        }
                    }
                }
            }
            translate([0,0,height-radius]) {
                rotate([45,0,0]) {
                    linear_extrude(height=4, convexity=4)
                        text(number, size=30, font="Bitstream Vera Sans", halign="center", valign="center");
                }
            }
        }
    }
}

module MolkkyBaton(height=22.5, diameter=55, chamfer=5) {
    radius=diameter/2;
    chamferCylinder(height, radius, radius, chamfer);
}
