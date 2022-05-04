object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
}

object bumblebee {
	var transformacion
	method transformacion() = transformacion
	method transformacion(unaTransformacion) {
		transformacion = unaTransformacion
	}
	method peso() = 800
	method nivelDePeligrosidad() {
		return transformacion.peligrosidad()
	}
}

object paqueteLadrillos{
	var ladrillos
	method ladrillos() = ladrillos
	method ladrillos(cantidad) {
		ladrillos = cantidad
	}
	method peso() = ladrillos * 2
	method nivelDePeligrosidad() = 2
}


object arena {
	var peso
	method peso() = peso
	method peso(kilos) {
		peso = kilos
	}
	method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea {
	var misiles
	method misiles() = misiles
	method misiles(boo) {
		misiles = boo
	}
	method peso() = if(misiles) 300 else 200
	method nivelDePeligrosidad() = if(misiles) 100 else 0
}

object contenedor {
	const cosas = []
	const peso = 100
	method agregar(cosa) {
		cosas.add(cosa)
	}
	method quitar(cosa) {
		cosas.remove(cosa)
	}
	method estaVacio() {
		return cosas.size() == 0
	}
	method peso() = peso + self.pesoContenido()
	method pesoContenido() {
		return cosas.sum({c => c.peso()})
	}
	method peligrosidad() {
		return if(self.estaVacio()) 0 else cosas.max({c => c.nivelDePeligrosidad()}).nivelDePeligrosidad()
	}
	
}

object residuosRadioactivos {
	var peso
	method peso() = peso
	method peso(kilos) {
		peso = kilos
	}
	method nivelDePeligrosidad() = 200
}

object embalajeSeguridad {
	var cosa
	method cosa() = cosa
	method cosa(unaCosa) {
		cosa = unaCosa
	}
	method peso() = cosa.peso()
	method nivelDePeligrosidad() = cosa.nivelDePeligrosidad() / 2
}

object auto {
	method peligrosidad() = 15
}

object robot {
	method peligrosidad() = 30
}

