object knightRider {
	const property peso = 500
	const property peligrosidad = 10
	const property bultos = 1
	method cargar() {}
}

object bumblebee {
	var transformacion
	const property peso = 800
	const property bultos = 2
	method transformacion(nuevaTransformacion) {
		transformacion = nuevaTransformacion
	}
	method peligrosidad() {
		return transformacion.peligrosidad()
	}
	method cargar() {
		transformacion = robot
	}
}

object paqueteLadrillos{
	var ladrillos
	const property peligrosidad = 2
	
	method ladrillos(cantidad) {
		ladrillos = cantidad
	}
	method peso() = ladrillos * 2
	method bultos() = if(self.pocosLadrillos()) 1 else if(self.muchosLadrillos()) 3 else 2
	method pocosLadrillos() {
		return ladrillos < 101
	}
	method muchosLadrillos() {
		return ladrillos > 300
	}
	method cargar() {
		ladrillos += 12
	}
}


object arena {
	var property peso = 0
	const property peligrosidad = 1
	const property bultos = 1
	
	method cargar() {
		peso += 20
	}
}

object bateriaAntiaerea {
	var misiles
	
	method misiles(activos) {
		misiles = activos
	}
	method peso() = if(misiles) 300 else 200
	method peligrosidad() = if(misiles) 100 else 0
	method bultos() = if(misiles) 2 else 1
	method cargar() {
		misiles = true
	}
}

object contenedor {
	const cosas = #{}
	const peso = 100
	method guardar(cosa) {
		if(cosa != self) {
			cosas.add(cosa)	
		}
	}
	method quitar(cosa) {
		cosas.remove(cosa)
	}
	method estaVacio() {
		return cosas.isEmpty()
	}
	method peso() = peso + self.pesoContenido()
	method pesoContenido() {
		return cosas.sum({c => c.peso()})
	}
	method peligrosidad() {
		return if(self.estaVacio()) 0 else cosas.max({c => c.peligrosidad()}).peligrosidad()
	}
	method bultos() = 1 + cosas.sum({c => c.bultos()})
	method cargar() {
		cosas.forEach({c => c.cargar()})
	}
}

object residuosRadioactivos {
	var property peso = 0
	const property peligrosidad = 200
	const property bultos = 1
	
	method cargar() {
		peso += 15
	}
}

object embalajeSeguridad {
	var cosa
	method embalar(unaCosa) {
		cosa = unaCosa
	}
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2
	method bultos() = 2
	method cargar() {}
}

object auto {
	method peligrosidad() = 15
}

object robot {
	method peligrosidad() = 30
}

