//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

struct Styles {
    let navbarStyle: UIBarStyle

    static let light: Styles = .init(navbarStyle: .default)
    static let dark: Styles = .init(navbarStyle: .black)
    @available(iOS 13.0, *)
    static let adaptive: Styles = .init(navbarStyle: .default)
}
