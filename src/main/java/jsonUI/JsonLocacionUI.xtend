package jsonUI

class JsonLocacionUI {

	String jsonText

	def actualizarJsonLocacion() {

		jsonText = '''[
		   {
		      "x":-44,
		      "y":-68,
		      "nombre":"Salón El Abierto"
		   },
		   {
   		      "x":-44,
   		      "y":-28,
   		      "nombre":"Estadio Obras"
   		   },
   		   {
	         "x":-349,
		      "y":-44,
 		      "nombre":"Salón El Abierto2"
   		   },
   		   {
   		      "x":-34,
   		      "y":-58,
   		      "nombre":"Estadio Obras2"
   		   },
   		   {
   		      "x":-84,
   		      "y":-88,
   		      "nombre":"Salón El Abierto Otro Lugar"
   		   },
   		   {
   		      "x":-24,
   		      "y":-58,
   		      "nombre":"Estadio Obras Modificado"
   		   },
		   {
		      "x":-44,
		      "y":-68,
		      "nombre":"Del Json"
		   }
		]'''

	}

}
