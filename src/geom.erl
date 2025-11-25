% geometry
-module(geom).
-export([area/1]).

area({rect, W, H}) -> W * H;
area({quad, W}) -> W * W;
area({circ, R}) -> 3.14159 * R * R.
