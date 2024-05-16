@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
define root view entity Z_C_TRAVEL 
  provider contract transactional_query
  as projection on Z_I_TRAVEL
{
  @UI.facet: [ {
    id: 'idIdentification',
    type: #IDENTIFICATION_REFERENCE,
    label: 'Travel',
    position: 10
  } ]
  @UI: { lineItem: [{ position: 10 }],
         identification: [{ position: 10 }],
         selectionField: [{ position: 10 }] }
  key TravelId,
  @UI: { lineItem: [{ position: 20 }],
         identification: [{ position: 20 }] }
  AgencyId,
  @UI: { lineItem: [{ position: 30 }],
         identification: [{ position: 30 }],
         selectionField: [{ position: 20 }] }
  CustomerId,
  @UI: { lineItem: [{ position: 40 }],
         identification: [{ position: 40 }] }
  BeginDate,
  @UI: { lineItem: [{ position: 50 }],
         identification: [{ position: 50 }] }
  EndDate,
  @UI: { lineItem: [{ position: 60 }],
         identification: [{ position: 60 }] }
  BookingFee,
  @UI: { lineItem: [{ position: 70 }],
         identification: [{ position: 70 }] }
  TotalPrice,
  @UI: { lineItem: [{ position: 80 }],
         identification: [{ position: 80 }] }
  CurrencyCode,
  @UI: { lineItem: [{ position: 90 }],
         identification: [{ position: 90 }] }
  Description,
  @UI: { lineItem: [{ position: 100 }],
         identification: [{ position: 100 }] }
  Status,
  Createdby,  
  Createdat,
  Lastchangedby,
  Lastchangedat
}
