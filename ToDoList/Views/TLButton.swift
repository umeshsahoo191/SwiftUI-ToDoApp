//
//  TLButton.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 10/10/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Value", background: .pink)
    {
        //action
    }
}
