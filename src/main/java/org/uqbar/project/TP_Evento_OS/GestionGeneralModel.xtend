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
import servicios.TarifaFija
import Jsons.DatosActualizarLocacion
import jsons.JsonLocacion
import Jsons.DatosActualizarServicios
import jsons.JsonServicio
import jsons.JsonUsuario
import Jsons.DatosActualizarUsuarios

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
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as Repositorio<Locacion>
		RepoLocaciones.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Usuario seleccion) {
		val RepoUsuarios = ApplicationContext.instance.getSingleton(typeof(Usuario)) as Repositorio<Usuario>
		RepoUsuarios.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "usuariosDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Servicio seleccion) {
		val RepoServicios = ApplicationContext.instance.getSingleton(typeof(Servicio)) as Repositorio<Servicio>
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

	def getActualizarLocacion() {
		var datosAct = new DatosActualizarLocacion
		var jsonLocacion = new JsonLocacion
		jsonLocacion.deserializarJson(datosAct.actualizarJsonLocacion, getRepoLocaciones)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo")
	}

	def getActualizarServicio() {
		var datosAct = new DatosActualizarServicios
		var jsonServicio = new JsonServicio
		jsonServicio.deserializarJson(datosAct.actualizarJsonServicio, repoServicios)
		ObservableUtils.firePropertyChanged(this, "serviciosDelRepo")
	}
		def getActualizarUsuario() {
		var datosAct = new DatosActualizarUsuarios
		var jsonUsuario = new JsonUsuario
		jsonUsuario.deserializarJson(datosAct.actualizarJsonUsuario, repoUsuarios)
		ObservableUtils.firePropertyChanged(this, "usuariosDelRepo")
	}

//def  editarSeleccion(Locacion seleccion){
//	new ABM_Locacion_View(, seleccion).open
//	ABM_Modelo.editarEntidad(seleccion)
//}
//
//def dispatch editarSeleccion(Usuario Seleccion){
//	new ABL_Locacion(owner, new ABMLocacion()).open
//	//ABL_Locacion.setLocacionSeleccionada()
//}	
	def setLocacionSeleccionada(ABL_Locacion locacion, Locacion locacion2) {
	}

//@Dependencies("TipoDeUsuario")
//def getEsTipoDeUsuario(Usuario unUsuario){
//	return unUsuario.tipoDeUsuario
//}
	def getCostoServicio(Servicio servicio) {
		if (servicio.tipoDeTarifa instanceof TarifaFija) {
			(servicio.costoFijo + " TF " + servicio.costoMinimo)
		} else {
			(servicio.costoPorHora + " TPH " + servicio.costoMinimo)
		}

	}

	def crearLocacion(Locacion locacion) {
		repoLocaciones.agregarElemento(locacion)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo")
	}

	def crearServicio(Servicio servicio) {
		repoServicios.agregarElemento(servicio)
		ObservableUtils.firePropertyChanged(this, "serviciosDelRepo")
	}

	def crearUsuario(Usuario usuario) {
		repoUsuarios.agregarElemento(usuario)
		ObservableUtils.firePropertyChanged(this, "usuariosDelRepo")

	}

}

