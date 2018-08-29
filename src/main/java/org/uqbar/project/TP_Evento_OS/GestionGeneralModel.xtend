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

	def getRepositorioLocacionesTamanio() {
		"problemas"
	}

	def getEliminarSeleccion() {
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as Repositorio
		val RepoUsuarios = ApplicationContext.instance.getSingleton(typeof(Usuario)) as Repositorio
		val RepoServicios = ApplicationContext.instance.getSingleton(typeof(Servicio)) as Repositorio

		if (entidadSeleccionada.class == Locacion) {
			borrarLocacion(RepoLocaciones)
		}
		if (entidadSeleccionada.class == Usuario) {
			borrarUsuario(RepoUsuarios)
		} else {
			borrarServicio(RepoServicios)
		}

	}
	
	protected def void borrarServicio(Repositorio RepoServicios) {
		RepoServicios.delete(entidadSeleccionada)
		ObservableUtils.firePropertyChanged(this, "serviciosDelRepo")
	}
	
	protected def void borrarUsuario(Repositorio RepoUsuarios) {
		RepoUsuarios.delete(entidadSeleccionada)
		ObservableUtils.firePropertyChanged(this, "usuariosDelRepo")
	}
	
	protected def void borrarLocacion(Repositorio RepoLocaciones) {
		RepoLocaciones.delete(entidadSeleccionada)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo")
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
