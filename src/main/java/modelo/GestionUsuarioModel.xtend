package modelo

import jsonUI.JsonUsuarioUI
import eventos.Usuario
import jsons.JsonUsuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class GestionUsuarioModel extends GestionGeneralModel<Usuario> {

	override getActualizar() {
		var datosAct = new JsonUsuarioUI
		var jsonUsuario = new JsonUsuario
		jsonUsuario.deserializarJson(datosAct.actualizarJsonUsuario, getRepo)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	override tipoRepo() {
		typeof(Usuario)
	}

}
