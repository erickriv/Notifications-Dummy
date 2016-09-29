/*
    This is the base class for all notifications within this application (both local and push)
    The id's of messages received will be saved in a temporary array until the user decides to save it 
    for later or dismiss it entirely (which will delete the application.
 
    Current prerrogative: How do i administer the filters?
*/

import Foundation



var notificationsModel  = Notifications()

class Notifications: NSObject {
    
    var tempNotifications   = [Notifications]() // Por ahora grabaremos las notificaciones aqui antes de que el usuario
                                                // decida grabarlos deverdad.
    var id              = Int()
    var title           = String()
    var message         = String()
    var source          = String()
    var activeFilters   = String()
    
    //
    var util = Utility()
    var dbConnection : FMDatabase? = nil
    
    //let filters         = []
    
    
    func getInstance() -> Notifications {
        // Me devuelve una instancia abierta a la base de datos de donde sea que la llame.
        
        if(notificationsModel.dbConnection == nil){
            notificationsModel.dbConnection = FMDatabase(path: util.getPath("asociacionesdb.db"))
        }
    
        // Devolviendo el modelo completo, estariaos dando toda la informacion necesaria
        return notificationsModel
    }
    
    
    func save(_ id: Int){
        // Recibe el id del mensaje grabado en el diccionario temporero y lo envia a la base de datos
        
        // busco en la tabla el mensaje con este id
        // Su flag de permanencia lo prendo (apago el de temp)
        // Le hago update(save en yii) a la tabla
        
    }
    
    
    func dismissNotification(_ indexPath: Int){
        // Esta funcion borrara los mensajes del DataSource
        
        tempNotifications.remove(at: indexPath)
        
        // Tiro query para borrar la notificacion de la base de dato
        
        
    }

    
    func findNotification(_ id: Int ){
        
        
    }
    
    
    func printMe(){
        print("Alexander Rivera Rivera")
        print("Omar es pato.")
        print("\this.message")
    }
    
    
    func loadTempNotifications() {
        //Aqui devolvemos un array de las notificaciones que tengo que no se han guardado.
        //notificationsModel.dbConnection?.open() // is it really open? bitch?
        
        notificationsModel = notificationsModel.getInstance()
        print(notificationsModel)
        
        
        if notificationsModel.dbConnection!.open(){
            
            // Cargamos lo que este guardado en la base de datos con el flag de temp
            let resultSet: FMResultSet! = notificationsModel.dbConnection!.executeQuery("SELECT * FROM notifications", withArgumentsIn: nil)
            
            if(resultSet != nil){
                // Recorremos todos los resultados, uno por uno vamos llenando los modelos de los mensajes
                while resultSet.next() {
                    
                    let temp            = Notifications()
                    temp.id             = Int(resultSet.int(forColumn: "id"))
                    temp.message        = resultSet.string(forColumn: "message")
                    temp.activeFilters  = resultSet.string(forColumn: "filtros")
                    temp.source         = resultSet.string(forColumn: "source_id")
                    
                    // Pegamos el modelo que sacamos de las notificaciones.
                    tempNotifications.append(temp)
                    
                    print(temp)
                }
            }else{
                print("Problema cargando los resultados del query a la base de datos (TempNotifications)\n\n TOTO")
            }
            
        }else {
            
            print("No fucking carga esta puta mierda de base de datos.")
            
        }
        
    
        notificationsModel.dbConnection?.close()

    }
    
    
    
}
