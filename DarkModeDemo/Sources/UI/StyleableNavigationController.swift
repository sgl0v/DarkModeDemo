//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

class StyleableNavigationController: UINavigationController {

    override func viewDidLoad() {
	    super.viewDidLoad()
	    themeProvider.register(observer: self)
    }
}

extension StyleableNavigationController: Themeable {
    func apply(theme: Theme) {
	    navigationBar.backgroundColor = theme.backgroundColor
	    navigationBar.barStyle = theme.navbarStyle
	    navigationBar.tintColor = theme.navbarTintColor
    }
}
