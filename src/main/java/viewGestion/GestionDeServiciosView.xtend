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

@Accessors
class GestionDeServiciosView extends GestionGeneralView<Servicio> {

	new(WindowOwner owner, GestionServicioModel model) {
		super(owner, model)
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
//		crearColumna(table, "Id", "id")
		crearColumna(table, "Nombre", "descripcion")
		crearColumna(table, "Tarifa", "costoServicio")
		crearColumna(table, "Ubicacion", "ubicacion")
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
			onClick [|modelObject.getActualizar()]
		]
	}

	def crearServicio() {
		val servicio = new Servicio
		new ABMServicioView(this, servicio) => [
			onAccept[this.modelObject.crearElemento(servicio)]
			open
		]
	}

	override EditarSeleccion() {
		new ABMServicioView(this, modelObject.entidadSeleccionada as Servicio) => [
			onAccept[this.modelObject.getEditar()]
			open
		]
//		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "id")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "descripcion")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "costoServicio")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "ubicacion")
	}

	def actualizarPropiedadEnVista(Entidad entidad, String propiedad) {
		ObservableUtils.firePropertyChanged(entidad, propiedad)
	}
}
