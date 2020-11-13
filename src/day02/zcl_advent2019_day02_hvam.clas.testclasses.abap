
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA:
      mo_cut TYPE REF TO zcl_advent2019_day02_hvam.

    METHODS:
      setup,
      input FOR TESTING,
      output FOR TESTING,
      test1 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD input.
    DATA(result) = mo_cut->input( '1,2,3' ).
    cl_abap_unit_assert=>assert_equals(
      act = lines( result )
      exp = 3 ).
  ENDMETHOD.

  METHOD output.
* todo
  ENDMETHOD.

  METHOD test1.
* todo
  ENDMETHOD.

ENDCLASS.
