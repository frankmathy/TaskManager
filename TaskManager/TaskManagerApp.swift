//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Frank Mathy on 24.02.24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add new Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem) {
                Button("Add new Group") {
                    
                }
            }
        }
        
        WindowGroup("Special window") {
            Text("Special Window").frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .defaultPosition(.leading)
        
        Settings {
            Text("Setting")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        MenuBarExtra("Menu") {
            Button("Do something amazing") {
                
            }
        }
    }
}
