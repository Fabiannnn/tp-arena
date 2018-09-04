package Jsons

import jsons.JsonUsuario

class DatosActualizarUsuarios {
		String jsonText
	JsonUsuario jsonUsuario
	
	def actualizarJsonUsuario(){
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
		            "x":-34.572224,
		            "y":58.535651
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
		            "x":-34.572224,
		            "y":58.535651
		         }
		      }
		   }
		]'''

return jsonText
	}}