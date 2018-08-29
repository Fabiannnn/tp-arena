package org.uqbar.project.TP_Evento_OS

import eventos.Entidad
import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import repositorio.Repositorio
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class GestionDeLocacionesModel extends DashboardModel {
//	String jsonText
//	JsonLocacion jsonLocacion
Entidad locacionSeleccionada
	int pruebaDiez = 10

	def getGestionDeLocaciones() {
		pruebaDiez
	}

	def getRepositorioLocacionesTamanio() {
		"problemas"
	}
	def getEliminarSeleccion() {
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as Repositorio
		RepoLocaciones.delete(locacionSeleccionada)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo") 
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
