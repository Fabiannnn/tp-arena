package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import eventos.Locacion
import repositorio.RepositorioLocaciones
import org.uqbar.commons.applicationContext.ApplicationContext
import eventos.Usuario
import servicios.Servicio
import repositorio.RepositorioUsuarios
import repositorio.RepositorioServicios
import java.util.ArrayList
import java.util.Collection
import eventos.Evento
import java.time.LocalDateTime
import java.time.Period
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.project.TP_Evento_OS.DashboardModel
import com.eclipsesource.json.JsonObject
import jsons.JsonLocacion

@Accessors
@Observable
class GestionDeLocacionesModel extends DashboardModel {
//	String jsonText
//	JsonLocacion jsonLocacion

	int pruebaDiez = 10

	def getGestionDeLocaciones() {
		pruebaDiez
	}

	def getRepositorioLocacionesTamanio() {
		"problemas"
	}

//	def getActualizar() {
//		jsonLocacion.deserializarJson('''[
//		   {
//		      "x":-34.603759,
//		      "y":-58.381586,
//		      "nombre":"Salón El Abierto"
//		   },
//		   {
//		      "x":-44.603759,
//		      "y":-68.381586,
//		      "nombre":"Estadio Obras"
//		   }
//		]''', repoLocaciones)
//
//	}
}
//	jsonText =  '''[
//		   {
//		      "x":-44.603759,
//		      "y":-68.31586,
//		      "nombre":"Salón El Abierto"
//		   },
//		   {
//		      "x":-44.689759,
//		      "y":-68.381586,
//		      "nombre":"mi Salón"
//		   };
//		   {
//		      "x":-34.603759,
//		      "y":-58.381586,
//		      "nombre":"Salón M&M"
//		   },
//		   {
//		      "x":-44.603759,
//		      "y":-28.381586,
//		      "nombre":"Estadio Obras"
//		   },
//		   {
//		      "x":-34.603759,
//		      "y":-58.381586,
//		      "nombre":"Salón El Abierto"
//		   },
//		   {
//		      "x":-34.572224,
//		      "y":-58.535651,
//		      "nombre":"Estadio Obras2"
//		   },
//		   {
//		      "x":-84.603759,
//		      "y":-88.388986,
//		      "nombre":"Salón El Abierto Otro Lugar"
//		   },
//		   {
//		      "x":-34.572224,
//		      "y":-58.535651,
//		      "nombre":"Estadio Obras Modificado"
//		   }
//		]'''
