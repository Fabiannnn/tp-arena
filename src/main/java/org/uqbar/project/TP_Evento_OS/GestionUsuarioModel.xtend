package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.applicationContext.ApplicationContext
import eventos.Usuario
import repositorio.RepositorioUsuarios
import org.uqbar.commons.model.utils.ObservableUtils
import Jsons.DatosActualizarUsuarios
import jsons.JsonUsuario

@Accessors
@Observable
class GestionUsuarioModel extends GestionGeneralModel<Usuario> {
	override getRepo() {
		ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepositorioUsuarios
	}

	override crearElemento(Usuario usuario) {
		getRepo.agregarElemento(usuario)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}

	override getActualizar() {
		var datosAct = new DatosActualizarUsuarios
		var jsonUsuario = new JsonUsuario
		jsonUsuario.deserializarJson(datosAct.actualizarJsonUsuario, getRepo)
		ObservableUtils.firePropertyChanged(this, "elementosDelRepo")
	}
}