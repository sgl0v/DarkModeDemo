//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var transitionHandle: Gagat.TransitionHandle!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureGagat()
        return true
    }

    private func configureGagat() {
        if #available(iOS 13.0, *) { return } // disable for iOS 13
        guard let styleableNavigationController = window!.rootViewController as? GagatStyleable else {
            assertionFailure("Failed to configure gagat!")
            return
        }
        let configuration = Gagat.Configuration(jellyFactor: 1.5)
        transitionHandle = Gagat.configure(for: window!, with: styleableNavigationController, using: configuration)
    }
}

extension StyleableNavigationController: GagatStyleable {

    func toggleActiveStyle() {
        themeProvider.toggleTheme()
    }
}
