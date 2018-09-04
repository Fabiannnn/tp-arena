package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import repositorio.RepositorioLocaciones
import java.util.List
import eventos.TipoDeUsuario
import java.util.Set
import eventos.UsuarioFree
import eventos.UsuarioAmateur
import eventos.UsuarioProfesional

@Accessors
@Observable
class ABM_Modelo {

	String nombreModelo
	Locacion locacionModelo
	Set<String> tiposDeUsuarios = newHashSet()

	def getRepoLocaciones() {
		// val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	def getLocacionNueva() {
		repoLocaciones
	}

	def static editarEntidad(Locacion seleccion) {

		var locacionEditar = seleccion

		// val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
		locacionEditar.nombre = seleccion.nombre
	}



}
