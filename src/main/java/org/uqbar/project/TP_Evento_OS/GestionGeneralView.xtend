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
import java.awt.Event
import eventos.Entidad

@Accessors
abstract class GestionGeneralView extends Dialog<GestionGeneralModel<Entidad>> {

	new(WindowOwner owner, GestionGeneralModel model) {
		super(owner, model)
		this.delegate.errorViewer = this
	}

//	override ErrorsPanel createErrorsPanel(Panel mainPanel) { new ErrorsPanel(mainPanel, "Panel de error", 1) }
	def tituloDefault() {
		"Gestor"
	}

	override protected createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)

		val Panel PanelIzquierdo = new Panel(form)
		crearTablaGestion(PanelIzquierdo)

		val Panel PanelDerecho = new Panel(form)
		crearBotoneraGestion(PanelDerecho)
	}

	abstract def void addFormPanel(Panel panel)

	def protected crearTablaGestion(Panel panel) {}

	def crearColumna(Table  tabla, String titulo, String propiedad) {
		new Column<Entidad>(tabla) => [
			title = titulo
			fixedSize = 150
			bindContentsToProperty(propiedad)
		]
	}

	def crearColumna(Table tabla, String titulo, String propiedad, int fSize) {
		new Column<Entidad>(tabla) => [
			title = titulo
			fixedSize = fSize
			bindContentsToProperty(propiedad)
		]
	}

	def void crearBotoneraGestion(Panel panel) {

		var actionsPanel = new Panel(panel)
		actionsPanel.layout = new VerticalLayout

		var edit = new Button(actionsPanel) => [
			caption = "Editar"
			setWidth = 100
		// onClick [|  modelObject.editarSeleccion("entidadSeleccionada") ]
		]

		var eliminar = new Button(actionsPanel) => [
			caption = "Eliminar"
			setWidth = 100
			onClick [|modelObject.getEliminarSeleccion()]
		]
/*Deshabilitado de Botones hasta tener elemento Seleccionado*/
		var seleccionTabla = new NotNullObservable("entidadSeleccionada")
		edit.bindEnabled(seleccionTabla)
		eliminar.bindEnabled(seleccionTabla)
	}
}
@Accessors
class GestionDeLocacionesView extends GestionGeneralView {

	new(WindowOwner owner, GestionLocacionModel model) {
		super(owner, model)
			//	title = "EventOS - Gestion de Locaciones"

	}
	override tituloDefault(){
				"EventOS - Gestion de Locaciones"
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

	def protected describeResultadosGrid(Table table) {
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
			onClick [|modelObject.getActualizar()]
		]
	}

	def crearLocacion() {
		val locacion = new Locacion
		new ABM_Locacion_View(this, locacion) => [
			onAccept[this.modelObject.crearElemento(locacion)]
			open
		]
	}

//	deef void EditarSeleccion(Locacion seleccion) { //  TODO falta Modelar
//		var ventanaEdicion =  new ABL_base(owner, new ABMLocacion())
//		ABMLocacion.editarEntidad(seleccion)
//	}
}

class GestionDeServiciosView extends GestionGeneralView {

	new(WindowOwner owner, GestionGeneralModel model) {
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

	def protected describeResultadosGrid(Table  table) {
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
		new ABM_Servicio_View(this, servicio) => [
			onAccept[this.modelObject.crearElemento(servicio)]
			open
		]
	}
}

class GestionDeUsuariosView extends GestionGeneralView {

	new(WindowOwner owner, GestionUsuarioModel model) {
		super(owner, model)
		title = "EventOS - Gestion de Usuarios"
	}

	override addFormPanel(Panel panel) {}

	override protected crearTablaGestion(Panel panel) {
		this.describeResultadosGrid(
			new Table<Usuario>(panel, typeof(Usuario)) => [
				numberVisibleRows = 7
				items <=> "elementosDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}

	def protected describeResultadosGrid(Table table) {

		crearColumna(table, "Username", "nombreUsuario", 100)
		crearColumna(table, "Nombre", "nombreApellido", 100)
		crearColumna(table, "Mail", "email", 100)
		crearColumna(table, "Fecha Nac", "fechaNacimiento", 100)

//		new Column<Usuario>(table) => [//TODO es para ver si lo carga no lo pide aca lo tomo bien!!!!
//			title = "Tipo De Usuario"
//			fixedSize = 200
//			bindContentsToProperty("tipoDeUsuario").transformer = [TipoDeUsuario valueFromModel | if(valueFromModel instanceof UsuarioFree ){"Free"} else if (valueFromModel instanceof UsuarioAmateur){"Amateur"} else {"Profesional"}]
//		]
	}

	override void crearBotoneraGestion(Panel panel) {

		super.crearBotoneraGestion(panel)

		new Button(panel) => [
			caption = "Agregar"
			setWidth = 100
			onClick([|this.crearUsuario])
		]

		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 100
			onClick [|modelObject.getActualizar()]
		]

	}

	def crearUsuario() {
		val usuario = new Usuario
		new ABM_Usuario_View(this, usuario) => [
			onAccept[this.modelObject.crearElemento(usuario)]
			open
		]
	}

}
