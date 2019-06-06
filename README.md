scad-gen
========

Generate [OpenSCAD](https://openscad.org/) files for visualizations of
arbitrary functions.

WHY?!
-----

Why not?

I wanted to be able to generate 3D models of various mathematical
functions after seeing [this
Tweet](https://twitter.com/nwilliams030/status/1112516582662721537) by
[\@nwilliams030](https://twitter.com/nwilliams030)

How?
----

This is one simple Ruby script. At the top are the only things you need
to edit:

-   `t`: the starting input value for your function (*f*(0))
-   `step`: the stepping between function values
-   `tmax`: the end value
-   `calc(t)`: your function, expected to return an array with (x,y,z)

The main loop iterates from `t` to `tmax` at `step` increments,
calculates the function `calc` at each step, and draws cylinders between
the points, with a sphere at each point (for a smoother appearance).

After setting it all up, run the script, sending the output to a target
file. Open in OpenSCAD, render, voilà.
