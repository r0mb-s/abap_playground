CLASS zcl_bgfp_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_bgmc_op_single_tx_uncontr.


    METHODS launch_method IMPORTING p_class  TYPE string
                                    p_method TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: class_to_run  TYPE string,
          method_to_run TYPE string.
ENDCLASS.



CLASS zcl_bgfp_test IMPLEMENTATION.

  METHOD if_bgmc_op_single_tx_uncontr~execute.
    TRY.
        CALL METHOD (me->class_to_run)=>(me->method_to_run).
      CATCH cx_sy_dyn_call_error INTO DATA(lx_error).
    ENDTRY.
  ENDMETHOD.

  METHOD launch_method.
    me->class_to_run = p_class.
    me->method_to_run = p_method.
  ENDMETHOD.

ENDCLASS.
