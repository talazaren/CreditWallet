//
//  ServiceLocator.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

protocol ServiceLocating {
    func register<T>(service: T)
    func resolve<T>() -> T?
}

// Реализация DI, вдохновленная Swinject
final class ServiceLocator: ServiceLocating {

    static let shared = ServiceLocator()

    private lazy var services = [String: Any]()

    private init() {}

    private func typeName(_ some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }

    // Регистрация зависимости
    func register<T>(service: T) {
        let key = typeName(T.self)
        services[key] = service
    }

    // Получение ранее зарегистрированной зависимости
    func resolve<T>() -> T? {
        let key = typeName(T.self)
        return services[key] as? T
    }
}
