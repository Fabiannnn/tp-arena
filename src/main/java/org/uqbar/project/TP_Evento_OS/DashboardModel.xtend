package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
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
@Observable
class DashboardModel {

	int cantEventos = 5

	def getEventosTotales() {
		repoUsuarios.elementos.fold(0.0)[acum, user|acum + user.eventosOrganizados.size()]
	}

	def getEventosUltimoMes() {
		repoUsuarios.elementos.fold(0.0)[acum, user|acum + eventosOrganizadosUltimoMes(user)]
	}

	def eventosOrganizadosUltimoMes(Usuario usuario) {
		usuario.eventosOrganizados.filter[evento|fechaInicioUltimoMes(evento)].size
	}

	def fechaInicioUltimoMes(Evento evento) {
		(evento.fechaDeInicio > LocalDateTime.now().plus(Period.ofDays(-30))) && (evento.fechaDeInicio <
			LocalDateTime.now)
	}

	def getEventosExitosos() {
		17
	}

	def getEventosFracasados() {
		18
	}

	def getEntradasVendidas() {
		repoUsuarios.elementos.fold(0.0)[acum, elemento|acum + elemento.entradaComprada.size()]
	}

	def getInvitacionesEnviadas() {

		repoUsuarios.elementos.fold(0.0)[acum, elemento|acum + elemento.invitaciones.size()]

	}

	def getRepositorioLocaciones() {
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}

	def getRepoUsuarios() {
		ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepositorioUsuarios
	}

	def getRepoServicios() {
		ApplicationContext.instance.getSingleton(typeof(Servicio)) as RepositorioServicios
	}
}
