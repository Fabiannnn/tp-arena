package org.uqbar.project.TP_Evento_OS

import View.LabeledTextBox
import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio

abstract class ABM_View extends TransactionalDialog<Entidad> { //abstract 
	new(WindowOwner owner, Entidad model) {
		super(owner, model)
	}

	override createMainTemplate(Panel mainPanel) {
		crearPanelEntidad(mainPanel)
		val Panel PanelInferior = new Panel(mainPanel)
		PanelInferior.layout = new ColumnLayout(2)

		new Button(PanelInferior) => [
			caption = "Aceptar"
			width = 100
			onClick [|this.accept]
			setAsDefault
			disableOnError
		]
		new Button(PanelInferior) => [
			caption = "Cancelar"
			width = 100
			onClick [|this.cancel]
		]
	}

	abstract def void crearPanelEntidad(Panel panel)

}

class ABM_Locacion_View extends ABM_View {

	new(WindowOwner owner, Locacion model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
	}

	override crearPanelEntidad(Panel panelEntidad) {
		var locacionesEditPanel = new Panel(panelEntidad)
		new LabeledTextBox(locacionesEditPanel).setText("Nombre:").bindValueToProperty("nombre")
		new LabeledTextBox(locacionesEditPanel).setText("Superficie:").bindValueToProperty("superficie")
		new LabeledTextBox(locacionesEditPanel).setText("Coordenada x").bindValueToProperty("punto.x")
		new LabeledTextBox(locacionesEditPanel).setText("Coordenada y").bindValueToProperty("punto.y")
	}

//	def setLocacionSeleccionada(Locacion seleccion) {
//		locacionSeleccionada = seleccion
//	}

}

class ABM_Usuario_View extends ABM_View {

	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
	}

	override crearPanelEntidad(Panel panelEntidad) {
		var usuarioEditPanel = new Panel(panelEntidad)
		new LabeledTextBox(usuarioEditPanel).setText("UserName").bindValueToProperty("nombreUsuario")
		new LabeledTextBox(usuarioEditPanel).setText("Nombre:").bindValueToProperty("nombreApellido")
		new LabeledTextBox(usuarioEditPanel).setText("mail:").bindValueToProperty("email")
		new LabeledTextBox(usuarioEditPanel).setText("Tipo de Usuario:").bindValueToProperty("tipoDeUsuario")
		new LabeledTextBox(usuarioEditPanel).setText("Fecha de Nacimiento:").bindValueToProperty("fechaNacimiento")

	}

}

class ABM_Servicio_View extends ABM_View {

	new(WindowOwner owner, Servicio model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
	}

	override crearPanelEntidad(Panel panelEntidad) {
		var serviciosEditPanel = new Panel(panelEntidad)
		serviciosEditPanel.layout = new ColumnLayout(2)
		new LabeledTextBox(serviciosEditPanel).setText("Nombre:").bindValueToProperty("nombre")
		new LabeledTextBox(serviciosEditPanel).setText("Tipo de Servicio:").bindValueToProperty("tipoDeServicio")
		new LabeledTextBox(serviciosEditPanel).setText("Tipo de Tarifa:").bindValueToProperty("tipoDeTarifa")
		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("costoFijo")
		new LabeledTextBox(serviciosEditPanel).setText("Costo Minimo:").bindValueToProperty("costoMinimo")
		new LabeledTextBox(serviciosEditPanel).setText("Costo Por Hora:").bindValueToProperty("costoPorHora")
		new LabeledTextBox(serviciosEditPanel).setText("% Costo Minimo:").bindValueToProperty("porcentajeCostoMinimo")
		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("costoPorPersona")
		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("costoPorKm")
		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("ubicacion")
	}

}
