package Jsons

import jsons.JsonLocacion

class DatosActualizarLocacion {
		String jsonText
	JsonLocacion jsonLocacion
	
	def actualizarJsonLocacion(){
		jsonText = '''[
		   {
		      "x":-44.603759,
		      "y":-68.31586,
		      "nombre":"Salón El Abierto"
		   },
		   {
		      "x":-44.603759,
		      "y":-68.381586,
		      "nombre":"Del Json"
		   }
		]'''
return jsonText
	}}