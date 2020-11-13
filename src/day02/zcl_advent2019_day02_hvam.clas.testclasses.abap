
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

    DATA integers TYPE zcl_advent2019_day02_hvam=>integer_table.

    APPEND 2 TO integers.
    APPEND 4 TO integers.
    APPEND 100 TO integers.

    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->output( integers )
      exp = '2,4,100' ).

  ENDMETHOD.

  METHOD test1.

*    cl_abap_unit_assert=>assert_equals(
*      act = mo_cut->output( mo_cut->execute( mo_cut->input( '1,0,0,0,99' ) ) )
*      exp = '2,0,0,0,99' ).

  ENDMETHOD.

ENDCLASS.
