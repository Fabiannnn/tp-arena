package viewABM

import eventos.Locacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

@Accessors
class ABMLocacionView extends ABMView<Locacion> {

	override titulo() {
		"EventOS - Creación de Locaciones"
	}

	new(WindowOwner owner, Locacion model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {

		new Label(panelEntidad) => [setText = "Nombre:"]
		crearTextBox(panelEntidad, "nombre")

		new Label(panelEntidad) => [setText = "Superficie:"]
		crearNumericField(panelEntidad, "superficie")

		new Label(panelEntidad) => [setText = "Coordenada x:"]
		crearNumericField(panelEntidad, "punto.x")

		new Label(panelEntidad) => [setText = "Coordenada y:"]
		crearNumericField(panelEntidad, "punto.y")
		
	}
	
}
