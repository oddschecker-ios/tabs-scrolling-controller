import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let mainViewController = MainViewController()

        let navigationController = UINavigationController(rootViewController: mainViewController)
        styleNavigationController(navigationController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

    private func styleNavigationController(_ navigationController: UINavigationController) {
        let navigationBar = navigationController.navigationBar
        navigationController.view.backgroundColor = .clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.barTintColor = .yellow
        navigationBar.tintColor = .white
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 15)
        ]
    }

}

