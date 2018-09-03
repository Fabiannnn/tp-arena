package org.uqbar.project.TP_Evento_OS

import eventos.Evento
import eventos.Locacion
import eventos.Usuario
import java.time.LocalDateTime
import java.time.Period
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import repositorio.RepositorioLocaciones
import repositorio.RepositorioServicios
import repositorio.RepositorioUsuarios
import servicios.Servicio

@Accessors
@Observable
class DashboardModel {

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

		repoUsuarios.elementos.fold(0.0)[acum, user|acum + eventosOrganizadosExitosos(user)]
	}

	def eventosOrganizadosExitosos(Usuario usuario) {

		usuario.eventosOrganizados.filter[evento|evento.esExitoso()].size
	}

	def getEventosFracasados() {
		repoUsuarios.elementos.fold(0.0)[acum, user|acum + eventosOrganizadosFracasos(user)]
	}

	def eventosOrganizadosFracasos(Usuario usuario) {
		usuario.eventosOrganizados.filter[evento|evento.esUnFracaso()].size()
	}

	def getEntradasVendidas() {
		repoUsuarios.elementos.fold(0.0)[acum, elemento|acum + elemento.entradaComprada.size()]
	}

	def getInvitacionesEnviadas() {

		repoUsuarios.elementos.fold(0.0)[acum, elemento|acum + elemento.invitaciones.size()]

	}

	def getLocacionesPopulares() { // modelar comportamiento TODO HECHO  NO anda el sublist 5 sera por que no hay 5 locaciones
		if (getRepoLocaciones.elementos.size > 5) {
			(getRepoLocaciones.elementos.sortBy[elem|locacionesPopulares(elem)]).subList(0, 5)
		} else {
			(getRepoLocaciones.elementos.sortBy[elem|locacionesPopulares(elem)])
		}
	}

	def int locacionesPopulares(Locacion elem) {
		getRepoUsuarios.eventosPorLocacionTotal(elem)
	}

	def getUsuariosActivos() { // modelar comportamiento
		getRepoUsuarios.elementos
	}

	def getServiciosNuevos() { // modelar comportamiento TODO hecho
		if (getRepoLocaciones.elementos.size > 5) {
		(getRepoServicios.elementos.sortBy[id].reverse).subList(0, 5) }else {
			(getRepoServicios.elementos.sortBy[id].reverse)
		}

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

	def getElementosRepoLocaciones() {
		getRepoLocaciones
	}
}
