import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var property position = game.at(5,5)
	var amiga
	
	//PEPITA ESTA GORDA
	method image() = if (energia > 100) "pepita-gorda-raw.png" else "pepita.png"

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
			energia -= self.energiaParaVolar(position.distance(unaCiudad.position()))
		} else {
			self.pepitaDice("!Ya estoy en " + ciudad.nombre() + "!")
		}
	}
	
	method pepitaDice(mensaje) {
		game.say(self, mensaje)
	}
	
	method puedeVolar(unaCiudad) {
		return energia > 0
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}	
	
	method volarYComer(comida) {
		position = comida.position()
		self.come(comida)
		comida.eliminarDelTablero()
	}
	
	method nuevaAmiga(ave) {
		if (amiga != ave) {
			game.say(self, "!Hola " + ave.nombre() + "!")	
		}
	}
}


object pepona {
	var property position = game.at(2,0)
	method image() = "pepona.png"
	method nombre() = "Pepona"
}

object pipa {
	var property position = game.at(5,38)
	method image() = "pepitaCanchera.png"
	method nombre() = "Pipa"
}

object roque {
	var property position = game.at(6,6)
	method image() = "jugador.png"
	method nombre() = "Jugador"
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
}