class Nave {
	var velocidad = 0
	var direccion = 0
	
	method velocidad(_velocidad) {
		velocidad=_velocidad
	}
	method direccion(_direccion) {
		direccion=_direccion
	}	
	method velocidad() {
		return velocidad
	}	
	method direccion() {
		return direccion
	}	
	method acelerar(cuanto) {
		velocidad+=cuanto
		velocidad = velocidad.max(100000)
	}
	method desacelerar(cuanto) {
		velocidad-=cuanto
		velocidad = velocidad.min(0)
	}
	method irHaciaElSol() {
		direccion = 10		
	}
	method escaparDelSol() {
		direccion = -10			
	}
	method ponerseParaleloAlSol() {
		direccion = 0				
	}
	method acercaseUnPocoAlSol() {
		direccion += 1
		direccion = direccion.max(10)	
	}
	method alejarseUnPocoDelSol() {
		direccion -= 1
		direccion = direccion.max(-10)		
	}
	
	method prepararViaje()
}

class NaveBaliza inherits Nave {
	var colorBaliza

	method colorBaliza(_colorBaliza) {
		colorBaliza = _colorBaliza
	}
	method colorBaliza() {
		return colorBaliza
	}
	override method prepararViaje() {
		self.colorBaliza("verde")
		self.ponerseParaleloAlSol()
	}
}

class NaveCombate inherits Nave {
	var visible = true
	var misilesDesplegados = false
	var mensajesEmitidos = [] 
	
	method ponerseVisible() {
		visible = true	
	}
	method ponerseInvisible() {
		visible = false	
	}
	method estaInvisible() {
		return not visible
	}
	method desplegarMisiles() {
		misilesDesplegados = true		
	}
	method replegarMisiles() {
		misilesDesplegados = false	
	}
	method misilesDesplegados() {
		return misilesDesplegados	
	}
	method emitirMensaje(mensaje) {
		mensajesEmitidos.add(mensaje)	
	}
	method mensajesEmitidos() {
		return mensajesEmitidos		
	}
	method primerMensajeEmitido() {
		return mensajesEmitidos.first()	
	}
	method ultimoMensajeEmitido() {
		return mensajesEmitidos.last()	
	}
	method esEscueta() {
		return mensajesEmitidos.any({m => m.size() > 30})	
	}
	method emitioMensaje(mensaje) {
		return mensajesEmitidos.contains(mensaje)	
	}
	override method prepararViaje() {
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)	
		self.emitirMensaje("Saliendo en misión")
	}
		
}

class NaveDePasajeros inherits Nave {
	var cantidadDePasajeros
	var racionesDeComida
	var racionesDeBebida
	
	method cantidadDePasajeros(_cantidadDePasajeros) {
		cantidadDePasajeros = _cantidadDePasajeros
	}
	method cantidadDePasajeros() {
		return cantidadDePasajeros
	}
	method cargarRacionesDeComida(cantidad) {
		racionesDeComida+=cantidad
	}
	method cargarRacionesDeBebida(cantidad) {
		racionesDeBebida+=cantidad
	}
	method descargarRacionesDeComida(cantidad) {
		racionesDeComida-=cantidad
	}
	method descargarRacionesDeBebida(cantidad) {
		racionesDeBebida-=cantidad
	}
	override method prepararViaje() {
		self.cargarRacionesDeComida(4*cantidadDePasajeros)
		self.cargarRacionesDeBebida(6*cantidadDePasajeros)
		self.acercaseUnPocoAlSol()	
	}	
}