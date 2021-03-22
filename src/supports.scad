include <supports/flared.scad>
include <supports/flat.scad>
include <supports/bars.scad>

module supports(type, stem_type, loft, height, stabilizer=false) {
  stabilizer_rot = stabilizer?$stabilizer_stem_rotation:0;
  rotate([0,0,stabilizer_rot]){
    if (type == "flared") {
      flared(stem_type, loft, height);
    } else if (type == "flat") {
      flat(stem_type, loft, height);
    } else if (type == "bars") {
      bars(stem_type, loft, height);
    } else if (type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $support_type");
    }
  }
}
