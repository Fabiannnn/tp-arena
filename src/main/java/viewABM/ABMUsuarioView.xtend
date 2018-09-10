package viewABM

import eventos.TipoDeUsuario
import eventos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import transformer.LocalDateTransformer
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
class ABMUsuarioView extends ABMView<Usuario> {

	override titulo() {
		"EventOS - Creación de Usuarios"
	}

	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {

		new Label(panelEntidad) => [setText = "Username:"]
		crearTextBox(panelEntidad, "nombreUsuario")

		new Label(panelEntidad) => [setText = "Nombre:"]
		crearTextBox(panelEntidad, "nombreApellido")

		new Label(panelEntidad) => [setText = "Mail:"]
		crearTextBox(panelEntidad, "email")

		new Label(panelEntidad) => [setText = "Tipo de Usuario:"]
		new Selector(panelEntidad) => [
			(items <=> ("tiposDeUsuarios")).adapter = new PropertyAdapter(TipoDeUsuario, "nom") // .transformer= new TipoDeUsuarioTransformer
			value <=> ("tipoDeUsuario")

		]

		new Label(panelEntidad) => [setText = "Fecha de Nacimiento:"]
		new TextBox(panelEntidad) => [
			(value <=> "fechaNacimiento").transformer = new LocalDateTransformer
			width = 150
		]

		new Label(panelEntidad) => [setText = "Coordenada x:"]
		crearNumericField(panelEntidad, "coordenadas.x")

		new Label(panelEntidad) => [setText = "Coordenada y:"]
		crearNumericField(panelEntidad, "coordenadas.y")
		
	}
	
}