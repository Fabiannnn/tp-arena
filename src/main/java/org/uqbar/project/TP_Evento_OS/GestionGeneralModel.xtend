package org.uqbar.project.TP_Evento_OS

import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import repositorio.Repositorio
import repositorio.RepositorioLocaciones
import repositorio.RepositorioServicios
import repositorio.RepositorioUsuarios
import servicios.Servicio
import org.uqbar.commons.model.IModel
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.commons.model.annotations.Dependencies
import javax.swing.text.DateFormatter
import java.time.format.DateTimeFormatter
import servicios.TipoDeTarifa
import servicios.TarifaFija

@Accessors
@Observable
class GestionGeneralModel {
//	String jsonText
//	JsonLocacion jsonLocacion
	Entidad entidadSeleccionada

	def getEliminarSeleccion() {
		this.getEliminarSeleccionDelRepositorio(entidadSeleccionada)
	}

	def dispatch getEliminarSeleccionDelRepositorio(Locacion seleccion) {
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as Repositorio<Locacion>
		RepoLocaciones.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "locacionesDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Usuario seleccion) {
		val RepoUsuarios = ApplicationContext.instance.getSingleton(typeof(Usuario)) as Repositorio<Usuario>
		RepoUsuarios.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "usuariosDelRepo")
	}

	def dispatch getEliminarSeleccionDelRepositorio(Servicio seleccion) {
		val RepoServicios = ApplicationContext.instance.getSingleton(typeof(Servicio)) as Repositorio<Servicio>
		RepoServicios.delete(seleccion)
		ObservableUtils.firePropertyChanged(this, "serviciosDelRepo")
	}

	def getLocacionesDelRepo() {
		getRepoLocaciones.elementos
	}

	def getUsuariosDelRepo() {
		getRepoUsuarios.elementos
	}

	def getServiciosDelRepo() {
		getRepoServicios.elementos
	}

	def getRepoLocaciones() {
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	def getRepoUsuarios() {
		ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepositorioUsuarios
	}

	def getRepoServicios() {
		ApplicationContext.instance.getSingleton(typeof(Servicio)) as RepositorioServicios
	}

	def getActualizar() { // TODO falta Modelar
	}

//def dispatch editarSeleccion(Locacion Seleccion){
//	new ABL_Locacion(owner, new ABMLocacion()).open
//	ABL_Locacion.setLocacionSeleccionada()
//}
//
//def dispatch editarSeleccion(Usuario Seleccion){
//	new ABL_Locacion(owner, new ABMLocacion()).open
//	//ABL_Locacion.setLocacionSeleccionada()
//}	
	def setLocacionSeleccionada(ABL_Locacion locacion, Locacion locacion2) {
	}

//@Dependencies("TipoDeUsuario")
//def getEsTipoDeUsuario(Usuario unUsuario){
//	return unUsuario.tipoDeUsuario
//}
def  getnCostoServicio(Servicio servicio){
	if (servicio.tipoDeTarifa instanceof TarifaFija){ (servicio.costoFijo +" TF "+ servicio.costoMinimo)
}
else {(servicio.costoPorHora+" TPH "+ servicio.costoMinimo) }


}
}
//	def getActualizar() {
//		jsonLocacion.deserializarJson('''[
//		   {
//		      "x":-34.603759,
//		      "y":-58.381586,
//		      "nombre":"Salón El Abierto"
//		   },
//		   {
//		      "x":-44.603759,
//		      "y":-68.381586,
//		      "nombre":"Estadio Obras"
//		   }
//		]''', repoLocaciones)
//
//	}
//	jsonText =  '''[
//		   {
//		      "x":-44.603759,
//		      "y":-68.31586,
//		      "nombre":"Salón El Abierto"
//		   },
//		   {
//		      "x":-44.689759,
//		      "y":-68.381586,
//		      "nombre":"mi Salón"
//		   };
//		   {
//		      "x":-34.603759,
//		      "y":-58.381586,
//		      "nombre":"Salón M&M"
//		   },
//		   {
//		      "x":-44.603759,
//		      "y":-28.381586,
//		      "nombre":"Estadio Obras"
//		   },
//		   {
//		      "x":-34.603759,
//		      "y":-58.381586,
//		      "nombre":"Salón El Abierto"
//		   },
//		   {
//		      "x":-34.572224,
//		      "y":-58.535651,
//		      "nombre":"Estadio Obras2"
//		   },
//		   {
//		      "x":-84.603759,
//		      "y":-88.388986,
//		      "nombre":"Salón El Abierto Otro Lugar"
//		   },
//		   {
//		      "x":-34.572224,
//		      "y":-58.535651,
//		      "nombre":"Estadio Obras Modificado"
//		   }
//		]'''
