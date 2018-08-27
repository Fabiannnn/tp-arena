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
		
		minHeight = 500

		mainPanel.layout = new ColumnLayout(2)

		val Panel PanelIzquierdo = new Panel(mainPanel)
	
		crearTablaGestionLocaciones(PanelIzquierdo)
		
		val Panel PanelDerecho = new Panel(mainPanel)
				PanelDerecho.width = 200
		crearBotoneraGestionLocaciones(PanelDerecho)

	}

	def crearBotoneraGestionLocaciones(Panel panel) {
		 // esto hay que refactorizarlo
		 minWidth = 200
		new Button(panel) => [
			caption = "Editar"
			setWidth = 150
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(panel) => [
			caption = "Eliminar"
			setWidth = 150
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(panel) => [
			caption = "Nueva Locacion"
			setWidth = 150
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 10
		// onClick [|new GestionDeLocaciones(owner, new GestionDeLocacionesModel()).open]
		]
	}

	def crearTablaGestionLocaciones(Panel panel) {
		minWidth = 300
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
