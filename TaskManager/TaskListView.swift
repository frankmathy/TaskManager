//
//  TaskListView.swift
//  TaskManager
//
//  Created by Frank Mathy on 24.02.24.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    
    @State private var inspectorIsShown: Bool = false
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task)
        }
        .toolbar {
            ToolbarItemGroup {
                Button {
                    tasks.append(Task(title: "New Task"))
                } label: {
                    Label("Add New Task", systemImage: "plus")
                }
                Button {
                    inspectorIsShown.toggle()
                } label: {
                    Label("Show inspector", systemImage: "sidebar.right")
                }
            }
        }
        .inspector(isPresented: $inspectorIsShown) {
            Text("show some details")
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
