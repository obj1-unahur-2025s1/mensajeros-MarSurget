import tiposPaquetes.*
import mensajeria.*


object roberto {
  var transporte = null 
  const peso = 90
  method pesoTotal() = peso + transporte.peso()
  method usarTransporte(vehiculo) {
    transporte = vehiculo
  }
  method puedeLlamar() = false 
  method puedeViajar(lugar) {
    return lugar.dejaPasar(self.pesoTotal())
  } 
}
object bicicleta{
  method peso() = 5 
}

object camion{
  var acoplados = 1
  method peso() = acoplados * 500
  method agregarAcoplados(){
    acoplados = acoplados + 1
  }
}

object chuckNorris {
  const peso = 80
  method puedeLlamar() = true 
  method pesoTotal() = peso     
  method puedeViajar(lugar) {
    return lugar.dejaPasar(self)
  } 
}

object neo {
  const peso = 0
  var creditoCelular = 0
  method pesoTotal()= peso
  method cargarCredito(credito) {
    creditoCelular = credito 
  }   
  method puedeLlamar(){
      return creditoCelular > 0
    }
  method puedeViajar(lugar) {
      return lugar.dejaPasar(self.pesoTotal())
  }     
  } 

object puenteDeBrooklyn {
  method dejaPasar(mensajero) = mensajero.pesoTotal() <= 1000    
}

object matrix {
  method dejaPasar(mensajero) = mensajero.puedeLlamar()
}


object carlos {
  var transporte = null 
  const peso = 110
  method pesoTotal() = peso + transporte.peso()
  method usarTransporte() {
    transporte = bicicleta
  }
  method puedeLlamar() = true 
  method puedeViajar(lugar) {
      lugar.dejaPasar(self.pesoTotal())
  }  
}

