//
//  HeaderView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 14/08/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtittle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background) // corrected from foregroundStyle
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title) // use variable, not string literal
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subtittle) // use variable
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "My Title",
        subtittle: "My Subtitle",
        angle: 15,
        background: .blue
    )
}
