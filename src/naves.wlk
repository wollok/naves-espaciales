class Nave {
	var velocidad = 0
	var direccion = 0
	var combustible = 0
	
	method combustible() {
		return combustible
	}
	
	method cargarCombustible(cantidad) {
		combustible += cantidad
	}
	method descargarCombustible(cantidad) {
		combustible -= cantidad
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
		velocidad = velocidad.min(100000)
	}
	method desacelerar(cuanto) {
		velocidad-=cuanto
		velocidad = velocidad.max(0)
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
	method acercarseUnPocoAlSol() {
		direccion += 1
		direccion = direccion.min(10)	
	}
	method alejarseUnPocoDelSol() {
		direccion -= 1
		direccion = direccion.max(-10)		
	}
	
	method prepararViaje() {
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	
	method recibirAmenaza() {
		self.escapar()
		self.avisar()
	}
	
	method escapar()
	method avisar()
}

class NaveBaliza inherits Nave {
	var colorBaliza
	var coloresValidados = #{"rojo", "verde", "azul"}

	method cambiarColorDeBaliza(_colorBaliza) {
		/*if (coloresValidados.any({c => c == _colorBaliza})) {
					colorBaliza = _colorBaliza						
		}*/
		if (coloresValidados.contains(_colorBaliza)) {
					colorBaliza = _colorBaliza						
		}		
	}
	method colorBaliza() {
		return colorBaliza
	}
	override method prepararViaje() {
		super()
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
	override method escapar() {
		
	}
	
	override method avisar() {
		
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
		//return mensajesEmitidos.all({m => m.lenght() <= 30})
		return not mensajesEmitidos.any({m => m.lenght() > 30})	
	}
	method emitioMensaje(mensaje) {
		return mensajesEmitidos.contains(mensaje)	
	}
	override method prepararViaje() {
		super()
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)	
		self.emitirMensaje("Saliendo en misión")
	}
	
	override method escapar() {
		
	}
	
	override method avisar() {
		
	}
		
}

class NaveDePasajeros inherits Nave {
	var cantidadDePasajeros = 0
	var racionesDeComida = 0
	var racionesDeBebida = 0
	
	method racionesDeComida() {
		return racionesDeComida	
	}
	
	method racionesDeBebida() {
		return racionesDeBebida	
	}
	
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
		super()
		self.cargarRacionesDeComida(4*cantidadDePasajeros)
		self.cargarRacionesDeBebida(6*cantidadDePasajeros)
		self.acercarseUnPocoAlSol()	
	}
	
		override method escapar() {
			
		}
		
		override method avisar() {
			
		}
}