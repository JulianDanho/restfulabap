@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View Booking'
define view entity Z_I_BOOKING as select from /dmo/booking
  association to parent Z_I_TRAVEL as _travel on $projection.TravelId = _travel.TravelId
{
  key travel_id as TravelId,
  key booking_id as BookingId,
  booking_date as BookingDate,
  customer_id as CustomerId,
  carrier_id as CarrierId,
  connection_id as ConnectionId,
  flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  flight_price as FlightPrice,
  currency_code as CurrencyCode,
  
  _travel
}
