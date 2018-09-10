package modelo

import jsonUI.JsonLocacionUI
import jsons.JsonLocacion
import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class GestionLocacionModel extends GestionGeneralModel<Locacion> {

	override getActualizar() {
		var datosAct = new JsonLocacionUI
		var jsonLocacion = new JsonLocacion
		jsonLocacion.deserializarJson(datosAct.actualizarJsonLocacion, getRepo)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	override tipoRepo() {
		typeof(Locacion)
	}

}
