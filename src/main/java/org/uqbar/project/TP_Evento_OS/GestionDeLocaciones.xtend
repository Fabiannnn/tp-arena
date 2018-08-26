package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.annotations.Observable

@Accessors

class GestionDeLocaciones	extends SimpleWindow<GestionDeLocacionesModel > {
	new(WindowOwner owner, GestionDeLocacionesModel model) {

		super(owner, model)
		title = "Evento OS Locaciones"

	}
	
		override protected createFormPanel(Panel mainPanel) {
	new Label(mainPanel).setText("Esto es una Prueba")
	new Label(mainPanel) => [
			value <=> "pruebaDiez"
		]
	}

	override protected addActions(Panel actionsPanel) {
	
	}
	

	
	}