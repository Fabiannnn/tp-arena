package viewGestion

import eventos.Usuario
import modelo.GestionUsuarioModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import view.DashboardView
import viewABM.ABMUsuarioView

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.utils.ObservableUtils
import eventos.Entidad
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class GestionDeUsuariosView extends GestionGeneralView<Usuario> {

	new(WindowOwner owner, GestionUsuarioModel model, DashboardView dashboard) {
		super(owner, model, dashboard)
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
			onClick [|modelObject.getActualizar(); super.ventanaMadre.actualizarTablas()]
		]
	}

	def crearUsuario() {
		val usuario = new Usuario
		new ABMUsuarioView(this, usuario, ventanaMadre) => [
			onAccept[this.modelObject.crearElemento(usuario); super.ventanaMadre.actualizarTablas()]
			open
		]
	}

	override EditarSeleccion() {
		new ABMUsuarioView(this, modelObject.entidadSeleccionada as Usuario, ventanaMadre) => [
			onAccept[this.modelObject.getEditar()]
			open
		]
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "nombreUsuario")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "nombreApellido")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "email")
		actualizarPropiedadEnVista(modelObject.entidadSeleccionada, "fechaNacimiento")
	}

	def actualizarPropiedadEnVista(Entidad entidad, String propiedad) {
		ObservableUtils.firePropertyChanged(entidad, propiedad)
	}

}
