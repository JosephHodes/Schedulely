//
//  ContentView.swift
//  Shared
//
//  Created by joseph on 9/22/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskList.title, ascending: true)],
        animation: .none)
    private var items: FetchedResults<TaskList>
    @State private var title:String = "hii"
    @State private var isCreatingTask:Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: Text("Item at \(item.title!)")) {
                            Text(item.title!)
                            
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                Button("add Task") {
                    isCreatingTask.toggle()
                }.popover(isPresented: $isCreatingTask){
                    NewTaskView()
                }
            }
            .navigationTitle("Scheduley")
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    
                }
            }
            Text("Select an item")
            
        }
        
    }
    
    private func addItem() {
        withAnimation {
            let newItem = TaskList(context: viewContext)
            newItem.title = title
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
