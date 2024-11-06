//
//  HeaderView.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 85)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -130)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 10, background: .blue)
}
