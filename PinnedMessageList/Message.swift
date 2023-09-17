//
//  Message.swift
//  PinnedMessageList
//
//  Created by Gökhan Bozkurt on 17.09.2023.
//

import Foundation

struct Message: Identifiable {
   
    var id: Int
    var name: String
    var message: String
    var profile: String
    var offset: CGFloat
}
