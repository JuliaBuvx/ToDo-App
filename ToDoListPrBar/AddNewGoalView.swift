//
//  AddNewGoalView.swift
//  ToDoListPrBar
//
//  Created by Юлия Бубнова on 09.01.2023.
//

import SwiftUI

struct AddNewGoalView: View {
    
    @Environment (\.presentationMode) var presentaionMode
    @State var textFieldtext = ""
    var onSave: (_ title: String) -> Void
    var body: some View {
        
        VStack {
            TextField("Enter your goal here", text: $textFieldtext)
                .padding(20)
            .background(.green.opacity(0.1))
            .fontWeight(.bold)
            .cornerRadius(8)
            .padding(30)
            .foregroundColor(.black)
            
            Button(action: saveTapped,
                   label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).frame(width: 300, height: 50)
                        .foregroundColor(textFieldtext.count > 2 ? .green : .gray)
                    
                    Text("Save").foregroundColor(.white).font(.title)
                }
            }).disabled(textFieldtext.count < 2)

        }
        Spacer()
    }
    func saveTapped() {
        onSave(textFieldtext)
        presentaionMode.wrappedValue.dismiss()
    }
    
}

struct AddNewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoalView(onSave: { _ in })
    }
}
