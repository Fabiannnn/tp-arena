package org.uqbar.project.TP_Evento_OS

import eventos.Entidad
import eventos.Locacion
import eventos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.WindowOwner
import servicios.Servicio
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import transformer.LocalDateTransformer
import eventos.TipoDeUsuario
import org.uqbar.arena.bindings.PropertyAdapter
import servicios.TipoDeServicio
import servicios.TipoDeTarifa

abstract class ABM_View extends TransactionalDialog<Entidad> {
	new(WindowOwner owner, Entidad model) {
		super(owner, model)
	}

	def titulo() {
		"EventOS - Creación"
	}

	override ErrorsPanel createErrorsPanel(Panel mainPanel) { return new ErrorsPanel(mainPanel, "Panel de error", 1) }

	override createMainTemplate(Panel mainPanel) {

		mainPanel.layout = new ColumnLayout(2)
		this.title = titulo
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
			setAsDefault

		]
	}

	override protected createFormPanel(Panel mainPanel) {}

	abstract def void crearPanelEntidad(Panel panel)

	def crearNumericField(Panel panel, String propiedad) {
		new NumericField(panel) => [
			value <=> propiedad
			width = 100
		]
	}

	def crearNumericField(Panel panel, String propiedad, int ancho) {
		new NumericField(panel) => [
			value <=> propiedad
			width = ancho
		]
	}

	def crearTextBox(Panel panel, String propiedad) {
		new TextBox(panel) => [
			value <=> propiedad
			width = 200
		]
	}
}

@Accessors
class ABM_Locacion_View extends ABM_View {

	override titulo() {
		"EventOS - Creación de Locaciones"
	}

	new(WindowOwner owner, Locacion model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {

		new Label(panelEntidad) => [setText = "Nombre:"]
		crearTextBox(panelEntidad, "nombre")

		new Label(panelEntidad) => [setText = "Superficie:"]
		crearNumericField(panelEntidad, "superficie")

		new Label(panelEntidad) => [setText = "Coordenada x:"]
		crearNumericField(panelEntidad, "punto.x")

		new Label(panelEntidad) => [setText = "Coordenada y:"]
		crearNumericField(panelEntidad, "punto.y")
	}
}

@Accessors
class ABM_Usuario_View extends ABM_View {

	override titulo() {
		"EventOS - Creación de Usuarios"
	}

	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {

		new Label(panelEntidad) => [setText = "Username:"]
		crearTextBox(panelEntidad, "nombreUsuario")

		new Label(panelEntidad) => [setText = "Nombre:"]
		crearTextBox(panelEntidad, "nombreApellido")

		new Label(panelEntidad) => [setText = "Mail:"]
		crearTextBox(panelEntidad, "email")

		new Label(panelEntidad) => [setText = "Tipo de Usuario:"]
		new Selector(panelEntidad) => [
			(items <=> ("tiposDeUsuarios")).adapter = new PropertyAdapter(TipoDeUsuario, "nom") // .transformer= new TipoDeUsuarioTransformer
			value <=> ("tipoDeUsuario")
		]

		new Label(panelEntidad) => [setText = "Fecha de Nacimiento:"]
		new TextBox(panelEntidad) => [
			(value <=> "fechaNacimiento").transformer = new LocalDateTransformer
			width = 150
		]
	}
}

@Accessors
class ABM_Servicio_View extends ABM_View {

	override titulo() {
		"EventOS - Creación de Servicios"
	}

	new(WindowOwner owner, Servicio model) {
		super(owner, model)
	}

	override crearPanelEntidad(Panel panelEntidad) {

		new Label(panelEntidad) => [setText = "Nombre:"]
		crearTextBox(panelEntidad, "descripcion")

		new Label(panelEntidad) => [setText = "Tipo de Servicio:"]
		new Selector(panelEntidad) => [
			(items <=> "tiposDeServicios").adapter = new PropertyAdapter(TipoDeServicio, "tipoServicio")
			value <=> "tipoDeServicio"
		]

		new Label(panelEntidad) => [setText = "Tipo de Tarifa:"]
		new Selector(panelEntidad) => [
			allowNull(false)
			(items <=> "tiposDeTarifas").adapter = new PropertyAdapter(TipoDeTarifa, "tipoTarifa")
			value <=> "tipoDeTarifa"
			width = 200
		]

		new Label(panelEntidad) => [setText = "Costo Fijo:"]
		crearNumericField(panelEntidad, "costoFijo")

		new Label(panelEntidad) => [setText = "Costo Mínimo:"]
		crearNumericField(panelEntidad, "costoMinimo")

		new Label(panelEntidad) => [setText = "Costo Por Hora:"]
		crearNumericField(panelEntidad, "costoPorHora")

		new Label(panelEntidad) => [setText = "% Costo Minimo:"]
		crearNumericField(panelEntidad, "porcentajeCostoMinimo")

		new Label(panelEntidad) => [setText = "Costo Fijo Persona:"]
		crearNumericField(panelEntidad, "costoPorPersona")

		new Label(panelEntidad) => [setText = "Costo Fijo Km:"]
		crearNumericField(panelEntidad, "costoPorKm")

		new Label(panelEntidad) => [setText = "Coordenadas y:"]
		crearNumericField(panelEntidad, "ubicacion.y")

		new Label(panelEntidad) => [setText = "Coordenadas x:"]
		crearNumericField(panelEntidad, "ubicacion.x")
	}
}
