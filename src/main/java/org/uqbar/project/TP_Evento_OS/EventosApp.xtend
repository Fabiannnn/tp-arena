package org.uqbar.project.TP_Evento_OS

import org.uqbar.arena.Application
import datosPrueba.DatosPruebaBootstrap

class EventosApp  extends Application{
	
	new(DatosPruebaBootstrap bootstrap){
		super(bootstrap)
	}
	
		def static void main(String[] args) {
		new EventosApp(new DatosPruebaBootstrap).start
	}
	
	
	override protected createMainWindow() {
	
		new DashboardView2(this, new DashboardModel)		
	}
	

}

