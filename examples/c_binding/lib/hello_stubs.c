#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>

CAMLprim value
caml_hello_world(value v_unit)
{
  CAMLparam1(v_unit);
  fprintf(stderr, "hello world!\n");
  CAMLreturn(Val_unit);
}
