package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import eventos.Locacion
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.applicationContext.ApplicationContext
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
		
		var  locacionEditar= seleccion
		
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
		locacionEditar.nombre = seleccion.nombre
	}

}
