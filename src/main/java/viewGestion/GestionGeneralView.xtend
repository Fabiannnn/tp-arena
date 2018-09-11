package viewGestion

import eventos.Entidad
import modelo.GestionGeneralModel
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
import view.DashboardView

@Accessors
abstract class GestionGeneralView<T extends Entidad> extends Dialog<GestionGeneralModel<T>> {

	DashboardView ventanaMadre

	new(WindowOwner owner, GestionGeneralModel<T> model, DashboardView dashboard) {
		super(owner, model)
		this.delegate.errorViewer = this
		ventanaMadre = dashboard
	}

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

	def crearColumna(Table<T> tabla, String titulo, String propiedad) {
		this.crearColumna(tabla, titulo, propiedad, 150)
	}

	def crearColumna(Table<T> tabla, String titulo, String propiedad, int fSize) {
		new Column<T>(tabla) => [
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
			onClick [|this.EditarSeleccion()
				this.ventanaMadre.actualizarTablas()
			]
		]

		var eliminar = new Button(actionsPanel) => [
			caption = "Eliminar"
			setWidth = 100
			onClick [|modelObject.getEliminarSeleccion(); this.ventanaMadre.actualizarTablas()]
		]

		var seleccionTabla = new NotNullObservable("entidadSeleccionada")
		edit.bindEnabled(seleccionTabla)
		eliminar.bindEnabled(seleccionTabla)
	}

	abstract def void EditarSeleccion()

}
