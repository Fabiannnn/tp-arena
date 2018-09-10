package viewABM

import eventos.Entidad
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

abstract class ABMView<T extends Entidad> extends TransactionalDialog<T> {
	new(WindowOwner owner, T model) {
		super(owner, model)
	}

	def titulo() {
		"EventOS - Creación"
	}

	override ErrorsPanel createErrorsPanel(Panel mainPanel) { return new ErrorsPanel(mainPanel, "Panel de error", 1) }

	override createMainTemplate(Panel mainPanel) {

		mainPanel.layout = new ColumnLayout(2)
		this.title = titulo
		crearPanelEntidad(mainPanel)

		val Panel panelBotones = new Panel(mainPanel)
		panelBotones.layout = new HorizontalLayout

		new Button(panelBotones) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError
		]
		new Button(panelBotones) => [
			caption = "Cancelar"
			onClick [|this.cancel]
			setAsDefault

		]
	}

	override protected createFormPanel(Panel mainPanel) {}

	abstract def void crearPanelEntidad(Panel panel)

	def crearNumericField(Panel panel, String propiedad) {
		this.crearNumericField(panel, propiedad, 100)
	}

	def crearNumericField(Panel panel, String propiedad, int ancho) {
		new NumericField(panel) => [
			value <=> propiedad
			width = ancho
		]
	}

	def crearTextBox(Panel panel, String propiedad) {
		new TextBox(panel) => [
			value <=> propiedad
			width = 200
		]
		
	}
	
}
