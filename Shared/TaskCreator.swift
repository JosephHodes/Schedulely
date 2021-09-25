//
//  SwiftUIView.swift
//  Schedulely
//
//  Created by joseph on 9/24/21.
//

import SwiftUI

struct TaskCreator: View {
    @State private var Title:String = "";
    @State private var date = Date()
    
    var body: some View {
        Text("Enter your birthday")
            .font(.largeTitle)
        DatePicker("Enter your birthday", selection: $date,in: Date()...)
            .frame(maxHeight: 400)
        TextField("Enter title of task",text:$Title)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreator()
    }
}
