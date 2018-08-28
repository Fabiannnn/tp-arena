package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import repositorio.RepositorioLocaciones
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.HorizontalLayout

@Accessors
abstract class GestionGeneral extends Dialog<GestionDeLocacionesModel> {

	new(WindowOwner owner, GestionDeLocacionesModel model) {

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
		crearBotoneraGestionLocaciones(PanelDerecho)

	}

	abstract def void addFormPanel(Panel panel)

	def protected crearTablaGestion(Panel panel) {}

	def crearBotoneraGestionLocaciones(Panel panel) {
		var actionsPanel = new Panel(panel)
		actionsPanel.layout = new VerticalLayout

		new Button(actionsPanel) => [
			caption = "Editar"
			setWidth = 150
		// onClick [|this.openDialog(ABMLocacion.editarLocacion(model.LocacionSeleccionada))]
		]
		new Button(actionsPanel) => [
			caption = "Eliminar"
			setWidth = 150
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(actionsPanel) => [
			caption = "Nueva Locacion"
			setWidth = 150
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(actionsPanel) => [
			caption = "Update Masivo"
			setWidth = 10
	//		onClick [|new GestionDeLocacionesModel().actualizar]
		]
	}

}

class GestionDeLocaciones extends GestionGeneral {

	new(WindowOwner owner, GestionDeLocacionesModel model) {
		super(owner, model)
		title = "Evento OS - Gestion Locaciones"
	}

	override protected crearTablaGestion(Panel panel) {
		minWidth = 300
		this.describeResultadosGrid(
			new Table<RepositorioLocaciones>(panel, RepositorioLocaciones) => [
				numberVisibleRows = 10
				items <=> "repoLocaciones.elementos"
			// value<=>"locacionSeleccionada"
			]
		)
	}

	def describeResultadosGrid(Table<RepositorioLocaciones> table) {
//		new Column<RepositorioLocaciones>(table)=>[
////			title = "Nombre"
////			fixedSize=250
////			bindContentsToProperty("repoLocaciones.elementos.nombre")
//		]
	}

	override addFormPanel(Panel panel) {
	}

}
