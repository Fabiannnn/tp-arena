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

@Accessors
class GestionDeLocaciones extends SimpleWindow<GestionDeLocacionesModel> {

	new(WindowOwner owner, GestionDeLocacionesModel model) {

		super(owner, model)
		title = "Evento OS Locaciones"

	}

	override protected createMainTemplate(Panel mainPanel) {

		mainPanel.layout = new ColumnLayout(2)
		val Panel PanelIzquierdo = new Panel(mainPanel)
		// PanelIzquierdo.layout = new VerticalLayout
		crearTablaGestionLocaciones(PanelIzquierdo)
		val Panel PanelDerecho = new Panel(mainPanel)
		crearBotoneraGestionLocaciones(PanelDerecho)

	}

	def crearBotoneraGestionLocaciones(Panel panel) { // esto hay que refactorizarlo
		new Button(panel) => [
			caption = "Editar"
			setWidth = 100
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(panel) => [
			caption = "Eliminar"
			setWidth = 100
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(panel) => [
			caption = "Nueva Locacion"
			setWidth = 100
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 100
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
	}

	def crearTablaGestionLocaciones(Panel panel) {
		new Label(panel).setText("Esto es una Prueba")
		new Label(panel) => [
			value <=> "pruebaDiez"
		]
		new Label(panel) => [
			value <=> "repositorioLocacionesTamanio"
		]

		new Table<RepositorioLocaciones>(panel, RepositorioLocaciones) => [
			numberVisibleRows = 10
			items <=> "repoLocaciones.elementos"
		]
	}

	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}

}
