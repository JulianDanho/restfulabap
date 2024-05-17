CLASS zce_cl_travel_http DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: tt_ce_flight TYPE STANDARD TABLE OF zce_travel_flight WITH DEFAULT KEY.

    METHODS: constructor,
      set_filter_options
        IMPORTING
          it_filter TYPE if_rap_query_filter=>tt_name_range_pairs,
      set_paging
        IMPORTING
          iv_top  TYPE i
          iv_skip TYPE i,
      send
        RETURNING VALUE(rt_data)  TYPE tt_ce_flight.

  PRIVATE SECTION.

      TYPES:
        BEGIN OF ty_d,
          results TYPE zce_cl_travel_http=>tt_ce_flight,
       END OF ty_d.
      DATA:
        BEGIN OF ms_data_wrapper,
          d type ty_d,
        END OF ms_data_wrapper.

    DATA: mt_filter TYPE if_rap_query_filter=>tt_name_range_pairs,
          mv_top    TYPE i,
          mv_skip   TYPE i.

    METHODS: build_request_uri
      RETURNING
        VALUE(rv_uri) TYPE string,
      parse_response
        IMPORTING
          iv_response TYPE string
        RETURNING VALUE(rt_data)     TYPE tt_ce_flight.

ENDCLASS.

CLASS ZCE_CL_TRAVEL_HTTP IMPLEMENTATION.


  METHOD constructor.
  ENDMETHOD.


  METHOD set_filter_options.
    mt_filter = it_filter.
  ENDMETHOD.


  METHOD set_paging.
    mv_top = iv_top.
    mv_skip = iv_skip.
  ENDMETHOD.


  METHOD send.

    DATA(lv_uri) = build_request_uri( ).

    cl_http_client=>create_by_destination(
      EXPORTING
        destination = 'ZCE_TRAVEL_LOCAL'
      IMPORTING
        client      = DATA(lo_http_client)
    ).

    lo_http_client->request->set_header_field(
      name  = 'Accept'
      value = 'application/json'
    ).

    cl_http_utility=>set_request_uri( request = lo_http_client->request uri = lv_uri ).
    lo_http_client->request->set_method( if_http_request=>co_request_method_get ).

    lo_http_client->send( ).

    lo_http_client->receive( ).

    lo_http_client->response->get_status(
      IMPORTING
        code   = DATA(lv_status)
        reason = DATA(lv_reason)
    ).

    IF lv_status = 200.
      rt_data = parse_response(
        EXPORTING
          iv_response = lo_http_client->response->get_cdata( )
      ).
    ENDIF.

    lo_http_client->close( ).

  ENDMETHOD.


  METHOD build_request_uri.
    DATA(lv_uri) = |/Flight?$format=json|.

    if line_exists( mt_filter[ name = 'AIRLINEID' ] ).
      lv_uri = lv_uri && |&$filter=AirlineID eq '{ mt_filter[ name = 'AIRLINEID' ]-range[ 1 ]-low }'|.
    endif.
    IF mv_top IS NOT INITIAL.
      lv_uri = lv_uri && |&$top={ condense( CONV string( mv_top ) ) }|.
    ENDIF.
    IF mv_skip IS NOT INITIAL.
      lv_uri = lv_uri && |&$skip={ condense( CONV string( mv_skip ) ) }|.
    ENDIF.

    rv_uri = lv_uri.
  ENDMETHOD.


  METHOD parse_response.
      NEW /ui2/cl_json( )->deserialize(
        EXPORTING
          json = iv_response
        CHANGING
          data = me->ms_data_wrapper
      ).

      rt_data = me->ms_data_wrapper-d-results.
  ENDMETHOD.
ENDCLASS.
