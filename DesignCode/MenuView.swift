//
//  MenuView.swift
//  DesignCode
//
//  Created by PH on 2021/1/12.
//

import SwiftUI

struct MenuView: View {
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 16) {
        Text("Meng - 28% complete")
          .font(.caption)
        
        Color.white
          .frame(width: 38, height: 6)
          .cornerRadius(3.0)
          .shadow(radius: 10)
          .frame(width: 130, height: 6, alignment: .leading)
          .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
          .cornerRadius(3.0)
          .shadow(radius: 10)
          .padding()
          .frame(width: 150, height: 24)
          .background(Color.black.opacity(0.1))
          .cornerRadius(12.0)
          .shadow(radius: 20)
        
        MenuRow(title: "Account", icon: "gear")
        MenuRow(title: "Billing", icon: "creditcard")
        MenuRow(title: "Sign Out", icon: "person.crop.circle")
      }
      .frame(maxWidth: .infinity)
      .frame(height: 300)
      .background(
        LinearGradient(
          gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8650895357, green: 0.8951523304, blue: 0.9502195716, alpha: 1))]),
          startPoint: .top, endPoint: .bottom
        )
      )
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(
        color: Color.black.opacity(0.2),
        radius: 20.0,
        x: 0.0,
        y: 20.0
      )
      .padding(.horizontal, 30)
      .overlay(
        Image("Avatar")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 60, height: 60)
          .clipShape(Circle())
          .offset(y: -150)
      )
    }
    .padding(.bottom, 30)
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}

struct MenuRow: View {
  fileprivate var title: String
  fileprivate var icon: String
  
  var body: some View {
    HStack(spacing: 16) {
      Image (systemName: icon)
        .font(.system(size: 20, weight: .light))
        .imageScale(.large)
        .frame(width: 32, height: 32)
        .foregroundColor(Color(#colorLiteral(red: 0.6039215686, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
      
      Text(title)
        .font(.system(size: 20, weight: .bold, design: .default))
        .frame(width: 120, alignment: .leading)
    }
  }
}
