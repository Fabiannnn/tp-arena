package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Observable
import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.model.annotations.Dependencies
import eventos.Locacion
import repositorio.RepositorioLocaciones
import datosPrueba.DatosPruebaBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import eventos.Usuario
import servicios.Servicio
import repositorio.RepositorioUsuarios
import repositorio.RepositorioServicios
import java.util.ArrayList
import java.util.Collection
import eventos.Evento
import java.time.LocalDateTime
import java.time.Period


@Accessors

class GestionDeLocacionesModel {
	int pruebaDiez=10
	def getGestionDeLocaciones(){
	 pruebaDiez
	}
	
}