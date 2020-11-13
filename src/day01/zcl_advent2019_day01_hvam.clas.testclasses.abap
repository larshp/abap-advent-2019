
CLASS ltcl_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      mo_cut TYPE REF TO zcl_advent2019_day01_hvam.

    METHODS:
      setup,
      test1 FOR TESTING,
      test2 FOR TESTING,
      test3 FOR TESTING,
      test4 FOR TESTING.
ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    CREATE OBJECT mo_cut.
  ENDMETHOD.

  METHOD test1.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->single( 12 )
      exp = 2 ).
  ENDMETHOD.

  METHOD test2.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->single( 14 )
      exp = 2 ).
  ENDMETHOD.

  METHOD test3.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->single( 1969 )
      exp = 654 ).
  ENDMETHOD.

  METHOD test4.
    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->single( 100756 )
      exp = 33583 ).
  ENDMETHOD.

ENDCLASS.
