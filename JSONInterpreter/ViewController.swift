//
//  ViewController.swift
//  JSONInterpreter
//
//  Created by AppDev on 20/04/18.
//  Copyright © 2018 Droal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //variable que almacena las peticiones
    var petitions = [[String : String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        //Desacragr datos del servidor de peticiones Whitehouse
        let urlString : String
        
        //Determinar cuual tag fue seleccionado
        if navigationController?.tabBarItem.tag  == 0{
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        }
        else{
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
  
        //Analisar el JSON de respuesta
        if let urlToConsult = URL(string: urlString){
            if let data = try? String(contentsOf: urlToConsult){
                let jsonAnswer =  JSON(parseJSON: data)
                
                //Verifica dentro del JSON el campo estatus tenga el valor 200 (sin errores en el protocolo http)
                if jsonAnswer["metadata"]["responseInfo"]["status"].intValue == 200{
                    parseJsonAnswer(json: jsonAnswer)
                    return
                }
            }
        }
        
        showError()
        
    }

    
    //Metodo que carga el areglo de diccionarios con la informacion del json recibido
    func parseJsonAnswer(json: JSON){
        for result in json["results"].arrayValue{
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let signature = result["signatureCount"].stringValue
            let obj = ["title" : title, "body" : body, "signature" : signature]
            petitions.append(obj)
        }
        tableView.reloadData()
    }
    
    
    //Metodo que muestra una alerta cuando se presenta un error en la decodificaion del JSON
    func showError(){
        let alert = UIAlertController(title: "Loading error", message: "The JSON answer could not be processed, please check your connection and try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    //Este metodo establece el numero de filas que debe mostrar la tabla
    //Este metodo se activara cuando iOS quiera saber cuantas filas hay en la vista de tabla
    //El primer parametro corresponde a la vista que activo el metodo
    //El segundo parametro indica la sección (las tablas pueden dividirse en secciones, como la aplicación contactos tien una seccion por cada letra del abecedario)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    //Este metodo especifica como se vera cada fila
    //Este metodo permite reutilizar las vistas de las filas para crear unicamente las que se pueden ver
    //El primer parametro corresponde a la vista que activo el metodo
    //El segundo parametro determina la fila que se va a mostrar (indexPath.row->indica la fila e indexPath.section->indica la seccion)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //celda reutilizada
        let  cellItem = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        //Titulo de la celda
        cellItem.textLabel?.text = petition["title"]
        //Subtitulo de la celda
        cellItem.detailTextLabel?.text = petition["body"]
        return cellItem
    }
    
    //Cuando se selecciona un item del listado se lanza la vista de detalle
    //La vista de detalle no posee un ViewControllee en el storyboard solo el archivo DetailViewController.swift
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = DetailViewController()
        viewController.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


/*
 JSON RESPUESTA A LA CONSULTA: "https://api.whitehouse.gov/v1/petitions.json?limit=100"
 
 
 {
 "metadata":{
 "responseInfo":{
 "status":200,
 "developerMessage":"OK",
 }
 },
 "results":[
 {
 "title":"Legal immigrants should get freedom before undocumented immigrants – moral, just and fair",
 "body":"I am petitioning President Trump's Administration to take a humane view of the plight of legal immigrants. Specifically, legal immigrants in Employment Based (EB) category. I believe, such immigrants were short changed in the recently announced reforms via Executive Action (EA), which was otherwise long due and a welcome announcement.",
 "issues":[
 {
 "id":"28",
 "name":"Human Rights"
 },
 {
 "id":"29",
 "name":"Immigration"
 }
 ],
 "signatureThreshold":100000,
 "signatureCount":267,
 "signaturesNeeded":99733,
 },
 {
 "title":"National database for police shootings.",
 "body":"There is no reliable national data on how many people are shot by police officers each year. In signing this petition, I am urging the President to bring an end to this absence of visibility by creating a federally controlled, publicly accessible database of officer-involved shootings.",
 "issues":[
 {
 "id":"28",
 "name":"Human Rights"
 }
 ],
 "signatureThreshold":100000,
 "signatureCount":17453,
 "signaturesNeeded":82547,
 }
 ]
 }
 
 */
