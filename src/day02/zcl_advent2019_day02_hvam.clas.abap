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

    METHODS execute
      IMPORTING
        integers      TYPE integer_table
      RETURNING
        VALUE(result) TYPE integer_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ADVENT2019_DAY02_HVAM IMPLEMENTATION.


  METHOD execute.

    DATA index TYPE i VALUE 1.

    DATA position1 TYPE i.
    DATA position2 TYPE i.
    DATA position3 TYPE i.

    DATA value1 TYPE i.
    DATA value2 TYPE i.

    DATA target TYPE i.
    DATA opcode TYPE i.

    result = integers.

    DO.
      READ TABLE result INDEX index INTO opcode.
      ASSERT sy-subrc = 0.

      CASE opcode.
        WHEN 1 OR 2.
          READ TABLE result INDEX index + 1 INTO position1.
          ASSERT sy-subrc = 0.
          position1 = position1 + 1.
          READ TABLE result INDEX index + 2 INTO position2.
          ASSERT sy-subrc = 0.
          position2 = position2 + 1.
          READ TABLE result INDEX index + 3 INTO position3.
          ASSERT sy-subrc = 0.
          position3 = position3 + 1.

          READ TABLE result INDEX position1 INTO value1.
          ASSERT sy-subrc = 0.
          READ TABLE result INDEX position2 INTO value2.
          ASSERT sy-subrc = 0.

          IF opcode = 1.
            value1 = value1 + value2.
          ELSE.
            value1 = value1 * value2.
          ENDIF.

          MODIFY result INDEX position3 FROM value1.
        WHEN 99.
          EXIT. " current loop
        WHEN OTHERS.
          ASSERT 0 = 1.
      ENDCASE.

      index = index + 4.
    ENDDO.

  ENDMETHOD.


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
        string = int.
        string = condense( string ).
      ELSE.
        string = |{ string },{ int }|.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD zif_advent2019_hvam~solve.

    DATA(integers) = input( input ).

    MODIFY integers INDEX 2 FROM 12.
    MODIFY integers INDEX 3 FROM 2.

    DATA(result) = execute( integers ).

    READ TABLE result INDEX 1 INTO DATA(int).
    output = int.

  ENDMETHOD.
ENDCLASS.
