CLASS zcl_travel_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.
    DATA m_travel TYPE /dmo/travel_id.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_travel_service IMPLEMENTATION.
  METHOD constructor.
    SELECT SINGLE travel_id
      FROM /dmo/travel
      INTO @me->m_travel.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

***** - READ - *****************************
********************************************
*    READ ENTITIES OF z_c_travel
*      ENTITY z_c_travel
*      ALL FIELDS WITH VALUE #( ( travelid = me->m_travel ) )
*      RESULT DATA(lt_travels)
*      FAILED DATA(lt_failed)
*      REPORTED DATA(lt_reported).
*
*    out->write( data = lt_travels ).

***** - UPDATE - **************************
*******************************************

*    MODIFY ENTITIES OF z_c_travel
*        ENTITY z_c_travel
*        UPDATE FIELDS ( Description )
*        WITH VALUE #( ( TravelId = me->m_travel
*                       Description = 'Dies ist ein Test' ) )
*        REPORTED DATA(lt_reported)
*        FAILED DATA(lt_failed)
*        MAPPED DATA(lt_mapped).
*    IF lt_failed IS INITIAL.
*      COMMIT ENTITIES.
*      READ ENTITIES OF z_c_travel
*        ENTITY z_c_travel
*        ALL FIELDS WITH VALUE #( ( TravelId = me->m_travel ) )
*        RESULT DATA(lt_travels).
*      out->write(  data = lt_travels ).
*    ELSE.
*      ROLLBACK ENTITIES.
*    ENDIF.

***** - CREATE - **************************
*******************************************

*    DATA: lt_create TYPE TABLE FOR CREATE z_c_travel.
*    READ ENTITIES OF z_c_travel
*     ENTITY z_c_travel
*     ALL FIELDS WITH VALUE #( ( travelid = me->m_travel ) )
*     RESULT DATA(lt_result).
*    IF lt_result IS NOT INITIAL.
*      lt_create = CORRESPONDING #( lt_result CHANGING CONTROL ).
*      lt_create[ 1 ]-travelid = '99000001'.
*      MODIFY ENTITIES OF z_c_travel
*        ENTITY z_c_travel
*        CREATE AUTO FILL CID
*        WITH lt_create
*        MAPPED DATA(lt_mapped)
*        FAILED DATA(lt_failed)
*        REPORTED DATA(lt_reported).
*      IF lt_failed IS INITIAL.
*        COMMIT ENTITIES.
*        READ ENTITIES OF z_c_travel
*            ENTITY z_c_travel
*            ALL FIELDS WITH VALUE #( ( travelid = '99000001' ) )
*            RESULT lt_result.
*        out->write( lt_result ).
*      ENDIF.
*    ENDIF.

***** - DELETE - **************************
*******************************************

*    MODIFY ENTITIES OF z_c_travel
*        ENTITY z_c_travel
*        DELETE FROM VALUE #( ( travelid = me->m_travel ) )
*      FAILED DATA(lt_failed)
*      REPORTED DATA(lt_reported)
*      MAPPED DATA(lt_mapped).
*    IF lt_failed IS INITIAL.
*      COMMIT ENTITIES.
*
*      READ ENTITIES OF z_c_travel
*        ENTITY z_c_travel
*        ALL FIELDS WITH VALUE #( ( travelid = me->m_travel ) )
*      RESULT DATA(lt_result).
*      IF lt_result IS INITIAL.
*        out->write( 'Eintrag erfolgreich gelöscht' ).
*      ENDIF.
*    ENDIF.


  ENDMETHOD.

ENDCLASS.
