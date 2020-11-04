Feature: Partial Update Booking
  Este servicio es utilizado para la actualizacio parcial
  de la reserva a traves de la creacion de la reserva nueva
  y la generacion del token
  
  Background: 
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta para actualizar parcialmente una reserva reciba 200
      * def CreateTokenResponse = call read('classpath:common/CreateToken.feature')
      * def accessToken = CreateTokenResponse.response.token
      * def CreateBookingResponse = call read('classpath:common/CreateBooking.feature')
      * def bookingId = CreateBookingResponse.response.bookingid
      Given path '/booking/' + bookingId
      And cookie token = accessToken
      And request
      """
      {

      "firstname" : "Mariano    ",
      "lastname" : "Alexander"
      }
      """
      When method PATCH
      Then status 200

  