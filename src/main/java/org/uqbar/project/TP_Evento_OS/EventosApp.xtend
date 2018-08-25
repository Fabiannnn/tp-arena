package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.Application

class EventosApp  extends Application{
	override protected createMainWindow() {
		new DashboardView2(this)		
	}
	
	def static void main(String[] args) {
		new EventosApp().start
	}
	
}