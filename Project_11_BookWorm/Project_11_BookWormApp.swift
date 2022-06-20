//
//  Project_11_BookWormApp.swift
//  Project_11_BookWorm
//
//  Created by KARAN  on 19/06/22.
//

import SwiftUI

@main
struct Project_11_BookWormApp: App {
    
    @StateObject private var dataControler = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControler.container.viewContext)
        }
    }
}
