//
//  Person.swift
//  CreditWallet
//
//  Created by Tatiana Lazarenko on 7/21/24.
//

import Foundation
import SwiftData

protocol Subscriber : AnyObject {
    func update(subject : Person )
}

@Model
struct Person {
    private var subscribers : [WeakSubscriber] = []
    
    let name: String
    let surname: String
    let password: String
    var credits: [Credit]
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    init(subscribers: [WeakSubscriber], name: String, surname: String, password: String, credits: [Credit]) {
        self.subscribers = subscribers
        self.name = name
        self.surname = surname
        self.password = password
        self.credits = credits
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
        subscribers.forEach { $0.value?.update(subject: self)
        }
    }
}

struct WeakSubscriber {
    weak var value : Subscriber?
}
