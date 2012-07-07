open Ocamlbuild_plugin
open Command

;;
dispatch begin function
|After_rules ->
  flag ["depend"; "ocaml"] (S[A"-I";P"../../install"]);
  flag ["compile"; "ocaml"] (S[A"-I";P"../../install"]);
  flag ["link"; "ocaml"] (S[A"-I";P"../../install"]);
  ocaml_lib ~extern:true "foo"
|_ -> ()
end
