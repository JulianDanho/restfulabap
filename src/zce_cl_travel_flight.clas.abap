CLASS zce_cl_travel_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zce_cl_travel_flight IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA: lv_orderby_string TYPE string.

    IF io_request->is_data_requested( ).

      DATA(lo_http) = NEW zce_cl_travel_http( ).

      TRY.
          DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).

        CATCH cx_rap_query_filter_no_range.
          "Fehlermeldung
      ENDTRY.

      IF lt_filter IS NOT INITIAL.
        lo_http->set_filter_options( lt_filter ).
      ENDIF.

      DATA(lo_paging) = io_request->get_paging( ).
      lo_http->set_paging(
        EXPORTING
          iv_top  = lo_paging->get_page_size( )
          iv_skip = lo_paging->get_offset( )
      ).

      DATA(lt_response) = lo_http->send( ).

      DATA(lt_sort_elem) = io_request->get_sort_elements( ).
      IF lt_sort_elem IS NOT INITIAL.
        DATA(lt_sort) = VALUE abap_sortorder_tab(
                          FOR ls_sort_elem IN lt_sort_elem
                          ( name = ls_sort_elem-element_name
                           descending = ls_sort_elem-descending          )
                        ).
        SORT lt_response BY (lt_sort).
      ENDIF.

      io_response->set_data( it_data = lt_response ).

      IF io_request->is_total_numb_of_rec_requested( ).
        io_response->set_total_number_of_records( 40 ).
      ENDIF.

    ELSE.
      "Es sollen keine Daten zurückgegeben werden
    ENDIF.

  ENDMETHOD.

ENDCLASS.
