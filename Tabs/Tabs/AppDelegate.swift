import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let mainViewController = MainViewController()

        let navigationController = UINavigationController(rootViewController: mainViewController)

        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()

        return true
    }

}

