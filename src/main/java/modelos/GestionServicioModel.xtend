package modelos

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.applicationContext.ApplicationContext
import servicios.Servicio
import org.uqbar.commons.model.utils.ObservableUtils
import servicios.TarifaFija
import Jsons.DatosActualizarServicios
import jsons.JsonServicio
import repositorio.RepositorioServicios

@Accessors
@Observable
class GestionServicioModel extends GestionGeneralModel<Servicio> {
	override getRepo() {
		ApplicationContext.instance.getSingleton(typeof(Servicio)) as RepositorioServicios
	}

	override crearElemento(Servicio servicio) {
		getRepo.agregarElemento(servicio)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	def getCostoServicio(Servicio servicio) {
		if (servicio.tipoDeTarifa instanceof TarifaFija) {
			(servicio.costoFijo + " TF " + servicio.costoMinimo)
		} else {
			(servicio.costoPorHora + " TPH " + servicio.costoMinimo)
		}
	}

	override getActualizar() {
		var datosAct = new DatosActualizarServicios
		var jsonServicio = new JsonServicio
		jsonServicio.deserializarJson(datosAct.actualizarJsonServicio, getRepo)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}
}