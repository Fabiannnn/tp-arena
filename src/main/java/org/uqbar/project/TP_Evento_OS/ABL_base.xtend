package org.uqbar.project.TP_Evento_OS

import View.LabeledTextBox
import eventos.Locacion
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class ABL_base extends TransactionalDialog<ABMLocacion> { //abstract 
	new(WindowOwner owner, ABMLocacion model) {
		super(owner, model)
	}

	override createMainTemplate(Panel mainPanel) {

		crearPanelEntidad(mainPanel)

		val Panel PanelInferior = new Panel(mainPanel)
		PanelInferior.layout = new ColumnLayout(2)

		new Button(PanelInferior) => [
			caption = "Aceptar"
			width = 100
		// onClick [ | new GestionDeUsuariosView(owner, new GestionGeneralModel()).open] 
		]
		new Button(PanelInferior) => [
			caption = "Cancelar"
			width = 100
		// onClick [ | new GestionDeUsuariosView(owner, new GestionGeneralModel()).open] 
		]
	}

	def crearPanelEntidad(Panel panelEntidad) {
	}

	override protected createFormPanel(Panel mainPanel) {
	}

}

class ABL_Locacion extends ABL_base {
	Locacion locacionSeleccionada

	new(WindowOwner owner, ABMLocacion model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {
		var locacionesEditPanel = new Panel(panelEntidad)
		// new LabeledTextBox(panel,"Nombre", "nombre",14)
		new LabeledTextBox(locacionesEditPanel).setText("Nombre:").bindValueToProperty("nombreModelo")
	}

	def setLocacionSeleccionada(Locacion seleccion) {
		locacionSeleccionada = seleccion
	}
}
