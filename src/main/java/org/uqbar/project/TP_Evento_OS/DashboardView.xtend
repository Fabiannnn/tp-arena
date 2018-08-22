package org.uqbar.project.TP_Evento_OS
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Panel
import eventos.Usuario
import org.uqbar.arena.layout.HorizontalLayout

class DashboardView extends MainWindow<DashboardModel> {
	new() {
		super(new DashboardModel)
	}

	override createContents(Panel mainPanel) {
				this.title = "primer pantalla"
		mainPanel.layout = new VerticalLayout	
	val panelSuperior = new Panel(mainPanel)			
	panelSuperior.layout = new HorizontalLayout 
		new Label(panelSuperior).text = "lugar1"
		new Label(panelSuperior).text = "lugar2"
	
val panelInferior = new Panel(mainPanel)
panelInferior.layout = new HorizontalLayout 
              
		new Label(panelInferior).text = "lugar3"
		new Label(panelInferior).text ="lugar 4"
	}
		

	

	def static main(String[] args) {
		new DashboardView().startApplication
	}
	

	
}