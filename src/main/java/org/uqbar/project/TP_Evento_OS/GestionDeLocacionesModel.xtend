package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import eventos.Locacion
import repositorio.RepositorioLocaciones
import org.uqbar.commons.applicationContext.ApplicationContext
import eventos.Usuario
import servicios.Servicio
import repositorio.RepositorioUsuarios
import repositorio.RepositorioServicios
import repositorio.RepositorioLocaciones
import java.util.ArrayList
import java.util.Collection
import eventos.Evento
import java.time.LocalDateTime
import java.time.Period
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.project.TP_Evento_OS.DashboardModel


@Accessors
@Observable
class GestionDeLocacionesModel extends DashboardModel{
	int pruebaDiez=10
	def getGestionDeLocaciones(){
	 pruebaDiez
	}
	def getRepositorioLocacionesTamanio(){
			"problemas"
	}
	
}