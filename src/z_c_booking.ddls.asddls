@EndUserText.label: 'Consumption View Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity Z_C_Booking 
  as projection on Z_I_BOOKING
{
  @UI.facet: [ {
    id: 'idIdentificationBooking',
    type: #IDENTIFICATION_REFERENCE,
    label: 'Booking',
    position: 10
  } ]
  @UI: { lineItem: [{ position: 10 }],
         identification: [{ position: 10 }] }
  key TravelId,
  @UI: { lineItem: [{ position: 20 }],
         identification: [{ position: 20 }] }
  key BookingId,
  @UI: { lineItem: [{ position: 30 }],
         identification: [{ position: 30 }] }
  BookingDate,
  @UI: { lineItem: [{ position: 40 }],
         identification: [{ position: 40 }] }
  CustomerId,
  @UI: { lineItem: [{ position: 50 }],
         identification: [{ position: 50 }] }
  CarrierId,
  @UI: { lineItem: [{ position: 60 }],
         identification: [{ position: 60 }] }
  ConnectionId,
  @UI: { lineItem: [{ position: 70 }],
         identification: [{ position: 70 }] }
  FlightDate,
  @UI: { lineItem: [{ position: 80 }],
         identification: [{ position: 80 }] }
  FlightPrice,
  @UI: { lineItem: [{ position: 90 }],
         identification: [{ position: 90 }] }
  CurrencyCode,
  /* Associations */
  _travel: redirected to parent Z_C_TRAVEL
}
