package org.uqbar.project.TP_Evento_OS

import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import servicios.Servicio
import eventos.TipoDeUsuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Selector
import org.uqbar.geodds.Point
import View.LabeledSelector
import View.LabeledTextBox
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import transformer.LocalDateTransformer
import org.uqbar.arena.layout.HorizontalLayout
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import transformer.TipoDeUsuarioTransformer
import org.uqbar.arena.windows.ErrorsPanel

abstract class ABM_View extends TransactionalDialog<Entidad> { //abstract 
	new(WindowOwner owner, Entidad model) {
		super(owner, model)
	}

	def tituloDefault() {
		"Evento OS - Creación"
	}

	override ErrorsPanel createErrorsPanel(Panel mainPanel) { return new ErrorsPanel(mainPanel, "Panel de error", 3) }
	override createMainTemplate(Panel mainPanel) {
			
		mainPanel.layout = new ColumnLayout(2)
		this.title = tituloDefault
		crearPanelEntidad(mainPanel)

		val Panel panelBotones = new Panel(mainPanel)
		panelBotones.layout = new HorizontalLayout
		new Button(panelBotones) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError
		]
		new Button(panelBotones) => [
			caption = "Cancelar"
			onClick [|this.cancel]
		]
	}

	override protected createFormPanel(Panel mainPanel) {}

	abstract def void crearPanelEntidad(Panel panel)

}

@Accessors
class ABM_Locacion_View extends ABM_View {

	new(WindowOwner owner, Locacion model) {
		super(owner, model)
	}

//	Point unPunto
	override crearPanelEntidad(Panel panelEntidad) {
		minWidth = 1000
		new Label(panelEntidad).setText("Nombre:")

		new TextBox(panelEntidad) => [
			value <=> "nombre"
			width = 120
		]

		new Label(panelEntidad).text = "Superficie:"
		new NumericField(panelEntidad) => [
			value <=> "superficie"
			width = 20
		]
		new Label(panelEntidad).text = "Coordenada x:"
		new NumericField(panelEntidad) => [
			value <=> "punto.x"
			width = 20
		]
		new Label(panelEntidad).text = "Coordenada y:"
		new NumericField(panelEntidad) => [
			value <=> "punto.y"
			width = 20
		]

	}

//	def setLocacionSeleccionada(Locacion seleccion) {
//		locacionSeleccionada = seleccion
//	}
}

@Accessors
class ABM_Usuario_View extends ABM_View {

	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {
		minWidth = 1000
		new Label(panelEntidad).text = "UserName:"

		new TextBox(panelEntidad) => [
			value <=> "nombreUsuario"
			width = 200
		]
		new Label(panelEntidad).text = "Nombre:"
		new TextBox(panelEntidad) => [
			value <=> "nombreApellido"
			width = 200
		]
		new Label(panelEntidad).text = "mail:"
		new TextBox(panelEntidad) => [
			value <=> "email"
			width = 200
		]
		new Label(panelEntidad).text = "Tipo De Usuario:" // TODO anulado tipo de usuario
		new Selector(panelEntidad) => [
			(items <=> ("tiposDeUsuarios")).adapter = new PropertyAdapter(TipoDeUsuario, "nom")//.transformer= new TipoDeUsuarioTransformer
			value <=> ("tipoDeUsuario")
		]

//	def getTiposDeUsuarios() { TODO esto agregue en clase usuario tp 1 idem para tarifa y tipodeservicio
//		#[UsuarioFree, UsuarioAmateur,UsuarioProfesional]
//	}

		new Label(panelEntidad).text = "Fecha de Nacimiento:"
		new TextBox(panelEntidad) => [
			(value <=> "fechaNacimiento").transformer = new LocalDateTransformer
			width = 150
		]

	}

}

@Accessors
class ABM_Servicio_View extends ABM_View {

	new(WindowOwner owner, Servicio model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {
		minWidth = 300
//		var serviciosEditPanel = new Panel(panelEntidad)
//		serviciosEditPanel.layout = new ColumnLayout(2)
		new Label(panelEntidad) => [
			setText = "Nombre:"
			width = 200
		]
		new TextBox(panelEntidad) => [
			value <=> "descripcion"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Tipo de Servicio:"
		]
		new Selector(panelEntidad) => [
			items <=> "tiposDeServicios"
			value <=> "tiposDeServicios"
		]
		new Label(panelEntidad) => [
			setText = "Tipo de Tarifa:"
		]
		new Selector(panelEntidad) => [
			allowNull(false)
			(items <=> "tiposDeTarifas")
			value <=> "tiposDeTarifas"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Costo Fijo:"
		]
		new NumericField(panelEntidad) => [
			value <=> "costoFijo"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Costo Mínimo:"
		]
		new NumericField(panelEntidad) => [
			value <=> "costoMinimo"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Costo Por Hora:"
		]
		new NumericField(panelEntidad) => [
			value <=> "costoPorHora"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "% Costo Minimo:"
		]
		new NumericField(panelEntidad) => [
			value <=> "porcentajeCostoMinimo"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Costo Fijo Persona:"
		]
		new NumericField(panelEntidad) => [
			value <=> "costoPorPersona"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Costo Fijo Km:"
		]
		new NumericField(panelEntidad) => [
			value <=> "costoPorKm"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Coordenadas y:"
		]
		new NumericField(panelEntidad) => [
			value <=> "ubicacion.y"
			width = 200
		]
		new Label(panelEntidad) => [
			setText = "Coordenadas x:"
		]
		new NumericField(panelEntidad) => [
			value <=> "ubicacion.x"
			width = 200
		]
//		new LabeledTextBox(panelEntidad).setText("Nombre:").bindValueToProperty("descripcion")
//		new LabeledTextBox(serviciosEditPanel).setText("Tipo de Servicio:").bindValueToProperty("tipoDeServicio")
//		new LabeledTextBox(serviciosEditPanel).setText("Tipo de Tarifa:").bindValueToProperty("tipoDeTarifa")
//		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("costoFijo")
//		new LabeledTextBox(serviciosEditPanel).setText("Costo Minimo:").bindValueToProperty("costoMinimo")
//		new LabeledTextBox(serviciosEditPanel).setText("Costo Por Hora:").bindValueToProperty("costoPorHora")
//		new LabeledTextBox(serviciosEditPanel).setText("% Costo Minimo:").bindValueToProperty("porcentajeCostoMinimo")
//		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("costoPorPersona")
//		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("costoPorKm")
//		new LabeledTextBox(serviciosEditPanel).setText("Costo Fijo:").bindValueToProperty("ubicacion")
	}

}
