package org.uqbar.project.TP_Evento_OS

import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import repositorio.Repositorio
import repositorio.RepositorioLocaciones
import repositorio.RepositorioServicios
import repositorio.RepositorioUsuarios
import servicios.Servicio

@Accessors
@Observable
class GestionGeneralModel {
//	String jsonText
//	JsonLocacion jsonLocacion
	Entidad entidadSeleccionada

	def getEliminarSeleccion() {
		this.getEliminarSeleccionDelRepositorio(entidadSeleccionada)
	}

	def dispatch getEliminarSeleccionDelRepositorio(Locacion seleccion) {
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as Repositorio
		RepoLocaciones.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Usuario seleccion) {
		val RepoUsuarios = ApplicationContext.instance.getSingleton(typeof(Usuario)) as Repositorio
		RepoUsuarios.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "usuariosDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Servicio seleccion) {
		val RepoServicios = ApplicationContext.instance.getSingleton(typeof(Servicio)) as Repositorio
		RepoServicios.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "serviciosDelRepo")
	}
	def getLocacionesDelRepo() {
		getRepoLocaciones.elementos
	}

	def getUsuariosDelRepo() {
		getRepoUsuarios.elementos
	}

	def getServiciosDelRepo() {
		getRepoServicios.elementos
	}

	def getRepoLocaciones() {
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	def getRepoUsuarios() {
		ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepositorioUsuarios
	}

	def getRepoServicios() {
		ApplicationContext.instance.getSingleton(typeof(Servicio)) as RepositorioServicios
	}

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
