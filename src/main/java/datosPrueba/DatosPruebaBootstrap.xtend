package datosPrueba

import eventos.EventoAbierto
import eventos.EventoCerrado
import eventos.Invitacion
import eventos.Locacion
import eventos.Usuario
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.Period
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.geodds.Point
import repositorio.RepositorioLocaciones
import repositorio.RepositorioServicios
import repositorio.RepositorioUsuarios
import servicios.Servicio

@Accessors
class DatosPruebaBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Locacion), new RepositorioLocaciones)
		ApplicationContext.instance.configureSingleton(typeof(Usuario), new RepositorioUsuarios)
		ApplicationContext.instance.configureSingleton(typeof(Servicio), new RepositorioServicios)
	}

	override run() {

// datos para repositorio Locacion
		val RepoLocaciones = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocaciones
		val salon_SM = new Locacion => [
			nombre = "San Martin"
			punto = new Point(35, 45)
			superficie = 16
		]
		val salon_2 = new Locacion => [
			nombre = "San Martin 2"
			punto = new Point(35, 65)
			superficie = 2.5

		]
		val salon_3 = new Locacion => [
			nombre = "Sanse"
			punto = new Point(35, 65)
			superficie = 100
		]

		val salon_Completo = new Locacion => [
			nombre = "San Martin Completo"
			punto = new Point(35, 65)
			superficie = 16
		]
		RepoLocaciones.agregarElemento(salon_SM)
		RepoLocaciones.agregarElemento(salon_2)
		RepoLocaciones.agregarElemento(salon_3)
		RepoLocaciones.agregarElemento(salon_Completo)

// datos para repositorio Usuario
		val repoUsuarios = ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepositorioUsuarios

		val usuario1 = new Usuario => [
			nombreUsuario = "PrimerUsuario"
			email = "mail1"
			nombreApellido = "Pepe Argento"
			fechaNacimiento = LocalDate.of(2002, 05, 15)
			coordenadas = new Point(40, 50)
		]

		val usuario2 = new Usuario => [
			nombreUsuario = "SegundoUsuario"
			email = "mail2"
			nombreApellido = "Mario Perez"
			fechaNacimiento = LocalDate.of(1900, 04, 02)
			coordenadas = new Point(45, 60)
		]

		val usuario3 = new Usuario => [
			nombreUsuario = "Usuario3"
			email = "mail3"
			nombreApellido = "María Gomez"
			fechaNacimiento = LocalDate.of(1900, 04, 02)
			coordenadas = new Point(34, 45)
			esAntisocial = false
		]
		val usuario4 = new Usuario => [
			nombreUsuario = "usuario4"
			email = "mail4"
			nombreApellido = "Perez otro"
			fechaNacimiento = LocalDate.of(2002, 05, 15)
			coordenadas = new Point(40, 50)

		]

		usuario1.setUsuarioProfesional()
		usuario2.setUsuarioProfesional()
		usuario3.setUsuarioProfesional()
		usuario4.setUsuarioProfesional()
		val reunionAbierta1 = new EventoAbierto => [
			nombre = "Reunion Proyecto ab1"
			organizador = usuario1
			locacion = salon_3
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(3))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(4))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
			edadMinima = 10
			precioEntrada = 100
		]
		val reunionAbierta2 = new EventoAbierto => [

			nombre = "Cumple ab2"
			organizador = usuario1
			locacion = salon_2
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(25))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(26))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(7))
			edadMinima = 10
			precioEntrada = 200
		]
		val reunionChicaCe1 = new EventoCerrado => [
			nombre = "Reunion Proyecto ce1"
			organizador = usuario1
			locacion = salon_SM
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(3))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(4))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
			capacidadMaxima = 10
		]
		val otroEventoCe2 = new EventoCerrado => [
			nombre = "Otra Reunion ce2 "
			organizador = usuario2
			locacion = salon_3
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(4))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(5))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
			capacidadMaxima = 50
		]
		val reunionGrandeAb3 = new EventoAbierto => [
			nombre = "Reunion++Ab3"
			organizador = usuario1
			locacion = salon_Completo
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(3))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(4))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
			edadMinima = 8
			precioEntrada = 100
		]
		val primerEventoCe3 = new EventoCerrado => [
			nombre = "Reunion Proyecto ce3"
			organizador = usuario4
			locacion = salon_2
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(3))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(4))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
			capacidadMaxima = 10
		]
		val segundoEventoCe4 = new EventoCerrado => [
			nombre = "Reunion Proyecto Ce4"
			organizador = usuario4
			locacion = salon_3
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(3))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(4))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
			capacidadMaxima = 10
		]
