CLASS zcl_advent2019_day02_hvam DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2019_hvam .

    TYPES: integer_table TYPE STANDARD TABLE OF i WITH DEFAULT KEY.

    METHODS input
      IMPORTING
        !string         TYPE string
      RETURNING
        VALUE(integers) TYPE integer_table .

    METHODS output
      IMPORTING
        !integers     TYPE integer_table
      RETURNING
        VALUE(string) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ADVENT2019_DAY02_HVAM IMPLEMENTATION.


  METHOD input.

    DATA strings TYPE STANDARD TABLE OF string WITH DEFAULT KEY.
    DATA int TYPE i.

    SPLIT string AT ',' INTO TABLE strings.
    LOOP AT strings INTO int.
      APPEND int TO integers.
    ENDLOOP.

  ENDMETHOD.


  METHOD output.
    LOOP AT integers INTO DATA(int).
      IF string IS INITIAL.
        string = string && int.
      ELSE.
        string = string && int && ','.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD zif_advent2019_hvam~solve.

    output = 'todo'.

  ENDMETHOD.
ENDCLASS.
