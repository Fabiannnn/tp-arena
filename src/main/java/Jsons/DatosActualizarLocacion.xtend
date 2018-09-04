package Jsons

import jsons.JsonLocacion

class DatosActualizarLocacion {
	String jsonText
	JsonLocacion jsonLocacion

	def actualizarJsonLocacion() {
		jsonText = '''[
		   {
		      "x":-44.603759,
		      "y":-68.31586,
		      "nombre":"Salón El Abierto"
		   },
		   {
   		      "x":-44.603759,
   		      "y":-28.381586,
   		      "nombre":"Estadio Obras"
   		   },
   		   {
	         "x":-34.603759,
		      "y":-44.60376,
 		      "nombre":"Salón El Abierto2"
   		   },
   		   {
   		      "x":-34.572224,
   		      "y":-58.535651,
   		      "nombre":"Estadio Obras2"
   		   },
   		   {
   		      "x":-84.603759,
   		      "y":-88.388986,
   		      "nombre":"Salón El Abierto Otro Lugar"
   		   },
   		   {
   		      "x":-24.572224,
   		      "y":-58.535651,
   		      "nombre":"Estadio Obras Modificado"
   		   },
		   {
		      "x":-44.603759,
		      "y":-68.381586,
		      "nombre":"Del Json"
		   }
		]'''
		return jsonText
	}
}
