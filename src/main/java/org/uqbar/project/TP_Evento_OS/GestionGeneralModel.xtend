package org.uqbar.project.TP_Evento_OS

import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import repositorio.Repositorio
import servicios.Servicio

@Accessors
@Observable
abstract class GestionGeneralModel<T extends Entidad> {

	public T entidadSeleccionada

	def getEliminarSeleccion() {
		this.getEliminarSeleccionDelRepositorio(entidadSeleccionada)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Locacion seleccion) {
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as Repositorio<Locacion>
		RepoLocaciones.delete(seleccion)

	}

	def dispatch getEliminarSeleccionDelRepositorio(Usuario seleccion) {
		val RepoUsuarios = ApplicationContext.instance.getSingleton(typeof(Usuario)) as Repositorio<Usuario>
		RepoUsuarios.delete(seleccion)

	}

	def dispatch getEliminarSeleccionDelRepositorio(Servicio seleccion) {
		val RepoServicios = ApplicationContext.instance.getSingleton(typeof(Servicio)) as Repositorio<Servicio>
		RepoServicios.delete(seleccion)

	}

	def Repositorio<T> getRepo() {}

	def getElementosDelRepo() {
		getRepo.elementos
	}

	def void crearElemento(T elemento) {}

	def getActualizar(T entidadSeleccionada) {}

	def void getActualizar()

}
