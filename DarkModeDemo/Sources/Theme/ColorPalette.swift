//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import UIKit

struct ColorPalette {
    let foreground: UIColor
    let background: UIColor
    let secondaryBackground: UIColor
    let primary: UIColor
    let secondary: UIColor
    let complementary: UIColor
    let tint: UIColor

    static let light: ColorPalette = .init(
	    foreground: .black,
	    background: .white,
	    secondaryBackground: .groupTableViewBackground,
	    primary: UIColor(hue: 0.635, saturation: 0.101, brightness: 0.2, alpha: 1),
	    secondary: UIColor(white: 0.4, alpha: 1.0),
	    complementary: UIColor(white: 0.35, alpha: 1.0),
	    tint: UIColor(hue:0.620, saturation:0.75, brightness:1.0, alpha:1)
    )

    static let dark: ColorPalette = .init(
	    foreground:.white,
	    background: UIColor(white: 0.2, alpha: 1.0),
	    secondaryBackground: UIColor(white: 0.15, alpha: 1.0),
	    primary: UIColor(hue:0.121, saturation:0.144, brightness:0.793, alpha:1),
	    secondary: UIColor(white: 0.6, alpha: 1.0),
	    complementary: UIColor(white: 0.81, alpha: 1.0),
	    tint: UIColor(hue:0.129, saturation:0.702, brightness:0.992, alpha:1)
    )

    @available(iOS 13.0, *)
    static let adaptive: ColorPalette = .init(
	    foreground: UIColor.label,
	    background: UIColor(dynamicProvider: { traitCollection in
    	    return traitCollection.userInterfaceStyle == .light ? .white : UIColor(white: 0.2, alpha: 1.0)
	    }),
	    secondaryBackground: UIColor(dynamicProvider: { traitCollection in
    	    return traitCollection.userInterfaceStyle == .light ? .groupTableViewBackground : UIColor(white: 0.15, alpha: 1.0)
	    }),
	    primary: UIColor(dynamicProvider: { traitCollection in
    	    return traitCollection.userInterfaceStyle == .light ? UIColor(hue: 0.635, saturation: 0.101, brightness: 0.2, alpha: 1) : UIColor(hue:0.121, saturation:0.144, brightness:0.793, alpha:1)
	    }),
	    secondary: UIColor(dynamicProvider: { traitCollection in
    	    return traitCollection.userInterfaceStyle == .light ? UIColor(white: 0.4, alpha: 1.0) : UIColor(white: 0.6, alpha: 1.0)
	    }),
	    complementary: UIColor(dynamicProvider: { traitCollection in
    	    return traitCollection.userInterfaceStyle == .light ? UIColor(white: 0.35, alpha: 1.0) : UIColor(white: 0.81, alpha: 1.0)
	    }),
	    tint: UIColor(dynamicProvider: { traitCollection in
    	    return traitCollection.userInterfaceStyle == .light ? UIColor(hue:0.620, saturation:0.75, brightness:1.0, alpha:1) : UIColor(hue:0.129, saturation:0.702, brightness:0.992, alpha:1)
	    })
    )
}

