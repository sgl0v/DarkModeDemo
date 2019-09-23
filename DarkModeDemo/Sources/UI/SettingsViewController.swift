//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet private weak var cell: UITableViewCell!
    private let themeSwitch = UISwitch()

    override func viewDidLoad() {
	    super.viewDidLoad()
	    themeSwitch.addTarget(self, action: #selector(didTap(switchView:)), for: .valueChanged)
	    cell.accessoryView = themeSwitch
	    tableView.tableFooterView = UIView()
	    themeProvider.register(observer: self)
    }

    @objc func didTap(switchView: UISwitch) {
	    themeProvider.toggleTheme()
    }
}

extension SettingsViewController: Themeable {
    func apply(theme: Theme) {
	    tableView.backgroundColor = theme.tableViewBackground
	    tableView.separatorColor = theme.separatorColor

	    cell.backgroundColor = theme.backgroundColor
	    cell.textLabel?.textColor = theme.textColor
	    themeSwitch.onTintColor = theme.switchTintColor
	    themeSwitch.isOn = theme == .dark
    }

}
