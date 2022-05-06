object knightRider {
	const property peso = 500
	const property peligrosidad = 10
}

object bumblebee {
	var transformacion
	const property peso = 800
	
	method transformacion(nuevaTransformacion) {
		transformacion = nuevaTransformacion
	}
	method peligrosidad() = transformacion.peligrosidad()
}

object paqueteLadrillos{
	var ladrillos
	const property peligrosidad = 2
	
	method ladrillos(cantidad) {
		ladrillos = cantidad
	}
	method peso() = ladrillos * 2
}


object arena {
	var property peso = 10
	const property peligrosidad = 1

}

object bateriaAntiaerea {
	var misiles
	method peso() = if(misiles) 300 else 200
	method peligrosidad() = if(misiles) 100 else 0
	method misiles(activos) {
		misiles = activos
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
		return cosas.size() == 0
	}
	method peso() = peso + self.pesoContenido()
	method pesoContenido() {
		return cosas.sum({c => c.peso()})
	}
	method peligrosidad() {
		return if(self.estaVacio()) 0 else cosas.max({c => c.peligrosidad()}).peligrosidad()
	}
}

object residuosRadioactivos {
	var property peso = 100
	const property peligrosidad = 200
}

object embalajeSeguridad {
	var cosa
	method embalar(unaCosa) {
		cosa = unaCosa
	}
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2
}

object auto {
	method peligrosidad() = 15
}

object robot {
	method peligrosidad() = 30
}

