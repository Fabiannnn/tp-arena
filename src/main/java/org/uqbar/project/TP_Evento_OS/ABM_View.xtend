package org.uqbar.project.TP_Evento_OS

import View.LabeledTextBox
import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import org.uqbar.arena.widgets.NumericField
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import org.uqbar.geodds.Point
import transformer.LocalDateTransformer
import View.LabeledSelector
import org.uqbar.arena.widgets.Selector
import eventos.TipoDeUsuario

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

//	Point unPunto
	override crearPanelEntidad(Panel panelEntidad) {

		var locacionesEditPanel = new Panel(panelEntidad)

		new Label(locacionesEditPanel).setText("Nombre:")

		new TextBox(locacionesEditPanel) => [
			value <=> "nombre"
			width = 120
		]

		new Label(locacionesEditPanel).text = "Superficie:"
		new NumericField(locacionesEditPanel) => [
			value <=> "superficie"
			width = 20
		]
		new Label(locacionesEditPanel).text = "Coordenada x::"
		new NumericField(locacionesEditPanel) => [
			value <=> "punto.x"
			width = 20
		]
		new Label(locacionesEditPanel).text = "Coordenada y:"
		new NumericField(locacionesEditPanel) => [
			value <=> "punto.y"
			width = 20
		]

//		 new LabeledTextBox(locacionesEditPanel).setText("Superficie:").bindValueToProperty("superficie")
//		new LabeledTextBox(locacionesEditPanel).setText("Coordenada x").bindValueToProperty("punto.x")
//		new LabeledTextBox(locacionesEditPanel).setText("Coordenada y").bindValueToProperty("punto.y")
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
		new Label(usuarioEditPanel).text = "UserName:"

		new TextBox(usuarioEditPanel) => [
			value <=> "nombreUsuario"
			width = 120
		]
		new Label(usuarioEditPanel).text = "Nombre:"
		new TextBox(usuarioEditPanel) => [
			value <=> "nombreApellido"
			width = 120
		]
		new Label(usuarioEditPanel).text = "mail:"
		new TextBox(usuarioEditPanel) => [
			value <=> "email"
			width = 120
		]
		new Label(usuarioEditPanel).text = "Tipo De Usuario:"//TODO anulado tipo de usuario
		new Selector(usuarioEditPanel) => [
//			(items <=> ("tiposDeUsuarios"))
//			value <=> ("tipoDeUsuario")
		]

//		new Label(usuarioEditPanel).text = "Tipo de Usuario:"
//		new TextBox(usuarioEditPanel) => [
//			value <=> "tiposDeUsuarios"
//			width = 120
//		]

		new Label(usuarioEditPanel).text = "Fecha de Nacimiento:"
		new TextBox(usuarioEditPanel) => [
			(value <=> "fechaNacimiento").transformer = new LocalDateTransformer
			width = 20
		]

//		new LabeledTextBox(usuarioEditPanel).setText("UserName").bindValueToProperty("nombreUsuario")
//		new LabeledTextBox(usuarioEditPanel).setText("Nombre:").bindValueToProperty("nombreApellido")
//		new LabeledTextBox(usuarioEditPanel).setText("mail:").bindValueToProperty("email")
//		new LabeledTextBox(usuarioEditPanel).setText("Tipo de Usuario:").bindValueToProperty("tipoDeUsuario")
//		new LabeledTextBox(usuarioEditPanel).setText("Fecha de Nacimiento:").bindValueToProperty("fechaNacimiento")
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
		new LabeledTextBox(serviciosEditPanel).setText("Nombre:").bindValueToProperty("descripcion")
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
