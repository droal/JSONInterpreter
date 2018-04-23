Aplicación que hace peticiones a un sitio web, la respuesta recibida en formato JSON es analizada y formateada para mostrarse al usuario de forma ordenada


- Implementa UITableViewController 
- Implementa UITabBarController junto con UINavigationController
- Implementa diccionarios
- Emplea el archivo "SwiftyJSON.swift" como librería para analizar (parse) la estructura JSON recibida
- Emplea etiquetas Html para mostrar parte del JSON en un navegador web (WKWebView)
- La vista de detalle no posee un ViewController en el storyboard, es lanzada por código
- Se agrega por código, en el archivo "AppDelegate.swift", un segundo ViewController a la barra de pestañas, este segundo ViewController no tiene controlador en el storyboard
- Se agrega por código un segundo Tab al TabBarController