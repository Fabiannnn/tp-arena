package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.Dependencies
import eventos.Locacion

@Accessors
@Observable
class DashboardModel {
	int cantEventos =5
	Locacion locacion = new Locacion()
def getEventosTotales(){
	15
}
def getEventosUltimoMes(){
	16
}
def getEventosExitosos(){
	17
}
def getEventosFracasados(){
	18
}
def getEntradasVendidas(){
	19
}
def getInvitacionesEnviadas(){
	20
}
}