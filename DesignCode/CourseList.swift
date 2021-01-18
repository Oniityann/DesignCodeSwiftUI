//
//  CourseList.swift
//  DesignCode
//
//  Created by ph on 2021/1/18.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
      VStack {
        CourseView()
      }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
  @State var show = false
  
  var body: some View {
    ZStack {
      Text("aaaa")
      
      VStack {
        HStack(alignment: .top) {
          VStack(alignment: .leading, spacing: 8.0) {
            Text("SwiftUI Advanced")
              .font(.system(size: 24.0, weight: .bold))
              .foregroundColor(.white)
            
            Text("20 Sections")
              .foregroundColor(Color.white.opacity(0.7))
          }
          
          Spacer()
          
          Image(uiImage: #imageLiteral(resourceName: "Logo1"))
          
          
          HStack {
            Image(systemName: "xmark")
              .frame(width: 32, height: 32)
              .foregroundColor(.white)
              .background(Color.black)
              .clipShape(Circle())
          }
        }
        
        Spacer()
        
        Image(uiImage: #imageLiteral(resourceName: "Card2"))
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: .infinity)
          .frame(height: 140, alignment: .top)
      }
      .padding(show ? 30 : 20)
      .padding(.top, show ? 30 : 0)
      .frame(maxWidth: show ? .infinity : Screen.width - 60, maxHeight: show ? .infinity : 280)
      .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
      .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
      .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20.0, x: 0.0, y: 20.0)
      .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
      .onTapGesture {
        show.toggle()
      }
      .edgesIgnoringSafeArea(.all)
    }
  }
}
