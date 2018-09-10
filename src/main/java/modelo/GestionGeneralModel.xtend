package modelo

import eventos.Entidad
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import repositorio.Repositorio

@Accessors
@Observable
abstract class GestionGeneralModel<T extends Entidad> {

	public T entidadSeleccionada

	def getEliminarSeleccion() {
		getRepo.delete(entidadSeleccionada)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	def Repositorio<T> getRepo() {
		ApplicationContext.instance.getSingleton(tipoRepo)

	}

	def Class<T> tipoRepo()

	def getElementosDelRepo() {
		getRepo.elementos
	}

	def getEditar() {
		getRepo.update(entidadSeleccionada)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
		ObservableUtils.firePropertyChanged(this, "entidadSeleccionada")
	}

	def void crearElemento(T elemento) {

		getRepo.create(elemento)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	abstract def void getActualizar()
	
}