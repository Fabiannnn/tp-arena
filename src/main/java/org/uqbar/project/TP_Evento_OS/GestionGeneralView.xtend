package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import eventos.Usuario
import servicios.Servicio

@Accessors
abstract class GestionGeneralView extends Dialog<GestionGeneralModel> {

	new(WindowOwner owner, GestionGeneralModel model) {

		super(owner, model)
		this.delegate.errorViewer = this

	}

	override protected createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		val Panel PanelIzquierdo = new Panel(form)
		crearTablaGestion(PanelIzquierdo)

		val Panel PanelDerecho = new Panel(form)
		// PanelDerecho.width = 200
		crearBotoneraGestion(PanelDerecho)

	}

	abstract def void addFormPanel(Panel panel)

	def protected crearTablaGestion(Panel panel) {}

	def crearBotoneraGestion(Panel panel) {
		var actionsPanel = new Panel(panel)
		actionsPanel.layout = new VerticalLayout

		val edicion = new Button(actionsPanel) => [
			caption = "Editar"
			setWidth = 150

		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			setWidth = 150
			onClick [|modelObject.eliminarSeleccion]

		]
		new Button(actionsPanel) => [
			caption = "Nueva Locacion"
			setWidth = 150

		 onClick [|new ABL_base(owner, new ABMLocacion()).open]
		]
		new Button(actionsPanel) => [
			caption = "Update Masivo"
			setWidth = 10
		// onClick [|new GestionDeLocacionesModel().actualizar]
		]
	}

//	abstract def void bindValueToProperty(Button boton, String property) {
//		boton.bindValueToProperty(property)
//
//		this
//	}
}

class GestionDeLocacionesView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Locaciones"
	}

	override protected crearTablaGestion(Panel panel) {
		minWidth = 300
		this.describeResultadosGrid(
			new Table<Locacion>(panel, typeof(Locacion)) => [
				numberVisibleRows = 10
				items <=> "locacionesDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}

	def describeResultadosGrid(Table<Locacion> table) {
		new Column<Locacion>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
		new Column<Locacion>(table) => [
			title = "Superficie"
			fixedSize = 150
			bindContentsToProperty("superficie")
		]
		new Column<Locacion>(table) => [
			title = "Coordenadas"
			fixedSize = 150
			bindContentsToProperty("punto")
		]
	}

	override addFormPanel(Panel panel) {
	}

}
class GestionDeUsuariosView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Usuarios"
	}

	override protected crearTablaGestion(Panel panel) {
		minWidth = 300
		this.describeResultadosGrid(
			new Table<Usuario>(panel, typeof(Usuario)) => [
				numberVisibleRows = 10
				items <=> "usuariosDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}
	
	def describeResultadosGrid(Table<Usuario> table) {
		new Column<Usuario>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombreApellido")
		]
//		new Column<Locacion>(table) => [
//			title = "Superficie"
//			fixedSize = 150
//			bindContentsToProperty("superficie")
//		]
		new Column<Usuario>(table) => [
			title = "Mail"
			fixedSize = 150
			bindContentsToProperty("email")
		]
	}
	
	
	
	override addFormPanel(Panel panel) {
	
	}
	
	}
	class GestionDeServiciosView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Servicios"
	}

	override protected crearTablaGestion(Panel panel) {
		minWidth = 300
		this.describeResultadosGrid(
			new Table<Servicio>(panel, typeof(Servicio)) => [
				numberVisibleRows = 10
				items <=> "serviciosDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}
	
	def describeResultadosGrid(Table<Servicio> table) {
		new Column<Servicio>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("descripcion")
		]
		new Column<Servicio>(table) => [
			title = "TipoTarifa"
			fixedSize = 100
			bindContentsToProperty("descripcion")//falta metodo
		]
		new Column<Servicio>(table) => [
			title = "Ubicacion"
			fixedSize = 150
			bindContentsToProperty("ubicacion")
		]
	}
	
	override addFormPanel(Panel panel) {
	
	}}