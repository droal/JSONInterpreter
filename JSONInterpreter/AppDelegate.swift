//
//  AppDelegate.swift
//  JSONInterpreter
//
//  Created by AppDev on 20/04/18.
//  Copyright © 2018 Droal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    //este metodo es llamado por el sistema operativo cuando la aplicacion esta lista para ejecutarse
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        //Se crea un duplicado ViewControllerenvuelto dentro de un navigationController, le da un nuevo elemento de tabBar para distinguirlo de la pestaña existente y luego lo agrega a la lista de pestañas visibles. Esto permite usar la misma clase para ambas pestañas sin tener que duplicar cosas en el storyboard.
        
        //se valida si se tiene listo el controlador de vista inicial "rootViewController"
        //enun storyboard conuna sola vista el controlador de vista raiz es un ViewController, pero en este caso el view controler se encuentra embebido dentro de un NavigationController a su vez embebido en un TabBarController, por tanto el controlador raiz es un UITabBarController
        if let tabBarController = window?.rootViewController as? UITabBarController{
            //Se obtiene una referencia al archivo Main.storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //se obtiene una instancia del navigationController mediante su identificador
            let viewController = storyboard.instantiateViewController(withIdentifier: "NavController")
            //se crea un objeto UITabBarItem (con icono .topRated y etiqueta 1) dentro del viewController anterior
            viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
            //agregar el nuevo viewController a la matriz de viewControlers del UITabBarController
            tabBarController.viewControllers?.append(viewController)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

