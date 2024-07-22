let
concat = x: y: x+y;
result = map (concat "foo") [ "bar" "bla" "abc" ];
in
result
