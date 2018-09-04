package Jsons

import jsons.JsonLocacion

class DatosActualizarServicios {
			String jsonText
	JsonLocacion jsonServicio
	def actualizarJsonServicio(){
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
		         "x":-34.572224,
		         "y":58.535651
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
		   		         "x":-34.572224,
		   		         "y":58.535651
		   		      }
		   		   }
		   		]'''
		return jsonText
	}}