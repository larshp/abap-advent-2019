INTERFACE zif_advent2019_hvam
  PUBLIC .


  METHODS solve
    IMPORTING
      !input        TYPE string
    RETURNING
      VALUE(output) TYPE string .
ENDINTERFACE.
