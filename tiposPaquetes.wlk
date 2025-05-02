import mensajeria.*
import mensajeros.*


object paquete {
  var pagado = false
  var destino = puenteDeBrooklyn
 // method puedeSerEntregado(mensajero) = self.estaPago and mensajero.puedeLlegar(destino)
  method puedeSerEntregado(mensajero) = self.estaPago() and destino.dejaPasar(mensajero)
  method estaPago() = pagado 
  method pagar() { 
    pagado = true    
  }
  method destino(nuevo){
    destino = nuevo
  }
  method precio() = 50
}

object paquetito{
  var destino = puenteDeBrooklyn
  method puedeSerEntregado(mensajero) = true
  method estaPago() = true
  method destino(nuevo){
    destino = nuevo
  }
  method precio() = 0
}

object paqueton{
  var destino = [matrix, puenteDeBrooklyn]
  var pagado = 0  
  method puedeSerEntregado(mensajero) = self.estaPago() and self.pasaPorTodos(mensajero)
  method pasaPorTodos(mensajero) = destino.all({d=>d.dejaPasar(mensajero)})
  method estaPago() = pagado >= self.precio()
  method precio() = destino.size() * 100  // cantidad de destinos * 100
  method pagar(importe) { 
    pagado = pagado + importe
  }
}

object paquetin {
  var destino = [matrix]
  var pagado = 0  
  method puedeSerEntregado(mensajero) = self.estaPago() and self.pasaPorTodos(mensajero)
  method pasaPorTodos(mensajero) = destino.all({d=>d.dejaPasar(mensajero)})
  method estaPago() = pagado >= self.precio()
  method precio() = destino.size() * 50
  method pagar(importe) { 
    pagado = pagado + importe
  }
}