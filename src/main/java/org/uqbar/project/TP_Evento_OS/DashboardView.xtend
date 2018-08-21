package org.uqbar.project.TP_Evento_OS
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Panel
import eventos.Usuario

class DashboardView extends MainWindow<DashboardModel> {
	new() {
		super(new DashboardModel)
	}

	override createContents(Panel mainPanel) {
		

	}

	def static main(String[] args) {
		new DashboardView().startApplication
	}
	

	
}