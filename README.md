# Bitcoin historical app

Esta app se realizó para mostrar el precio desde dos semanas anteriores hasta el día actual del precio que cerró el Bitcoin, siendo el día actual refrescado a cada minuto.

Cuenta con un vista de detalle que muestra en cuanto cerró en la fecha seleccionada en Dolares (USD), Euros (EUR) y en pesos colombianos (COP)

Proyecto hecho con Flutter 2.5.2 y Dart 2.14.3

- Se usó el paquete [dio](https://pub.dev/packages/dio) para realizar las llamadas http
- Se usó el paquete [equatable](https://pub.dev/packages/equatable) para la comparar clases
- Se usó el paquete [dartz](https://pub.dev/packages/dartz) para la toma de decisión de error, (ya que se entiende de mejor manera)
- Se usó el paquete [get_it](https://pub.dev/packages/get_it) como contenedor de inyección de dependencias
- Se usó el paquete [getx](https://pub.dev/packages/get) como manejador de estado y manejador de rutas
- Se usó el paquete [intl](https://pub.dev/packages/intl) para formatear fechas
