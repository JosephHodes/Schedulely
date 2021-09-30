//
//  SwiftUIView.swift
//  Schedulely
//
//  Created by joseph on 9/24/21.
//

import SwiftUI

struct NewTaskView: View {
    @State private var title:String = ""
    @State private var date:Date = Date()
    private let currentDate:Date = Date()
    
    var body: some View {
        Text("Enter your birthday")
            .font(.largeTitle)
        DatePicker("Enter your birthday", selection: $date,in: Date()...)
            
        TextField("Enter title of task",text:$title)
        Button("add task"){
            
        }.disabled(title.isEmpty || date == currentDate)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
