//
//  ProgressBarView.swift
//  ToDoListPrBar


import SwiftUI

struct ProgressBarView: View {
    
    var width: CGFloat = 300
    var height: CGFloat = 14
    
    var percent: CGFloat = 0.0
    //Will be initialized in ContentView
   
  
    var body: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: width, height: height)
                .foregroundColor(.black.opacity(0.3))
            
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width: width * percent, height: height)
                .foregroundColor(.green)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
