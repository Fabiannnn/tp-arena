package viewABM

import eventos.TipoDeUsuario
import eventos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import transformer.LocalDateTransformer
import view.DashboardView

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
class ABMUsuarioView extends ABMView<Usuario> {

	override titulo() {
		"EventOS - Creación de Usuarios"
	}

	new(WindowOwner owner, Usuario model, DashboardView dashboard) {
		super(owner, model, dashboard)
	}

	override createFormPanel(Panel mainPanel) {

		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form) => [setText = "Username:"]
		crearTextBox(form, "nombreUsuario")

		new Label(form) => [setText = "Nombre:"]
		crearTextBox(form, "nombreApellido")

		new Label(form) => [setText = "Mail:"]
		crearTextBox(form, "email")

		new Label(form) => [setText = "Tipo de Usuario:"]
		new Selector(form) => [
			(items <=> ("tiposDeUsuarios")).adapter = new PropertyAdapter(TipoDeUsuario, "nom")
			value <=> ("tipoDeUsuario")
		]

		new Label(form) => [setText = "Fecha de Nacimiento:"]
		new TextBox(form) => [
			(value <=> "fechaNacimiento").transformer = new LocalDateTransformer
			width = 150
		]

		new Label(form) => [setText = "Coordenada x:"]
		crearNumericField(form, "puntoX")

		new Label(form) => [setText = "Coordenada y:"]
		crearNumericField(form, "puntoY")

	}

}
