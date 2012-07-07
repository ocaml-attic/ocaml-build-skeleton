open Ocamlbuild_plugin
open Command

;;
dispatch begin function
|After_rules ->
  dep  ["link"; "ocaml"; "use_lib"] ["libhello.a"];
  flag ["link"; "library"; "ocaml"; "byte"; "use_lib"] (S[A"-dllib"; A"-lhello"; A"-cclib"; A"-lhello"]);
  flag ["link"; "library"; "ocaml"; "native"; "use_lib"] (S[A"-cclib"; A"-lhello"]);
|_ -> ()
end
