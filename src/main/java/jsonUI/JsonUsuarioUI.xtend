package jsonUI

class JsonUsuarioUI {

	String jsonText

	def actualizarJsonUsuario() {
		
		jsonText = '''[  
		   {  
		      "nombreUsuario":"lucas_capo",
		      "nombreApellido":"Lucas Lopez",
		      "email":"lucas_93@hotmail.com",
		      "fechaNacimiento":"15/01/1993",
		      "direccion":{  
		         "calle":"25 de Mayo",
		         "numero":3918,
		         "localidad":"San Martín",
		         "provincia":"Buenos Aires",
		         "coordenadas":{  
		            "x":-34,
		            "y":58
		         }
		      }
		   },
		   {  
		      "nombreUsuario":"otro_lucas",
		      "nombreApellido":"Lucas Lopez",
		      "email":"lucas_93@hotmail.com",
		      "fechaNacimiento":"15/01/1993",
		      "direccion":{  
		         "calle":"25 de Mayo",
		         "numero":3918,
		         "localidad":"San Martín",
		         "provincia":"Buenos Aires",
		         "coordenadas":{  
		            "x":-34,
		            "y":58
		         }
		      }
		   }
		]'''

	}

}