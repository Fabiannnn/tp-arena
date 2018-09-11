package viewABM

import eventos.Entidad
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.WindowOwner
import view.DashboardView

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

abstract class ABMView<T extends Entidad> extends TransactionalDialog<T> {
	DashboardView ventanaMadre

	new(WindowOwner owner, T model, DashboardView dashboard) {
		super(owner, model)
		ventanaMadre = dashboard
	}

	def titulo() { "EventOS - Creación" }

	override ErrorsPanel createErrorsPanel(Panel mainPanel) { new ErrorsPanel(mainPanel, "Panel de error", 1) }

	override void addActions(Panel actions) {

		/* SI PONEMOS LOS BOTONES EN EL ORDEN CORRECTO CANCELAR NO APARECE
		 * SUCEDE LO MISMO EN EL EJEMPLO DE CELULARES
		 * LA UNICA FORMA DE PONERLOS EN EL ORDEN CORRECTO ES DESHABILITAR 
		 * setAsDefault
		 * disableOnError
		 * DE ESA FORMA NO PODEMOS EVITAR QUE BLOQUEE EL ACEPTAR
		 * SI LA FECHA NO ES VALIDA
		 */
		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
		]
		
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept; this.ventanaMadre.actualizarTablas()]
			setAsDefault
			disableOnError
		]

	}

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
