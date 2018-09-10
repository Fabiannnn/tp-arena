package modelo

import jsonUI.JsonServicioUI
import jsons.JsonServicio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import servicios.Servicio
import servicios.TarifaFija

@Accessors
@Observable
class GestionServicioModel extends GestionGeneralModel<Servicio> {

	def getCostoServicio(Servicio servicio) {
		if (servicio.tipoDeTarifa instanceof TarifaFija) {
			(servicio.costoFijo + " TF " + servicio.costoMinimo)
		} else {
			(servicio.costoPorHora + " TPH " + servicio.costoMinimo)
		}
	}

	override getActualizar() {
		var datosAct = new JsonServicioUI
		var jsonServicio = new JsonServicio
		jsonServicio.deserializarJson(datosAct.actualizarJsonServicio, getRepo)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	override tipoRepo() {
		typeof(Servicio)
	}

}