//		val tercerEvento = new EventoCerrado => [
//			nombre = "Reunion Proyecto"
//			organizador = unUsuario
//			locacion = salon_SM
//			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(3))
//			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(4))
//			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(2))
//			capacidadMaxima = 10
//		]
//		val cuartoEvento = new EventoCerrado => [
//			nombre = "Reunion Proyecto"
//			locacion = salon_SM
//			organizador = usuario1
//			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(8))
//			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(9))
//			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(7))
//			capacidadMaxima = 50
//		]
		val quintoEventoCe5 = new EventoCerrado => [
			nombre = "Reunion Proyecto Ce5"
			organizador = usuario1
			locacion = salon_3
			fechaDeInicio = LocalDateTime.now().plus(Period.ofDays(-4))
			fechaFinalizacion = LocalDateTime.now().plus(Period.ofDays(-3))
			fechaLimiteConfirmacion = LocalDate.now().plus(Period.ofDays(-5))
			capacidadMaxima = 10
		]

		repoUsuarios.agregarElemento(usuario1)
		repoUsuarios.agregarElemento(usuario2)
		repoUsuarios.agregarElemento(usuario3)
		repoUsuarios.agregarElemento(usuario4)
		usuario1.organizarEventoAbierto(reunionAbierta1)
		usuario1.organizarEventoAbierto(reunionAbierta2)
		usuario1.organizarEventoCerrado(reunionChicaCe1)
		usuario2.organizarEventoCerrado(otroEventoCe2)
		usuario4.organizarEventoCerrado(primerEventoCe3)
		usuario4.organizarEventoCerrado(segundoEventoCe4)
		usuario1.organizarEventoCerrado(quintoEventoCe5)
		usuario1.organizarEventoAbierto(reunionGrandeAb3)
		val repoServicios = ApplicationContext.instance.getSingleton(typeof(Servicio)) as RepositorioServicios
		val servicioCatering = new Servicio => [
			ubicacion = new Point(34.910067, 45) // distancia a reunion chica aproximada 10 km
			descripcion = "Catering"
			ubicacion = new Point(34.910067, 45)
			costoFijo = 200
			costoPorKm = 2
			costoMinimo = 100
			porcentajeCostoMinimo = 20
		]

		val servicioAnimacion = new Servicio => [
			ubicacion = new Point(35, 45) // distancia a reunion chica 0
			descripcion = "Animacion"
			ubicacion = new Point(34.910067, 45)
			costoFijo = 300
			costoPorKm = 2
			costoMinimo = 100
			costoPorHora = 1
			costoPorPersona = 400
			porcentajeCostoMinimo = 20
		]

		servicioAnimacion.setTarifaPorHora
		servicioCatering.setTarifaFija

		repoServicios.agregarElemento(servicioAnimacion)
		repoServicios.agregarElemento(servicioCatering)

//		val entradaPrueba = new Entrada(cumple, usuario2)
//		val entradaPrueba2 = new Entrada(cumple, unUsuario)
//		val entradaPrueba3 = new Entrada(cumple, usuario3)
		usuario2.comprarEntradaAUnEventoAbierto(reunionAbierta2)
		usuario2.comprarEntradaAUnEventoAbierto(reunionAbierta1)
		usuario4.comprarEntradaAUnEventoAbierto(reunionGrandeAb3)
		usuario4.comprarEntradaAUnEventoAbierto(reunionAbierta2)
//		usuario3.comprarEntradaAUnEventoAbierto(cumple)
		usuario1.invitarAUnEventoCerrado(reunionChicaCe1, usuario2, 8)
		val unaInvitacion = new Invitacion(otroEventoCe2, usuario1, 8)
		usuario1.aceptarInvitacion(unaInvitacion, 8)

	}

}
