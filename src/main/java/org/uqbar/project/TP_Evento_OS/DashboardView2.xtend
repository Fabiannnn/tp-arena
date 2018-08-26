package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import eventos.Usuario
import eventos.Locacion
import View.LabeledTextBox
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
class DashboardView2 extends SimpleWindow<DashboardModel> {

	new(WindowOwner owner, DashboardModel model) {
		super(owner, model)
		title = "Evento OS "

	}

	override protected addActions(Panel actionsPanel) {
		// no queremos usar este template default
	}

	override protected createFormPanel(Panel mainPanel) {
		// no queremos usar este template default
	}

	override createMainTemplate(Panel mainPanel) {
		this.title = "Event OS-Dashboard"
		mainPanel.layout = new ColumnLayout(2)
		val Panel PanelIzquierdo = new Panel(mainPanel)
		PanelIzquierdo.layout = new VerticalLayout
		crearPanelEstadistica(PanelIzquierdo)
		crearPanelDeLocaciones(PanelIzquierdo)
		val Panel PanelDerecho = new Panel(mainPanel)
		crearPanelDeUsuarios(PanelDerecho)
		crearPanelDeServicios(PanelDerecho)

	}
	def crearPanelEstadistica(Panel PanelEstadisticas) {

		new Label(PanelEstadisticas) => [
			text = "Estadísticas:" 
			fontSize = 12
			alignLeft
			
		]
		
//		new Label(PanelEstadisticas).text="Cantidad total de eventos:"
//		new TextBox(PanelEstadisticas).bindValueToProperty("eventosTotales")
		new LabeledTextBox(PanelEstadisticas).setText("Eventos Totales:").bindValueToProperty("eventosTotales").width=20

		new LabeledTextBox(PanelEstadisticas).setText("Eventos último mes:").bindValueToProperty(
			"eventosUltimoMes").width=20
		new LabeledTextBox(PanelEstadisticas).setText("Evento exitosos:").bindValueToProperty(
			"eventosExitosos").width=20
		new LabeledTextBox(PanelEstadisticas).setText("Eventos fracasados:").bindValueToProperty(
			"eventosFracasados").width=20
		new LabeledTextBox(PanelEstadisticas).setText("Entradas vendidas:").bindValueToProperty(
			"entradasVendidas").width=20
		new LabeledTextBox(PanelEstadisticas).setText("Invitaciones enviadas:").bindValueToProperty(
			"invitacionesEnviadas").width=20
	}
	
		def crearPanelDeLocaciones(Panel PanelDeLocaciones) {
		// new Titulo(panelDeLocaciones, "Locaciones más polulares:" 12)	
		new Label(PanelDeLocaciones) => [
			it.text = "Últimos Servicios:"
			it.fontSize = 14
		]
//		val tablaDeLocaciones = new Table<Locacion>(PanelDeLocaciones, Locacion) => [] // items <=> "" 	value <=> ""
//		new Column(tablaDeLocaciones) => [
//			title = "Nombre"
//		// bindContentsToProperty("Nombre").transformer = [| new  ] 
//		]
//		new Column(tablaDeLocaciones) => [
//			title = "Capacidad"
//		// bindContentsToProperty("Capacidad").transformer = [ | ] 	
//		]
//		new Column(tablaDeLocaciones) => [
//			title = "Apellido"
//		// bindContentsToProperty("Apellido").transformer = [ | ] 	
//		]
		new Button(PanelDeLocaciones) => [
			caption = "Gestión de Locaciones"
			width = 100
		// onClick [ | new gestionDeLocacionesView().open ]    
		]

	}
		def crearPanelDeUsuarios(Panel PanelDeUsuarios) {
//		 new Titulo(panelDeServicios, "Usuarios más activos:" 12)	

		new Label(PanelDeUsuarios) => [
			it.text = "Últimos Servicios:"
			it.fontSize = 14
		]
//
//		val tablaDeUsuarios = new Table<Usuario>(PanelDeUsuarios, Usuario) => [] // items <=> "" 	value <=> ""
//		new Column(tablaDeUsuarios) => [
//			title = "Username"
//		// bindContentsToProperty("Username ").transformer = [| new  ]
//		]
//		new Column(tablaDeUsuarios) => [
//			title = "Npmbre"
//		// bindContentsToProperty("Nombre").transformer = [ | ] 	
//		]
//		new Column(tablaDeUsuarios) => [
//			title = "Apellido"
//		// bindContentsToProperty("Apellido").transformer = [ | ] 
//		]
		new Button(PanelDeUsuarios) => [
			caption = "Gestión de Usuarios"
			width = 100
		// onClick [ | new gestionDeUsuariosView ().open ]  
		]
	}
	def crearPanelDeServicios(Panel panelDeServicios) { // mainPanel o owner
//		new Label(panelDeServicios) => [text = "Últimos Servicios" fontSize = 14]
		new Label(panelDeServicios) => [
			it.text = "Últimos Servicios:"
			it.fontSize = 14
		]

//		val tablaDeServicios = new Table<Servicio>(panelDeServicios, Servicio) => [] // items => "" value => ""
//		new Column(tablaDeServicios) => [
//			title = "Nombre"
//		// bindContentsToProperty("Nombre").transformer = [|new ]
//		]
//		new Column(tablaDeServicios) => [
//			title = "Tarifa"
//			// bindContentsToProperty("Tarifa").transformer = [ | ] 	]
		new Button(panelDeServicios) => [
			caption = "Gestión de Servicios"
			width = 100
		// onClick [ | new gestionDeServiciosView().open ]    
		]
		
	}





}
// tablasPantallaPrincipal.crearTablaDeServicios(this)
//class TablasDashboardView extends SimpleWindow<DashboardModel> {
//
//	static TablasDashboardView instance
//
//	static def getInstance() {
//		if (instance === null) {
//			instance = new TablasDashboardView
//		}
//		instance
//	}
//
//	def crearTablaDeServicios(Panel mainPanel) {
//		val tablaDeServicios = new Table<Servicios>(panelDeServicios, servicios) => [items <=> "" value <=> ""]
//		new Column(tablaDeServicios) => [title = "Nombre" bindContentsToProperty("Nombre").transformer = [|new ]]
//		new Column(tablaDeServicios) => [title = "Tarifa" bindContentsToProperty("Tarifa").transformer = [| ]]
//	}
//
//	def crearTablaDeServicios(Panel mainPanel) {
//		val tablaDeUsuarios = new Table<Usuarios>(panelDeUsuario, usuario) => [items <=> "" value <=> ""]
//		new Column(tablaDeUsuarios) => [title = "Username" bindContentsToProperty("Username ").transformer = [|new ]]
//		new Column(tablaDeUsuarios) => [title = "Nombre" bindContentsToProperty("Nombre").transformer = [| ]]
//		new Column(tablaDeUsuarios) => [title = "Apellido" bindContentsToProperty("Apellido").transformer = [| ]]
//	}
//
//	def crearTablaDeLocaciones(Panel mainPanel) {
//
//		val tablaDeLocaciones = new Table<Locaciones>(panelDeLocaciones, locaciones) => [items <=> "" value <=> ""]
//		new Column(tablaDeLocaciones) => [title = "Nombre" bindContentsToProperty("Nombre").transformer = [|new ]]
//		new Column(tablaDeLocaciones) => [title = "Capacidad" bindContentsToProperty("Capacidad").transformer = [| ]]
//		new Column(tablaDeLocaciones) => [title = "Apellido" bindContentsToProperty("Apellido").transformer = [| ]]
//	}
//}
