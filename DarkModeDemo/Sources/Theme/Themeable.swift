//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

protocol Themeable: class {
    func apply(theme: Theme)
}

extension Themeable where Self: UITraitEnvironment {
    var themeProvider: ThemeProvider {
        if #available(iOS 13.0, *) {
            return DefaultThemeProvider.shared
        } else {
            return LegacyThemeProvider.shared
	    }
    }
}
