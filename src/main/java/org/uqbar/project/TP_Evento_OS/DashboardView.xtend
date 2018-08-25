package org.uqbar.project.TP_Evento_OS

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Panel
import eventos.Usuario
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.List

class DashboardView extends SimpleWindow<DashboardModel> {
	new(WindowOwner owner) {

		super(owner, new DashboardModel)
		title = "Evento OS -algo3"

	}

	override createMainTemplate(Panel mainPanel) { // MainTemplate
		mainPanel.layout = new HorizontalLayout
		val PanelIzquierdo = new Panel(mainPanel)

		PanelIzquierdo.layout = new VerticalLayout

		PanelIzquierdo.width = 500

		crearPanelEstadistica(PanelIzquierdo)
		crearPanelDeLocaciones(PanelIzquierdo)

		val PanelDerecho = new Panel(mainPanel)
		PanelIzquierdo.width = 500
		crearPanelDeUsuarios(PanelDerecho)
		crearPanelDeServicios(PanelDerecho)

	}

	def crearPanelDeServicios(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = "Últimos Servicios"
				fontSize = 14

			]

//			new TextBox(it).value <=> "busquedaCliente"
			new List(it) => [
//				items <=> "clientes"
//				value <=> "clienteSeleccionado"
				width = 300
				height = 220
			]
//			
//			new Label(it).text = "Nombre"
//			new TextBox(it).value <=> "nombreCliente"
//			
//			new Label(it).text = "Apellido"
//			new TextBox(it).value <=> "apellidoCliente"
			new Button(it) => [
				caption = "Gestion De Servicios"
				onClick[] // | modelObject.crearCliente		
			]
		]
	}

	def crearPanelDeUsuarios(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = "Usuarios Mas Activos"
				fontSize = 18
			]
			new List(it) => [

				width = 450
				height = 220
			]
			new Button(it) => [
				caption = "Gestion De Usuarios"
				onClick[] // | modelObject.crearCliente		
			]
		]
	}

	def crearPanelDeLocaciones(Panel mainPanel) {
		new Panel(mainPanel) => [
			new Label(it) => [
				text = "Locaciones no se que"
				fontSize = 18
			]
			new List(it) => [
//				items <=> "clientes"
//				value <=> "clienteSeleccionado"
				width = 450
				height = 220
			]
			new Button(it) => [
				caption = "Gestion De Locaciones"
				onClick[] // | modelObject.crearCliente		
			]
		]
	}

	def crearPanelEstadistica(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Estadísticas"
			fontSize = 18
			width = 450
		]
		new Panel(mainPanel) => [

			it.layout = new ColumnLayout(2)
			new Label(it).text = "Cantidad total de Eventos"
			new NumericField(it).value <=> "cantEventos"
			new NumericField(it).value <=> "locacion.prueba"
			new NumericField(it).value <=> "locacion.prueba2"
		]
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
		//repite titulo del formulario
	}
}
