package org.uqbar.project.TP_Evento_OS

import datosPrueba.DatosPruebaBootstrap
import org.uqbar.arena.Application

class EventOSApp extends Application {

	new(DatosPruebaBootstrap bootstrap) {
		super(bootstrap)

	}

	def static void main(String[] args) {
		new EventOSApp(new DatosPruebaBootstrap).start
	}

	override protected createMainWindow() {

		new DashboardView(this, new DashboardModel)
	}

}
