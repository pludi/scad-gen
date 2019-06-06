#!/usr/bin/env ruby

t = 0
step = Math::PI / 10
tmax = 2 * Math::PI

def calc(t)[10 * Math.sin(t), 0, 10 * Math.cos(t)]
end

old_vec = calc(0)

iter = 0;

puts <<HEAD
$fn=100;

union() {
    translate([#{old_vec.join(',')}])
        sphere(d=1);

HEAD

while t < tmax do
  t += step
  new_vec = calc(t)
  puts <<MAIN
    length#{iter} = norm([#{new_vec[0] - old_vec[0]}, #{new_vec[1] - old_vec[1]}, #{new_vec[2] - old_vec[2]}]);
    b#{iter} = acos(#{new_vec[2] - old_vec[2]} / length#{iter});
    c#{iter} = atan2(#{new_vec[1] - old_vec[1]}, #{new_vec[0] - old_vec[0]});
    translate([#{new_vec.join(', ')}])
        sphere(d=1);
    translate([#{old_vec.join(', ')}])
        rotate([0, b#{iter}, c#{iter}])
            cylinder(d=1, h=length#{iter});

MAIN
  iter += 1
  old_vec = new_vec
end

puts <<TAIL
}
TAIL
