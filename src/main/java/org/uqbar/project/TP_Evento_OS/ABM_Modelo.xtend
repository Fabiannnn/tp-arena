package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import repositorio.RepositorioLocaciones

@Accessors
@Observable
class ABM_Modelo {

	String nombreModelo
	Locacion locacionModelo
	Set<String> tiposDeUsuarios = newHashSet()
	Set<String> tiposDeServicios = newHashSet()
	Set<String> tiposDeTarifas = newHashSet()
	
	def getRepoLocaciones() {
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	def getLocacionNueva() {
		repoLocaciones
	}

//	def static editarEntidad(Locacion seleccion) {
//
//		var locacionEditar = seleccion
//
//		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
//		locacionEditar.nombre = seleccion.nombre
//	}

}
