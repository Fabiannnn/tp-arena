package viewABM

import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import view.DashboardView

@Accessors
class ABMLocacionView extends ABMView<Locacion> {

	override titulo() {
		"EventOS - Creación de Locaciones"
	}

	new(WindowOwner owner, Locacion model, DashboardView dashboard) {
		super(owner, model, dashboard)
	}

	override createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form) => [setText = "Nombre:"]
		crearTextBox(form, "nombre")

		new Label(form) => [setText = "Superficie:"]
		crearNumericField(form, "superficie")

		new Label(form) => [setText = "Coordenada x:"]
		crearNumericField(form, "puntoX")

		new Label(form) => [setText = "Coordenada y:"]
		crearNumericField(form, "puntoY")

	}

}
