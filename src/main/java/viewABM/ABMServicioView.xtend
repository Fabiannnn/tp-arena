package viewABM

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import servicios.TipoDeServicio
import servicios.TipoDeTarifa
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
class ABMServicioView extends ABMView<Servicio> {

	override titulo() {
		"EventOS - Creación de Servicios"
	}

	new(WindowOwner owner, Servicio model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {

		new Label(panelEntidad) => [setText = "Nombre:"]
		crearTextBox(panelEntidad, "descripcion")

		new Label(panelEntidad) => [setText = "Tipo de Servicio:"]
		new Selector(panelEntidad) => [
			(items <=> "tiposDeServicios").adapter = new PropertyAdapter(TipoDeServicio, "tipoServicio")
			value <=> "tipoDeServicio"
		]

		new Label(panelEntidad) => [setText = "Tipo de Tarifa:"]
		new Selector(panelEntidad) => [
			allowNull(false)
			(items <=> "tiposDeTarifas").adapter = new PropertyAdapter(TipoDeTarifa, "tipoTarifa")
			value <=> "tipoDeTarifa"
			width = 200
		]

		new Label(panelEntidad) => [setText = "Costo Fijo:"]
		crearNumericField(panelEntidad, "costoFijo")

		new Label(panelEntidad) => [setText = "Costo Mínimo:"]
		crearNumericField(panelEntidad, "costoMinimo")

		new Label(panelEntidad) => [setText = "Costo Por Hora:"]
		crearNumericField(panelEntidad, "costoPorHora")

		new Label(panelEntidad) => [setText = "% Costo Minimo:"]
		crearNumericField(panelEntidad, "porcentajeCostoMinimo")

		new Label(panelEntidad) => [setText = "Costo Fijo Persona:"]
		crearNumericField(panelEntidad, "costoPorPersona")

		new Label(panelEntidad) => [setText = "Costo Fijo Km:"]
		crearNumericField(panelEntidad, "costoPorKm")

		new Label(panelEntidad) => [setText = "Coordenadas y:"]
		crearNumericField(panelEntidad, "ubicacion.y")

		new Label(panelEntidad) => [setText = "Coordenadas x:"]
		crearNumericField(panelEntidad, "ubicacion.x")
		
	}
	
}