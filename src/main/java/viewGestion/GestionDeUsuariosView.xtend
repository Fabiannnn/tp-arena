package viewGestion

import eventos.Usuario
import modelo.GestionUsuarioModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import eventos.Entidad
import org.uqbar.commons.model.utils.ObservableUtils
import viewABM.ABMUsuarioView

class GestionDeUsuariosView extends GestionGeneralView<Usuario> {

	new(WindowOwner owner, GestionUsuarioModel model) {
		super(owner, model)
		title = "EventOS - Gestion de Usuarios"
	}

	override addFormPanel(Panel panel) {}

	override protected crearTablaGestion(Panel panel) {
		this.describeResultadosGrid(
			new Table<Usuario>(panel, typeof(Usuario)) => [
				numberVisibleRows = 7
				items <=> "elementosDelRepo"
				value <=> "entidadSeleccionada"
			]
		)
	}

	def protected describeResultadosGrid(Table<Usuario> table) {
//		crearColumna(table, "Id", "id")
		crearColumna(table, "Username", "nombreUsuario", 100)
		crearColumna(table, "Nombre", "nombreApellido", 100)
		crearColumna(table, "Mail", "email", 100)
		crearColumna(table, "Fecha Nac", "fechaNacimiento", 100)
	}

	override void crearBotoneraGestion(Panel panel) {

		super.crearBotoneraGestion(panel)

		new Button(panel) => [
			caption = "Agregar"
			setWidth = 100
			onClick([|this.crearUsuario])
		]

		new Button(panel) => [
			caption = "Update Masivo"
			setWidth = 100
			onClick [|modelObject.getActualizar()]
		]

	}

	def crearUsuario() {
		val usuario = new Usuario
		new ABMUsuarioView(this, usuario) => [
			onAccept[this.modelObject.crearElemento(usuario)]
			open
		]
	}

	override EditarSeleccion() {
		new ABMUsuarioView(this, modelObject.entidadSeleccionada as Usuario) => [
			onAccept[this.modelObject.getEditar()]
			open
		]
//		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "id")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "nombreUsuario")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "nombreApellido")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "email")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "fechaNacimiento")
	}

	def actualizarPropiedadEnVista(Entidad entidad, String propiedad) {
		ObservableUtils.firePropertyChanged(entidad, propiedad)
	}
	
}
