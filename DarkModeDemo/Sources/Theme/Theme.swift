//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import UIKit

struct Theme: Equatable {
    static let light = Theme(type: .light, colors: .light)
    static let dark = Theme(type: .dark, colors: .dark)
    @available(iOS 13.0, *)
    static let adaptive = Theme(type: .adaptive, colors: .adaptive)

    enum `Type` {
	    case light
	    case dark
	    @available(iOS 13.0, *)
	    case adaptive
    }
    let type: Type

    let backgroundColor: UIColor
    let textColor: UIColor
    let descriptionTextColor: UIColor

    let separatorColor: UIColor
    let tableViewBackground: UIColor

    let navbarTintColor: UIColor
    let navbarStyle: UIBarStyle

    let switchTintColor: UIColor

    init(type: Type, colors: ColorPalette) {
	    self.type = type
	    self.backgroundColor = colors.background
	    self.textColor = colors.foreground
	    self.descriptionTextColor = colors.secondary
	    self.separatorColor = colors.secondary
	    self.tableViewBackground = colors.secondaryBackground
	    self.navbarTintColor = colors.tint
	    self.navbarStyle = type == .dark ? .black : .default
	    self.switchTintColor = colors.tint
    }

    public static func == (lhs: Theme, rhs: Theme) -> Bool {
	    return lhs.type == rhs.type
    }
}
