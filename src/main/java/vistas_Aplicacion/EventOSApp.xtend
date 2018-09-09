package vistas_Aplicacion

import datosPrueba.DatosPruebaBootstrap
import org.uqbar.arena.Application
import modelos.DashboardModel

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
