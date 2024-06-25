import casa.*
class Familia {
	const property integrantes = []
	var property casaEnLaQueViven
	method responsableDeFamilia(){
		return integrantes.max({x=>x.edad()}).nombre()
	}
	method agregarIntegrante(nombre){
		integrantes.add(nombre)
	}
	method estaAGusto(){
		return casaEnLaQueViven.promedio() > 40
	}
}
class Persona inherits Familia {
	var property habilidadEnLaCocina = false
	var property edad
}
class PersonaObsesives inherits Persona{
	override method estaAGusto(){
		return super() and casaEnLaQueViven.all({x=> x.constitucionDeCasa().ocupantes() < 3})
	}
}
class PersonaGolose inherits Persona{
	override method estaAGusto(){
		return super() and integrantes.any({x=> x.puedeIngresar()}) and integrantes.any({y=> y.habilidadEnLaCocina()})
	}
}

class PersonaSencillez inherits Persona{
	override method estaAGusto(){
		return super() and integrantes.any({x=> x.puedeIngresar()}) and casaEnLaQueViven.constitucionDeCasa().size() > integrantes.size()
	}
}


