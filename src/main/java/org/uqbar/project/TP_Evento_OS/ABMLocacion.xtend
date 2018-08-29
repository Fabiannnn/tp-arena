package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import eventos.Locacion
import org.uqbar.arena.aop.windows.TransactionalDialog

class ABMLocacion  extends TransactionalDialog<GestionDeLocacionesModel>{
	
	new(WindowOwner owner, GestionDeLocacionesModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
}