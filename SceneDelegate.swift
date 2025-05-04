// File: SceneDelegate.swift
// Inicializa a janela em modo Dark

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        // Força modo escuro nesta janela
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .dark
        }
        // Define o storyboard inicial (Main.storyboard)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateInitialViewController()
        window?.makeKeyAndVisible()
    }
}
