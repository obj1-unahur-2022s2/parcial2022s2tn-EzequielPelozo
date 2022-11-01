

  class Planta {
	
	var property anioObtencionSemilla
	var property altura
	
	method toleraHorasDeSol()
	method espacioQueOcupa()
	method esParcelaIdeal(unaParcela)
	
	method esFuerte() = self.toleraHorasDeSol() > 10	
	method daNuevasSemillas() = self.esFuerte() // Condicion base o bien condicion alternativa
}

class Menta inherits Planta {
	
	override method toleraHorasDeSol() = 6
	override method espacioQueOcupa() = altura * 3
	
	override method daNuevasSemillas() = super() || altura > 0.4
	override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6
	
}
class HierbaBuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
}

class Soja inherits Planta {
	
	override method toleraHorasDeSol() { return
		if(altura < 0.5) 6 
		else if(altura.between(0.5,1)) 7 
		else 9
	} 
	override method espacioQueOcupa() = altura * 0.5
	override method daNuevasSemillas() = super() || (anioObtencionSemilla > 2007 && altura > 1)
	override method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolQueRecibe() == self.toleraHorasDeSol()
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaximaDePlantas() == 1
}


class Quinoa inherits Planta {
	var toleraHorasDeSol
	
	override method toleraHorasDeSol() = toleraHorasDeSol
	method toleraHorasDeSol(horas) { toleraHorasDeSol = horas}
	override method espacioQueOcupa() = 0.5
	override method daNuevasSemillas() = super() || (anioObtencionSemilla < 2005)
	override method esParcelaIdeal(unaParcela) = unaParcela.noHayPLantasMayorUnMetroYMedio()
	
	
}




