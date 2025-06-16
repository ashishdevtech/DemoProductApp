//
//  ProductCoordinator.swift
//  DemoProductApp
//
//  Created by Ashish Pal on 16/06/25.
//

protocol ProductCoordinator {
    func push(_ destination: ProductDestination)
    func pop()
    func popToRoot()
}
