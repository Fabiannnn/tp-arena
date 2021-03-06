package viewGestion

import eventos.Locacion
import modelo.GestionLocacionModel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.utils.ObservableUtils
import eventos.Entidad
import viewABM.ABMLocacionView
import view.DashboardView

@Accessors
class GestionDeLocacionesView extends GestionGeneralView<Locacion> {

	new(WindowOwner owner, GestionLocacionModel model, DashboardView dashboard) {
		super(owner, model, dashboard)
		this.delegate.errorViewer = this
	}

	override addFormPanel(Panel panel) {}

	override protected crearTablaGestion(Panel panel) {
		this.describeResultadosGrid(
			new Table<Locacion>(panel, typeof(Locacion)) => [
				numberVisibleRows = 7
				items <=> "elementosDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}

	def protected describeResultadosGrid(Table<Locacion> table) {
		crearColumna(table, "Nombre", "nombre")
		crearColumna(table, "Superficie", "superficie")
		crearColumna(table, "Ubicacion", "punto")
	}

	override void crearBotoneraGestion(Panel panel) {

		super.crearBotoneraGestion(panel)

		new Button(panel) => [
			caption = "Agregar"
			setWidth = 100
			onClick([|this.crearLocacion])
		]

		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 100
			onClick [|modelObject.getActualizar(); super.ventanaMadre.actualizarTablas()]
		]
	}

	def crearLocacion() {
		val locacion = new Locacion
		new ABMLocacionView(this, locacion, ventanaMadre) => [
			onAccept[this.modelObject.crearElemento(locacion); super.ventanaMadre.actualizarTablas()]
			open
		]
	}

	override EditarSeleccion() {
		new ABMLocacionView(this, modelObject.entidadSeleccionada, ventanaMadre) => [
			onAccept[this.modelObject.getEditar()]
			open
		]
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "nombre")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "superficie")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "punto")
	}

	def actualizarPropiedadEnVista(Entidad entidad, String propiedad) {
		ObservableUtils.firePropertyChanged(entidad, propiedad)
	}

}
