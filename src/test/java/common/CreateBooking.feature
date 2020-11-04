Feature: Create Booking
  Este servicio es utilizado para el registro de las reservas
  de vuelos de la empresa RestFul Booker

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verificar petición correcta para actualizar una reserva reciba 200
    Given path '/booking'
    And request
    """
    {
    "firstname" : "Neiky",
    "lastname" : "Chafloque",
    "totalprice" : 111,
    "depositpaid" : true,
    "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
    },
    "additionalneeds" : "launch"
    }
    """
    When method Post
    Then status 200