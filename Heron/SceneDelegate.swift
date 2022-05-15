import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    /// The window hosted by the scene delegate.
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo: UISceneSession, options: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
    }
}
