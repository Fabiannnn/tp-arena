package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.Dependencies


@Accessors
@Observable
class DashboardModel {
	int cantEventos =5
	def getCantidadEventos(){
		cantEventos
	}
}