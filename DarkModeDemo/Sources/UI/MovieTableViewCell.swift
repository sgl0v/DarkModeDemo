//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
	    themeProvider.register(observer: self)
    }

    override func prepareForReuse() {
	    super.prepareForReuse()
	    apply(theme: themeProvider.theme)
    }
}

extension MovieTableViewCell: Themeable {

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        titleLabel.textColor = theme.textColor
	    descriptionLabel.textColor = theme.descriptionTextColor
    }

}
