//
//  NavigationCoordinator.swift
//  WARPServices
//
//  Created by Oleksii on 23/11/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

protocol NavigationCoordinator {
    var childCoordinators: [NavigationCoordinator] { get }
    func start()
}

protocol RootNavigationCoordinator: NavigationCoordinator {
    var window: UIWindow { get }
    
    init(window: UIWindow)
    func setup<T: UIViewController>(rootController: T)
}

protocol RootCoordinatorContainer: class {
    associatedtype CoordinatorType: RootNavigationCoordinator
    
    var window: UIWindow? { get set }
    var coordinator: CoordinatorType! { get set }
}

extension RootNavigationCoordinator {
    func setup<T: UIViewController>(rootController: T) {
        window.backgroundColor = .white
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}

extension RootCoordinatorContainer {
    func setupCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window = window
        coordinator = CoordinatorType(window: window)
    }
}
