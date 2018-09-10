package view

import eventos.Locacion
import eventos.Usuario
import modelo.DashboardModel
import modelo.GestionLocacionModel
import modelo.GestionServicioModel
import modelo.GestionUsuarioModel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import viewGestion.GestionDeLocacionesView
import viewGestion.GestionDeUsuariosView
import viewGestion.GestionDeServiciosView

@Accessors
class DashboardView extends SimpleWindow<DashboardModel> {

	new(WindowOwner owner, DashboardModel model) {
		super(owner, model)
	}

	override protected addActions(Panel actionsPanel) {}

	override protected createFormPanel(Panel mainPanel) {}

	override createMainTemplate(Panel mainPanel) {

		this.title = "EventOS - Dashboard"
		mainPanel.layout = new HorizontalLayout

		val Panel PanelIzquierdo = new Panel(mainPanel)
		crearPanelEstadistica(PanelIzquierdo)
		crearPanelLocaciones(PanelIzquierdo)

		val Panel PanelDerecho = new Panel(mainPanel)
		crearPanelUsuarios(PanelDerecho)
		crearPanelServicios(PanelDerecho)
	}

	def crearParLabels(Panel panel, String etiqueta, String valor) {
		new Label(panel) => [
			height = 33
			fontSize = 10
			setText = etiqueta
		]

		new Label(panel) => [
			height = 33
			fontSize = 10
			value <=> valor
		]

	}

	def crearLabelTitulo(Panel panel, String titulo) {
		new Label(panel) => [
			text = titulo
			fontSize = 14
			alignLeft
		]
	}

	def crearColumna(Table<?> tabla, String titulo, String propiedad) {
		this.crearColumna(tabla,titulo,propiedad,150)

	}

	def crearColumna(Table<?> tabla, String titulo, String propiedad, int fSize) {
		new Column(tabla) => [
			title = titulo
			fixedSize = fSize
			bindContentsToProperty(propiedad)
		]
	}

	def crearPanelEstadistica(Panel PanelDeEstadisticas) {

		crearLabelTitulo(PanelDeEstadisticas, "Estadísticas:")

		val Panel PanelColumnas = new Panel(PanelDeEstadisticas)
		PanelColumnas.layout = new ColumnLayout(2)

		crearParLabels(PanelColumnas, "Eventos Totales:", "eventosTotales")
		crearParLabels(PanelColumnas, "Eventos último mes:", "eventosUltimoMes")
		crearParLabels(PanelColumnas, "Eventos exitosos:", "eventosExitosos")
		crearParLabels(PanelColumnas, "Eventos fracasados:", "eventosFracasados")
		crearParLabels(PanelColumnas, "Entradas vendidas:", "entradasVendidas")
		crearParLabels(PanelColumnas, "Invitaciones enviadas:", "invitacionesEnviadas")

	}

	def crearPanelLocaciones(Panel PanelLocaciones) {

		crearLabelTitulo(PanelLocaciones, "Locaciones más populares:")

		new Table<Locacion>(PanelLocaciones, typeof(Locacion)) => [
			numberVisibleRows = 10
			items <=> "locacionesPopulares"

			crearColumna(it, "Nombre", "nombre")
			crearColumna(it, "Capacidad", "capacidadMaxima")
		]

		new Button(PanelLocaciones) => [
			caption = "Gestión de Locaciones"
			onClick [|new GestionDeLocacionesView(owner, new GestionLocacionModel()).open]
		]
	}

	def crearPanelUsuarios(Panel PanelUsuarios) {

		crearLabelTitulo(PanelUsuarios, "Usuarios más activos:")

		new Table<Usuario>(PanelUsuarios, typeof(Usuario)) => [
			numberVisibleRows = 10
			items <=> "usuariosActivos"

			crearColumna(it, "Username", "nombreUsuario")
			crearColumna(it, "Nombre y Apellido", "nombreApellido")
		]

		new Button(PanelUsuarios) => [
			caption = "Gestión de Usuarios"
			onClick [|new GestionDeUsuariosView(owner, new GestionUsuarioModel()).open]
		]
	}

	def crearPanelServicios(Panel PanelServicios) {

		crearLabelTitulo(PanelServicios, "Últimos Servicios:")

		new Table<Servicio>(PanelServicios, typeof(Servicio)) => [
			numberVisibleRows = 10
			items <=> "serviciosNuevos"

			crearColumna(it, "Nombre", "descripcion")
			crearColumna(it, "Tarifa", "costoServicio")
		]

		new Button(PanelServicios) => [
			caption = "Gestión de Servicios"
			onClick [|new GestionDeServiciosView(owner, new GestionServicioModel()).open]
		]

	}
	
}