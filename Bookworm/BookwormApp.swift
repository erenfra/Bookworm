//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Renato Oliveira Fraga on 8/3/21.
//

import SwiftUI

@main
struct BookwormApp: App {
    let context = PersistentContainer.persistentContainer.viewContext
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, context)
        }
    }
}
