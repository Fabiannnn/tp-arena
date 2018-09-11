package runnable

import bootstrapUI.BootstrapUI
import org.uqbar.arena.Application
import modelo.DashboardModel
import view.DashboardView

class EventOSApp extends Application {

	new(BootstrapUI bootstrapUI) {
		super(bootstrapUI)
	}

	def static void main(String[] args) {
		new EventOSApp(new BootstrapUI).start
	}

	override protected createMainWindow() {

		new DashboardView(this, new DashboardModel)
	}

}
