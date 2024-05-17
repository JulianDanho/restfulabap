@EndUserText.label: 'Custom Entity Travel: Flights'
@ObjectModel.query.implementedBy: 'ABAP:ZCE_CL_TRAVEL_FLIGHT'
@UI: {
  headerInfo: {
    typeName: 'Flight',
    typeNamePlural: 'Flights',
    description: { type: #STANDARD, value: 'ConnectionID' } //case-sensitive
  }
}
define custom entity ZCE_TRAVEL_FLIGHT
{
      @UI.facet     : [ {
          id        : 'idIdentification',
          type      : #IDENTIFICATION_REFERENCE,
          label     : 'Flight',
          position  : 10
        } ]
      @EndUserText.label: 'Airline'
      @UI           : {
       lineItem     : [{ position: 10 }],
       identification: [{ position: 10 }],
       selectionField: [{ position: 10 }]
      }
  key AirlineID     : /dmo/carrier_id;
      @EndUserText.label: 'Connection Number'
      @UI           : {
       lineItem     : [{ position: 20 }],
       identification: [{ position: 20 }]
      }
  key ConnectionID  : /dmo/connection_id;
      @EndUserText.label: 'Flight Date'
      @UI           : {
       lineItem     : [{ position: 30 }],
       identification: [{ position: 30 }]
      }
  key FlightDate    : /dmo/flight_date;

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Price'
      @UI           : {
       lineItem     : [{ position: 40 }],
       identification: [{ position: 40 }]
      }
      Price         : /dmo/flight_price;

      @Semantics.currencyCode: true
      CurrencyCode  : /dmo/currency_code;

      @EndUserText.label: 'Plane Type'
      @UI           : {
       lineItem     : [{ position: 50 }],
       identification: [{ position: 50 }]
      }
      PlaneType     : /dmo/plane_type_id;

      @EndUserText.label: 'Maximum Seats'
      @UI           : {
       lineItem     : [{ position: 60 }],
       identification: [{ position: 60 }]
      }
      MaximumSeats  : /dmo/plane_seats_max;

      @EndUserText.label: 'Occupied Seats'
      @UI           : {
       lineItem     : [{ position: 70 }],
       identification: [{ position: 70 }]
      }
      OccupiedSeats : /dmo/plane_seats_occupied;

}
