package viewGestion

import modelo.GestionServicioModel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.utils.ObservableUtils
import eventos.Entidad
import viewABM.ABMServicioView
import view.DashboardView

@Accessors
class GestionDeServiciosView extends GestionGeneralView<Servicio> {

	new(WindowOwner owner, GestionServicioModel model, DashboardView dashboard) {
		super(owner, model, dashboard)
		title = "EventOS - Gestion de Servicios"
	}

	override addFormPanel(Panel panel) {}

	override protected crearTablaGestion(Panel panel) {
		this.describeResultadosGrid(
			new Table<Servicio>(panel, typeof(Servicio)) => [
				numberVisibleRows = 7
				items <=> "elementosDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}

	def protected describeResultadosGrid(Table<Servicio> table) {
		crearColumna(table, "Nombre", "descripcion")
		crearColumna(table, "Tarifa", "costoServicio")
		crearColumna(table, "Ubicacion", "punto")
	}

	override void crearBotoneraGestion(Panel panel) {

		super.crearBotoneraGestion(panel)

		new Button(panel) => [
			caption = "Agregar"
			setWidth = 100
			onClick([|this.crearServicio])
		]

		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 100
			onClick [|modelObject.getActualizar(); super.ventanaMadre.actualizarTablas()]
		]
	}

	def crearServicio() {
		val servicio = new Servicio
		new ABMServicioView(this, servicio, ventanaMadre) => [
			onAccept[this.modelObject.crearElemento(servicio); super.ventanaMadre.actualizarTablas()]
			open
		]
	}

	override EditarSeleccion() {
		new ABMServicioView(this, modelObject.entidadSeleccionada as Servicio, ventanaMadre) => [
			onAccept[this.modelObject.getEditar()]
			open
		]
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "descripcion")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "costoServicio")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "punto")
	}

	def actualizarPropiedadEnVista(Entidad entidad, String propiedad) {
		ObservableUtils.firePropertyChanged(entidad, propiedad)
	}
}
