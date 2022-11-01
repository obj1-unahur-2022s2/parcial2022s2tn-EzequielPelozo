import plantas.*

class Parcela {
	var property largo
	var property ancho
	var property horasDeSolQueRecibe
	const property plantas = []
	
	method superficie() = largo * ancho
	method cantidadMaximaDePlantas() = if(ancho > largo) self.superficie()/5 else self.superficie()/3 + largo
	
	method tieneComplicaciones() = plantas.any({ p => p.toleraHorasDeSol() < horasDeSolQueRecibe})
	
	method plantar(unaPlanta){
		plantas.add(unaPlanta)
		if(self.cantidadMaximaDePlantas() < plantas.size() || horasDeSolQueRecibe + 2 < unaPlanta.toleraHorasDeSol() ){
			self.error("No se puede plantar una planta")
		}
	}
	
	method noHayPLantasMayorUnMetroYMedio() = plantas.all({p => p.altura() < 1.5})
	method seAsociaBienCon(unaPlanta)
	method cantidadDePlantasBienAsiciadas() = plantas.count({planta => self.seAsociaBienCon(planta)})
	
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBienCon(unaPlanta) = !self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBienCon(unaPlanta) = self.cantidadMaximaDePlantas() <= 2 && unaPlanta.esFuerte()
}


object inta {
	const property parcelas = []
	
	method agregarParcelas(unaParcela) { parcelas.add(unaParcela) }
	
	method sumaDePlantasPorParcela() = parcelas.sum({parcela => parcela.plantas().size()}) 
	
	method promedioDePlantasPorParela() = self.sumaDePlantasPorParcela() / parcelas.size()
	
	method parcelasConMasDeCuatroPlantas() = parcelas.filter({parcela => parcela.plantas().size() > 4})
	
	method masAutoSustentable() = self.parcelasConMasDeCuatroPlantas().max({parcela => parcela.cantidadDePlantasBienAsiciadas()})
	
	
}
