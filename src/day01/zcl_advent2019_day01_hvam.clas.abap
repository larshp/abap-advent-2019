CLASS zcl_advent2019_day01_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2019_hvam .

    METHODS single
      IMPORTING
        !input        TYPE i
      RETURNING
        VALUE(output) TYPE i .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ADVENT2019_DAY01_HVAM IMPLEMENTATION.


  METHOD single.

    output = ( input DIV 3 ) - 2.

  ENDMETHOD.


  METHOD zif_advent2019_hvam~solve.

    DATA table TYPE STANDARD TABLE OF string WITH DEFAULT KEY.
    DATA result TYPE i.
    DATA conv TYPE i.

    SPLIT input AT cl_abap_char_utilities=>newline INTO TABLE table.

    LOOP AT table INTO DATA(row).
      conv = row.
      result = result + single( conv ).
    ENDLOOP.

    output = result.

  ENDMETHOD.
ENDCLASS.
