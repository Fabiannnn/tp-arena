package org.uqbar.project.TP_Evento_OS

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.Dependencies
import eventos.Locacion
import repositorio.RepositorioLocaciones
import datosPrueba.DatosPruebaBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext

@Accessors
@Observable
class DashboardModel {
	int cantEventos =5

def getEventosTotales(){
	repoLocaciones.elementos.size()
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
def getRepoLocaciones() {
		ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
	}
}