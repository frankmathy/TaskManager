//
//  ContentView.swift
//  TaskManager
//
//  Created by Frank Mathy on 24.02.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection : TaskSection? = TaskSection.all
    @State private var allTasks = Task.examples()
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            switch(selection) {
            case .all:
                TaskListView(title: "All", tasks: $allTasks)
            case .done:
                StaticTaskListView(title: "All", tasks: allTasks.filter({$0.isCompleted}))
            case .upcoming:
                StaticTaskListView(title: "All", tasks: allTasks.filter({!$0.isCompleted}))
            case .list(let taskGroup):
                StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            case .none:
                Text("None")
            }
        }
    }
}

#Preview {
    ContentView()
}
