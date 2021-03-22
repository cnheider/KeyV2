include <stem_supports/brim.scad>
include <stem_supports/tines.scad>


//whole stem, alps or cherry, trimmed to fit
module stem_support(support_type, stem_type, stem_support_height, slop, stabilizer=false){
  stabilizer_rot = stabilizer?$stabilizer_stem_rotation:0;
  rotate([0,0,stabilizer_rot]){
    if (support_type == "brim") {
      brim_support(stem_type, stem_support_height, slop);
    } else if (support_type == "tines") {
      tines_support(stem_type, stem_support_height, slop);
    } else if (support_type == "disable") {
      children();
    } else {
      echo("Warning: unsupported $stem_support_type");
    }
  }
}
