open Dynlink
let _ =
  allow_unsafe_modules true;
  try loadfile (adapt_filename "bar.cma") 
  with Error e -> 
    Printf.eprintf "EXN: %s\n%!" (error_message e)
