import cosas.*

object camion {
	const cosas = #{}
	const tara = 1000
	
	method cargar(cosa) {
		cosas.add(cosa)
	}
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	method todoPesoPar() {
		return cosas.all({c => c.peso().even()})
	}
	method hayAlgunoQuePesa(peso) {
		return cosas.any({c => c.peso() == peso})
	}
	method elDeNivel(nivel) {
		return cosas.find({c => c.peligrosidad() == nivel})
	}
	method pesoTotal() {
		return tara + cosas.sum({c => c.peso()})
	}
	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({c => c.peligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({c => c.peligrosidad() > cosa.peligrosidad()})
	}
	method ningunoSuperaPeligrosidad(nivel) {
		return !cosas.any({c => c.peligrosidad() > nivel})
	}
	method puedeCircularEnRuta(nivelMaximoDePeligrosidad) {
		return !self.excedidoDePeso() and self.ningunoSuperaPeligrosidad(nivelMaximoDePeligrosidad)
	}
	method tieneAlgoQuePesaEntre(min,max) {
		return cosas.any({c => c.peso().between(min,max)})
	}
	method cosaMasPesada() {
		return cosas.max({c => c.peso()})
	}
	method pesos() {
		return cosas.map({c => c.peso()})
	}
}
