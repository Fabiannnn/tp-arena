package jsonUI

class JsonServicioUI {

	String jsonText

	def actualizarJsonServicio() {

		jsonText = '''[
		   {
		      "descripcion":"Catering Food Party",
		      "tarifaServicio":{
		         "tipo":"TPH",
		         "valor":5000.00,
		         "minimo":3500.00
		      },
		      "tarifaTraslado":30.00,
		      "ubicacion":{
		         "x":-34,
		         "y":58
		      }
		   },
		   		   {
		   		      "descripcion":"Food Party",
		   		      "tarifaServicio":{
		   		         "tipo":"TPP",
		   		         "valor":5000.00,
		   		         "porcentajeParaMinimo":70.00
		   		      },
		   		      "tarifaTraslado":30.00,
		   		      "ubicacion":{
		   		         "x":-34,
		   		         "y":58
		   		      }
		   		   }
		   		]'''

	}

}
