//
//  SceneDelegate.swift
//  UITableView
//
//  Created by Arthur Sh on 28.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)

        let vc = ViewController()
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }


}

