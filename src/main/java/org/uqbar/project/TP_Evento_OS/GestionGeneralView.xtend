package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import eventos.Usuario
import java.text.SimpleDateFormat
import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import transformer.TipoDeUsuarioTransformer
import org.uqbar.arena.bindings.PropertyAdapter
import eventos.TipoDeUsuario
import eventos.UsuarioProfesional
import java.util.Date
import transformer.LocalDateTransformer
import java.time.format.DateTimeFormatter
import javax.swing.text.DateFormatter

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
		PanelIzquierdo.width = 700
		crearTablaGestion(PanelIzquierdo)
		val Panel PanelDerecho = new Panel(form)
		PanelDerecho.width = 700
		crearBotoneraGestion(PanelDerecho)
	}

	abstract def void addFormPanel(Panel panel)

	def protected crearTablaGestion(Panel panel) {}

	def void crearBotoneraGestion(Panel panel) {
		var actionsPanel = new Panel(panel)
		actionsPanel.layout = new VerticalLayout
		var edit = new Button(actionsPanel) => [
			caption = "Editar"
			setWidth = 150
//			onClick [|  modelObject.editarSeleccion("entidadSeleccionada") ]
		]

		var eliminar = new Button(actionsPanel) => [
			caption = "Eliminar"
			setWidth = 150
			onClick [|modelObject.getEliminarSeleccion()]
		]
		var agregar = new Button(actionsPanel) => [
			caption = "Agregar"
			setWidth = 150
			onClick [|new ABL_base(owner, new ABMLocacion()).open]
		]
		var actualizar = new Button(actionsPanel) => [
			caption = "Update Masivo"
			setWidth = 10
			onClick [|modelObject.getActualizar()]
		]
		/*Deshabilitado de Botones hasta tener elemento seleccionado */
		var seleccionTabla = new NotNullObservable("entidadSeleccionada")
		edit.bindEnabled(seleccionTabla)
		eliminar.bindEnabled(seleccionTabla)
//		
//		agregar.bindVisible(seleccionTabla)
//		actualizar.bindVisible(seleccionTabla)
	}
}

class GestionDeLocacionesView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Locaciones"
	}

	override addFormPanel(Panel panel) {
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

	def protected describeResultadosGrid(Table<Locacion> table) {
		new Column<Locacion>(table) => [
			title = "Nombre"
			// fixedSize = 150
			bindContentsToProperty("nombre")
		]
		new Column<Locacion>(table) => [
			title = "Superficie"
			// fixedSize = 150
			bindContentsToProperty("superficie")
		]
		new Column<Locacion>(table) => [
			title = "Ubicacion"
			fixedSize = 150
			bindContentsToProperty("punto")
		]
	}
//	def void EditarSeleccion(Locacion seleccion) { //  TODO falta Modelar
//		var ventanaEdicion =  new ABL_base(owner, new ABMLocacion())
//		ABMLocacion.editarEntidad(seleccion)
//	}
}

class GestionDeServiciosView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Servicios"
	}

	override addFormPanel(Panel panel) {
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

	def protected describeResultadosGrid(Table<Servicio> table) {
		new Column<Servicio>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("descripcion")
		]
		new Column<Servicio>(table) => [
			title = "Tarifa"
			// alignRight     TODO preguntar por que si descomentamos esto desaparecen botones!!!!!
			// fixedSize = 100
			bindContentsToProperty("costoServicio")
		]

		new Column<Servicio>(table) => [
			title = "Ubicacion"
			fixedSize = 100
			bindContentsToProperty("ubicacion")
		]

	}

}

class GestionDeUsuariosView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Usuarios"
	}

	override addFormPanel(Panel panel) {
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

	def protected describeResultadosGrid(Table<Usuario> table) {
		new Column<Usuario>(table) => [
			title = "Username"
			fixedSize = 150
			bindContentsToProperty("nombreUsuario")
		]
		new Column<Usuario>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombreApellido")
		]
		new Column<Usuario>(table) => [
			title = "Mail"
			fixedSize = 150
			bindContentsToProperty("email")
		]
	}

}
