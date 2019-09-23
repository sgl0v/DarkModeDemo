//
//  Created by Maksym Shcheglov on 23/09/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import UIKit

protocol ThemeProvider: class {
    var theme: Theme { get }
    func register<Observer: Themeable>(observer: Observer)
    func toggleTheme()
}

class LegacyThemeProvider: ThemeProvider {
    static let shared = LegacyThemeProvider()
    var theme: Theme {
	    didSet {
    	    UserDefaults.standard.set(theme == .dark, forKey: "isDark")
    	    notifyObservers()
	    }
    }
    private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()

    private init() {
	    self.theme = UserDefaults.standard.bool(forKey: "isDark") ? .dark : .light
    }

    func toggleTheme() {
	    theme = theme == .light ? .dark : .light
    }

    func register<Observer: Themeable>(observer: Observer) {
	    observer.apply(theme: theme)
	    self.observers.add(observer)
    }

    private func notifyObservers() {
	    DispatchQueue.main.async {
    	    self.observers.allObjects
	    	    .compactMap({ $0 as? Themeable })
	    	    .forEach({ $0.apply(theme: self.theme) })
	    }
    }
}

@available(iOS 13.0, *)
public class DefaultThemeProvider: NSObject, ThemeProvider {
    static let shared = DefaultThemeProvider()
    let theme: Theme = .adaptive

    private override init() {
	    super.init()
    }

    func register<Observer: Themeable>(observer: Observer) {
	    observer.apply(theme: theme)
    }

    func toggleTheme() {
	    assertionFailure("The function \(DefaultThemeProvider.self).\(#function) shouldn't be used!")
    }
}
