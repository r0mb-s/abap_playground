CLASS zcl_cat_manage DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS add_cat IMPORTING cat TYPE zi7529_cats.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cat_manage IMPLEMENTATION.
  METHOD add_cat.
    TRY.
        DATA(cat_uid) = cl_system_uuid=>create_uuid_x16_static( ).
        DATA wa TYPE ZI7529_CATS.
        wa-cuid = cat_uid.
        INSERT INTO ZI7529_CATS VALUES @wa.

        COMMIT WORK.
      CATCH cx_uuid_error.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
