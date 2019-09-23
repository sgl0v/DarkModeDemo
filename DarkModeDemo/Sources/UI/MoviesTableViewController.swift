//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
	    configureUI()
	    themeProvider.register(observer: self)
    }

    private func configureUI() {
	    if #available(iOS 13.0, *) {
    	    navigationItem.leftBarButtonItem = nil
	    }
    }
}

extension MoviesTableViewController: Themeable {
    func apply(theme: Theme) {
	    tableView.backgroundColor = theme.tableViewBackground
	    tableView.separatorColor = theme.separatorColor
    }
}
