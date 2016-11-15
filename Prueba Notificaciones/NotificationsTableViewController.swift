import Foundation
import UIKit

class NotificationsTableViewController: UITableViewController {
    
    let notifications = Notifications()
    var selectedNotification = Notifications()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65 // Por ahora, no se pq exactamente uso esto en todos los proyectos
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notifications.loadTempNotifications() // Hacemos un refresh de la info sacada de la db
        print("Cantidad de notificaciones:\n")
        print(notifications.tempNotifications.count)
        //tableView.reloadData() // Se haga refresh de la data que se presenta en la tablas
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Limpiamos la data dentro del array de notificaciones para eliminar redundancia de data al volver a entrar
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedNotification = notifications.tempNotifications[(indexPath as NSIndexPath).row]
        self.performSegue(withIdentifier: "notificationsDetailSegue", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Funcion: Demostramos la data del cell, dependiendo de su posicion en el SourceData
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsCell
        let viewableNotification = notifications.tempNotifications[(indexPath as NSIndexPath).row]
        
        cell.titleLabel.text = viewableNotification.title
        cell.sourceNameLabel.text = viewableNotification.sourceName
        
        print("Verificando el cell: \n")
        print(cell.titleLabel.text)
        print(cell.sourceNameLabel.text)
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.tempNotifications.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "notificationsDetailSegue"){
            
            // Ahora buscamos la notificacion especifica
            if let row = (tableView.indexPathForSelectedRow as NSIndexPath?)?.row {
                
                let notification = notifications.tempNotifications[row]
                let detailViewController = segue.destination as! NotificationsDetailViewController
                
                detailViewController.selectedNotification = notification
                
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


        
