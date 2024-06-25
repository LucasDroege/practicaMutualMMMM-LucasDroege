import familia.*
class Casa {
	const property constitucionDeCasa = []
	const property integrantes = []
	const property ocupantes = []
	method agregarHabitacion(nombre){
		constitucionDeCasa.add(nombre)
	}
	method habitacionesOcupadas(){
		return constitucionDeCasa.filter({x=>x.estaOcupada()})
	}
	method promedio(){
		return constitucionDeCasa.sum({x=> x.nivelDeConfort()}) / integrantes.size()
	}
}
class Habitacion inherits Casa {
	var property nivelDeConfort = 10
	method agregarOcupantes(nombre){
		ocupantes.add(nombre)
	}
	method puedeIngresar() = false
	method ingresarEnOtraHabitacion(habitacionNueva){
		if(integrantes.find({x => x.nombre() == ocupantes.filter({y=> y.nombre()})  })) ocupantes.remove(integrantes.nombre())
		 ocupantes.add(habitacionNueva)
	}
	method estaOcupada(){
		return ocupantes.size() > 0
	}
}
class HabitacionDeUsoGeneral inherits Habitacion {
	
}
class Dormitorio inherits Habitacion {
	const property personasQueDuermen = []
	override method nivelDeConfort() { 
		nivelDeConfort = if(integrantes.find({x => x.nombre() == personasQueDuermen.nombre()})) nivelDeConfort + 10 / personasQueDuermen.size() else nivelDeConfort  
	}
	override method puedeIngresar(){
		return integrantes.find({x => x.nombre() == personasQueDuermen.nombre()}) or personasQueDuermen == ocupantes
	}
}
class Banio inherits Habitacion {
	
	override method nivelDeConfort() { 
		nivelDeConfort = if(integrantes.edad() < 5) nivelDeConfort + 2 else nivelDeConfort + 4 
	}
	override method puedeIngresar(){
		return ocupantes.edad() < 5
	}

}
class Cocina inherits Habitacion {
		var property mtCuadrados 
		var property porcentaje = 0.1
		override method nivelDeConfort() { 
		nivelDeConfort = if(integrantes.habilidadEnLaCocina()) nivelDeConfort + mtCuadrados * porcentaje  else nivelDeConfort + 4 
	}
		override method puedeIngresar(){
		return integrantes.habilidadEnLaCocina() and not(ocupantes.all({x=>x.habilidadEnLaCocina()}))
	}
	
	
}