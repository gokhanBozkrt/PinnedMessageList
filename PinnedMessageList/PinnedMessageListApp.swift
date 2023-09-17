//
//  PinnedMessageListApp.swift
//  PinnedMessageList
//
//  Created by Gökhan Bozkurt on 17.09.2023.
//

import SwiftUI

@main
struct PinnedMessageListApp: App {
    @StateObject var messageVM = MessageVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(messageVM)
        }
    }
}
