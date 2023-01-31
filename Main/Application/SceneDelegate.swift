//
//  SceneDelegate.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  var coordinator: AppCoordinator?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = getAppWindow(windowScene: windowScene)
  }
  
  private func getAppWindow(windowScene: UIWindowScene) -> UIWindow {
    let safeWindow = UIWindow(windowScene: windowScene)
    let navigation =  UINavigationController()

    safeWindow.frame = UIScreen.main.bounds
    safeWindow.makeKeyAndVisible()
    safeWindow.rootViewController = navigation

    coordinator = AppCoordinator(navigationController: navigation, listenUserAuthChanges: Factory.makeListenUserAuthChanges())
    coordinator?.start()

    return safeWindow
  }
}
