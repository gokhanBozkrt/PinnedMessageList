//
//  MessageVM.swift
//  PinnedMessageList
//
//  Created by Gökhan Bozkurt on 17.09.2023.
//

import Foundation

class MessageVM: ObservableObject {
        
    @Published var messages = [Message]()
    @Published var pinnedMessages = [Message]()
        
    init() {
        getAllMessage()
    }
        private func getAllMessage() {
            messages = [
            Message(id: 0, name: "Catherine", message: "Hi Kavsoft", profile: "p1", offset: 0),
            Message(id: 1, name: "Emma", message: "New Video !!!", profile: "p2", offset: 0),
            Message(id: 2, name: "Julie", message: "How Are You ???", profile: "p3", offset: 0),
            Message(id: 3, name: "Emily", message: "Hey iJustine", profile: "p4", offset: 0),
//            Message(id: 4, name: "Kaviya", message: "hello ????", profile: "p5", offset: 0),
            Message(id: 5, name: "Jenna", message: "Bye :)))", profile: "p6", offset: 0),
            Message(id: 6, name: "Juliana", message: "Nothing Much......", profile: "p7", offset: 0)
            ]
        }
        
        
    }

