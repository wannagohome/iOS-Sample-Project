import UIKit
import NeedleFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        registerProviderFactories()
        
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(navigationController)
        self.coordinator = coordinator
        coordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}
