//
//  Person.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation

protocol Subscriber : AnyObject {
    func updatePerson(subject : Person )
    func updateCredit(subject : Credit )
}

struct Person {
    private lazy var subscribers : [WeakSubscriber] = []
    
    let name: String
    let surname: String
    let password: String
    let avatar: String
    var credits: [Credit]
    
    var fullName: String {
        "\(name)\n\(surname)"
    }
    
    mutating func subscribe(_ subscriber: Subscriber) {
        print("subscribed")
        subscribers.append(WeakSubscriber(value: subscriber))
    }
        
    mutating func unsubscribe(_ subscriber: Subscriber) {
        subscribers.removeAll(where: { $0.value === subscriber })
        print("unsubscribed")
    }
        
    mutating func notify() {
        subscribers.forEach { $0.value?.updatePerson(subject: self) }
    }
}

struct WeakSubscriber {
    weak var value : Subscriber?
}

extension Person {
    static let mockUser = Person(
        name: "Владимир",
        surname: "Путин",
        password: "j2i45fosd9",
        avatar: "Putin",
        credits: [
            Credit(
                name: "2-шка в центре Москвы",
                percent: 8,
                fullCost: 25_000_000,
                initialFee: 10_000_000,
                term: 30),
            Credit(
                name: "Замок на берегу Сочи",
                percent: 15,
                fullCost: 50_000_000,
                initialFee: 20_000_000,
                term: 10)
        ]
    )
}
