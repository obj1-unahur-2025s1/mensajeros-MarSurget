import tiposPaquetes.*
import mensajeros.*



object mensajeria {
  var mensajeros = [] ///puede ser var o const
  var enviados = []
  var pendientes = []

  method listaMensajeros() = mensajeros

  method listaEnviados() = enviados

  method listaPendientes() = pendientes


  method contratar(empleado) {
    mensajeros.add(empleado)    
  }
  method despedir(empleado) {
    mensajeros.remove(empleado)    
  }  
  method despedirATodos() {
    mensajeros.clear()    
  } 
  method esGrande() = mensajeros.size() > 2

  method entregaRapida()= paquete.puedeSerEntregado(mensajeros.head())
  
  method pesoFinal()= mensajeros.last().pesoTotal()

  method puedeEntregar(unPaquete) = mensajeros.any{m=>unPaquete.puedeSerEntregado(m)} // 1
  
  method quienesPuedeEntregar(unPaquete) = mensajeros.filter{m=>unPaquete.puedeSerEntregado(m)} // 2
  
  method tieneSobrepeso() = self.pesoTotal() / self.cantidadMensajeros() > 500 //3 veeeeeeeer
  
  method cantidadMensajeros() = mensajeros.size()
  
  method pesoTotal() = mensajeros.sum({m=>m.pesoTotal()}) /// sin parametros suma todos los obj si son sumables
  
  method enviar(unPaquete) {  //4
    if (self.puedeEntregar(unPaquete))
      enviados.add(unPaquete)
    else
      pendientes.add(unPaquete)
  }
  method facturacion() = enviados.sum{p=>p.precio()} // 5

  method enviarTodos(paquetesAEnviar) { //6
    paquetesAEnviar.forEach{p=>self.enviar(p)}  //con cada uno de los paquetes enviarlo el for each hace eso 
  }  
  method reenviarPendienteCaro(){ // 7
    const caro = self.pendienteCaro()
    pendientes.remove(caro)
    self.enviar(caro)
    
  }
  method pendienteCaro() = pendientes.max{p=>p.precio()}
}
