% geometry
-module(geom).
-export([area/1]).

area({rect, W, H}) -> W * H.
