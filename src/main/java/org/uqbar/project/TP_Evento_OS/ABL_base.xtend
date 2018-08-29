package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

class ABL_base extends TransactionalDialog<ABMLocacion> {
	
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
	
	def crearPanelEntidad(Panel panel) {

	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	
}