CLASS zcl_test_run DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_run IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(operation) = NEW zcl_bgfp_test( ).
    operation->launch_method( p_class = 'zcl_cat_manage' p_method = 'add_cat' ).
    TRY.
        DATA(process) = cl_bgmc_process_factory=>get_default( )->create( ).
        process->set_name( 'Uncontrolled Process' )->set_operation_tx_uncontrolled( operation ).
        process->save_for_execution( ).

        COMMIT WORK.
      CATCH cx_bgmc.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
