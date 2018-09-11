package viewABM

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import servicios.TipoDeServicio
import servicios.TipoDeTarifa
import view.DashboardView

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
class ABMServicioView extends ABMView<Servicio> {

	override titulo() {
		"EventOS - Creación de Servicios"
	}

	new(WindowOwner owner, Servicio model, DashboardView dashboard) {
		super(owner, model, dashboard)
	}

	override createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form) => [setText = "Nombre:"]
		crearTextBox(form, "descripcion")

		new Label(form) => [setText = "Tipo de Servicio:"]
		new Selector(form) => [
			(items <=> "tiposDeServicios").adapter = new PropertyAdapter(TipoDeServicio, "tipoServicio")
			value <=> "tipoDeServicio"
		]

		new Label(form) => [setText = "Tipo de Tarifa:"]
		new Selector(form) => [
			allowNull(false)
			(items <=> "tiposDeTarifas").adapter = new PropertyAdapter(TipoDeTarifa, "tipoTarifa")
			value <=> "tipoDeTarifa"
			width = 200
		]

		new Label(form) => [setText = "Costo Fijo:"]
		crearNumericField(form, "costoFijo")

		new Label(form) => [setText = "Costo Mínimo:"]
		crearNumericField(form, "costoMinimo")

		new Label(form) => [setText = "Costo Por Hora:"]
		crearNumericField(form, "costoPorHora")

		new Label(form) => [setText = "% Costo Minimo:"]
		crearNumericField(form, "porcentajeCostoMinimo")

		new Label(form) => [setText = "Costo Fijo Persona:"]
		crearNumericField(form, "costoPorPersona")

		new Label(form) => [setText = "Costo Fijo Km:"]
		crearNumericField(form, "costoPorKm")

		new Label(form) => [setText = "Coordenadas y:"]
		crearNumericField(form, "puntoY")

		new Label(form) => [setText = "Coordenadas x:"]
		crearNumericField(form, "puntoX")

	}

}
