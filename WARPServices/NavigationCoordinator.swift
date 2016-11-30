//
//  NavigationCoordinator.swift
//  WARPServices
//
//  Created by Oleksii on 23/11/2016.
//  Copyright © 2016 Oleksii Dykan. All rights reserved.
//

import UIKit

public protocol NavigationCoordinator: class {
    var childCoordinators: [NavigationCoordinator] { get set }
    func start()
    func remove<T: NavigationCoordinator>(child coordinator: T)
}

public extension NavigationCoordinator {
    public func remove<T: NavigationCoordinator>(child coordinator: T) {
        if let indexOfChild = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: indexOfChild)
        }
    }
}

public protocol RootNavigationCoordinator: NavigationCoordinator {
    var window: UIWindow { get }
    
    init(window: UIWindow)
    func setup<T: UIViewController>(rootController: T)
}

public protocol RootCoordinatorContainer: class {
    associatedtype CoordinatorType: RootNavigationCoordinator
    
    var window: UIWindow? { get set }
    var coordinator: CoordinatorType! { get set }
}

public extension RootNavigationCoordinator {
    public func setup<T: UIViewController>(rootController: T) {
        window.backgroundColor = .white
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}

public extension RootCoordinatorContainer {
    public func setupCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window = window
        coordinator = CoordinatorType(window: window)
    }
}
