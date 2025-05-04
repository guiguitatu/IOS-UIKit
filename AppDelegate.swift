import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Força modo escuro em todo o app (iOS 13+)
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .dark
        }
        // Configurações globais de aparência
        configureGlobalAppearance()
        return true
    }

    private func configureGlobalAppearance() {
        // Fundo geral
        UIView.appearance().backgroundColor = .darkGray
        // Texto branco em UILabels e UITextViews
        UILabel.appearance().textColor = .white
        UITextView.appearance().backgroundColor = .darkGray
        UITextView.appearance().textColor = .white
        // CollectionView
        UICollectionView.appearance().backgroundColor = .darkGray
        // Navigation Bar (se usar)
        UINavigationBar.appearance().barTintColor = .darkGray
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // Não há nada a fazer aqui para este caso
    }
}
