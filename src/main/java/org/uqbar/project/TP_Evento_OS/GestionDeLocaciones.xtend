package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GestionDeLocaciones	extends SimpleWindow<GestionDeLocacionesModel > {
	new(WindowOwner owner, GestionDeLocacionesModel model) {

		super(owner, model)
		title = "Evento OS - ABM Locaciones"

	}
	
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}