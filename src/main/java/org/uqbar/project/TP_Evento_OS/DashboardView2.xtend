package org.uqbar.project.TP_Evento_OS

import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import repositorio.RepositorioServicios
import repositorio.RepositorioUsuarios

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import repositorio.RepositorioLocaciones
import eventos.Usuario
import servicios.Servicio

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
			fontSize = 14
			alignLeft

		]

		val Panel PanelColumnas = new Panel(PanelEstadisticas)
		PanelColumnas.layout = new ColumnLayout(2)
		new Label(PanelColumnas).setText("Eventos Totales:").alignLeft.width = 200
		new Label(PanelColumnas) => [
			value <=> "eventosTotales"
		]

		new Label(PanelColumnas).setText("Eventos último mes:").alignLeft.width = 200
		new Label(PanelColumnas) => [
			value <=> "eventosUltimoMes"
		]

		new Label(PanelColumnas).setText("Eventos exitosos:").alignLeft.width = 200
		new Label(PanelColumnas) => [
			value <=> "eventosExitosos"
		]

		new Label(PanelColumnas).setText("Eventos fracasados:").alignLeft.width = 200
		new Label(PanelColumnas) => [
			value <=> "eventosFracasados"
		]

		new Label(PanelColumnas).setText("Entradas vendidas:").alignLeft.width = 200
		new Label(PanelColumnas) => [
			value <=> "entradasVendidas"
		]

		new Label(PanelColumnas).setText("Invitaciones enviadas:").alignLeft.width = 200
		new Label(PanelColumnas) => [
			value <=> "invitacionesEnviadas"
		]

	}

	def crearPanelDeLocaciones(Panel PanelDeLocaciones) {
		new Label(PanelDeLocaciones) => [
			it.text = "Locaciones más polulares:"
			it.fontSize = 14
		]
		val table = new Table<Locacion>(PanelDeLocaciones, typeof(Locacion)) => [
			numberVisibleRows = 10
			items <=> "locacionesPopulares"
			new Column<Locacion>(it) => [
				title = "Nombre"
				fixedSize = 250
				bindContentsToProperty("nombre")
			]
			new Column<Locacion>(it) => [
				title = "Capacidad"
				fixedSize = 100
				bindContentsToProperty("capacidadMaxima")
			]
		]
		new Button(PanelDeLocaciones) => [
			caption = "Gestión de Locaciones"
			setWidth = 100
			onClick [|new GestionDeLocacionesView(owner, new GestionGeneralModel()).open]
		]
	}

	def crearPanelDeUsuarios(Panel PanelDeUsuarios) {
		new Label(PanelDeUsuarios) => [
			it.text = "Usuarios más activos:"
			it.fontSize = 14
			it.alignLeft
		]

		val tablaUsuarios = new Table<Usuario>(PanelDeUsuarios, typeof(Usuario)) => [
			numberVisibleRows = 10
			items <=> "usuariosActivos"

			new Column<Usuario>(it) => [
				title = "Username"
				fixedSize = 100
				bindContentsToProperty("nombreUsuario")
			]
			new Column<Usuario>(it) => [
				title = "Nombre y Apellido"
				fixedSize = 250
				bindContentsToProperty("nombreApellido")
			]
		]
		new Button(PanelDeUsuarios) => [
			caption = "Gestión de Usuarios"
			width = 100
		 onClick [ | new GestionDeUsuariosView(owner, new GestionGeneralModel()).open] 
		]
	}

	def crearPanelDeServicios(Panel PanelDeServicios) {
		new Label(PanelDeServicios) => [
			it.text = "Últimos Servicios:"
			it.fontSize = 14
		]

		val tablaServicios = new Table<Servicio>(PanelDeServicios, typeof(Servicio)) => [
			numberVisibleRows = 10
			items <=> "serviciosNuevos"
			new Column<Servicio>(it) => [
				title = "Nombre"
				fixedSize = 250
				bindContentsToProperty("descripcion")
			]
			new Column<Servicio>(it) => [
				title = "Tarifa"
				fixedSize = 100
				bindContentsToProperty("costoFijo") // Falta Modelar
			]
		]
		new Button(PanelDeServicios) => [
			caption = "Gestión de Servicios"
			width = 100
		onClick [ | new GestionDeServiciosView(owner, new GestionGeneralModel()).open]  
		]

	}

}
