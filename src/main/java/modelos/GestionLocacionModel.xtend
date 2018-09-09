package modelos

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repositorio.RepositorioLocaciones
import org.uqbar.commons.applicationContext.ApplicationContext
import eventos.Locacion
import org.uqbar.commons.model.utils.ObservableUtils
import Jsons.DatosActualizarLocacion
import jsons.JsonLocacion

@Accessors
@Observable
class GestionLocacionModel extends GestionGeneralModel<Locacion> {

	override RepositorioLocaciones getRepo() {
		return ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	override crearElemento(Locacion locacion) {
		getRepo.agregarElemento(locacion)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	override getActualizar() {
		var datosAct = new DatosActualizarLocacion
		var jsonLocacion = new JsonLocacion
		jsonLocacion.deserializarJson(datosAct.actualizarJsonLocacion, getRepo)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}



}
