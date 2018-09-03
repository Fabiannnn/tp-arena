package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import repositorio.RepositorioLocaciones

@Accessors
@Observable
class ABMLocacion {

	String nombreModelo
	Locacion locacionModelo

	def repoLocaciones() {
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	def getLocacionNueva() {
		repoLocaciones()
	}

	def static editarEntidad(Locacion seleccion) {

		var locacionEditar = seleccion

		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
		locacionEditar.nombre = seleccion.nombre
	}

}
