package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import eventos.TipoDeUsuario
import eventos.Usuario
import eventos.UsuarioAmateur
import eventos.UsuarioFree
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import transformer.TipoDeUsuarioTransformer

@Accessors
abstract class GestionGeneralView extends Dialog<GestionGeneralModel> {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		this.delegate.errorViewer = this
	}

	override ErrorsPanel createErrorsPanel(Panel mainPanel) { return new ErrorsPanel(mainPanel, "Panel de error", 3) }

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		val Panel PanelIzquierdo = new Panel(form)
		PanelIzquierdo.width = 800
		crearTablaGestion(PanelIzquierdo)
		val Panel PanelDerecho = new Panel(form)
		PanelDerecho.width = 300
		crearBotoneraGestion(PanelDerecho)
	}

	abstract def void addFormPanel(Panel panel)

	def protected crearTablaGestion(Panel panel) {}

//	def crearUsuario() {
//		val usuario = new Usuario
//		new ABM_Usuario_View(this, usuario) => [
//			onAccept[this.modelObject.crearUsuario(usuario)]
//			open
//		]
//	}
	def void crearBotoneraGestion(Panel panel) {
		var actionsPanel = new Panel(panel)
		actionsPanel.layout = new VerticalLayout
		var edit = new Button(actionsPanel) => [
			caption = "Editar"
			setWidth = 150
		// onClick [|  modelObject.editarSeleccion("entidadSeleccionada") ]
		]

		var eliminar = new Button(actionsPanel) => [
			caption = "Eliminar"
			setWidth = 150
			onClick [|modelObject.getEliminarSeleccion()]
		]
//		var agregar = new Button(actionsPanel) => [
//			caption = "Agregar"
//			setWidth = 150
//		onClick [|new ABL_base(owner, new ABMLocacion()).open]
//		]
//		var actualizar = new Button(actionsPanel) => [
//			caption = "Update Masivo"
//			setWidth = 10
//		// onClick [|modelObject.getActualizar()]
//		]
//		new Button(actionsPanel) => [
//			caption = "Update Masivo"
//			setWidth = 10
//		// onClick [|modelObject.getActualizar()]
//		]
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
		minWidth = 1200
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
			// fixedSize = 130
			bindContentsToProperty("nombre")
		]
		new Column<Locacion>(table) => [
			title = "Superficie"
			// fixedSize = 50
			bindContentsToProperty("superficie")
		]
		new Column<Locacion>(table) => [
			title = "Ubicacion"
			fixedSize = 100
			bindContentsToProperty("punto")
		]
	}

	override void crearBotoneraGestion(Panel panel) {
		super.crearBotoneraGestion(panel)
//		var agregar = new Button(panel) => [
//			caption = "Agregar"
//			setWidth = 150
//			onClick([|this.crearLocacion])
//		]
		new Button(panel) => [
			caption = "Agregar"
			setWidth = 150
			onClick([|this.crearLocacion])
		]
		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 10
			onClick [|modelObject.getActualizarLocacion()]
		]
	}

	def crearLocacion() {
		val locacion = new Locacion
		new ABM_Locacion_View(this, locacion) => [
			onAccept[this.modelObject.crearLocacion(locacion)]
			open
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
		minWidth = 750
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
//			 alignRight    // TODO preguntar por que si descomentamos esto desaparecen botones!!!!!
//			 fixedSize = 100
			bindContentsToProperty("costoServicio")
		]

		new Column<Servicio>(table) => [
			title = "Ubicacion"
			fixedSize = 150
			bindContentsToProperty("ubicacion")
		]

	}

	override void crearBotoneraGestion(Panel panel) {
		super.crearBotoneraGestion(panel)
//		var agregar = new Button(panel) => [
//			caption = "Agregar"
//			setWidth = 150
//			onClick([|this.crearServicio])
//		]
		new Button(panel) => [
			caption = "Agregar"
			setWidth = 150
			onClick([|this.crearServicio])
		]
		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 10
			onClick [|modelObject.getActualizarServicio()]
		]
	}

	def crearServicio() {
		val servicio = new Servicio
		new ABM_Servicio_View(this, servicio) => [
			onAccept[this.modelObject.crearServicio(servicio)]
			open

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
		minWidth = 750
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
			fixedSize = 200
			bindContentsToProperty("email")
		]
		new Column<Usuario>(table) => [//TODO es para ver si lo carga no lo pide aca lo tomo bien!!!!
			title = "Fecha Nac"
			fixedSize = 200
			bindContentsToProperty("fechaNacimiento")
		]
				
		new Column<Usuario>(table) => [//TODO es para ver si lo carga no lo pide aca lo tomo bien!!!!
			title = "Tipo De Usuario"
			fixedSize = 200
			bindContentsToProperty("tipoDeUsuario").transformer = [TipoDeUsuario valueFromModel | if(valueFromModel instanceof UsuarioFree ){
				return " No tan Free"
				} else if (valueFromModel instanceof UsuarioAmateur){
				return "Amateur"		} else 		{
			return "Profesional"	}]
		]
		
	}

	override void crearBotoneraGestion(Panel panel) {
		super.crearBotoneraGestion(panel)
		// var agregar = new Button(panel) => [caption = "Agregar" setWidth = 150 onClick([|this.crearUsuario])]
		new Button(panel) => [caption = "Agregar" setWidth = 150 onClick([|this.crearUsuario])]
		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 10
			onClick [|modelObject.getActualizarUsuario()]
		]
	}

	def crearUsuario() {
		val usuario = new Usuario
		new ABM_Usuario_View(this, usuario) => [
			onAccept[this.modelObject.crearUsuario(usuario)]
			open
		]
	}

}
