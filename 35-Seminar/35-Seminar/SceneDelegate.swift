//
//  SceneDelegate.swift
//  35-Seminar
//
//  Created by 한지석 on 8/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(windowScene: windowScene)
    let navigationController = UINavigationController(rootViewController: SignUpViewController())
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
  }
}
