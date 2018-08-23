package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.Application

class EventosApp  extends Application{
	override protected createMainWindow() {
		new DashboardView(this)		
	}
	
	def static void main(String[] args) {
		new EventosApp().start
	}
	
}