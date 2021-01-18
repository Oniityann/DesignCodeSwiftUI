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
    ZStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 30.0) {
        Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
        
        Text("About this course")
          .font(.title)
          .bold()
        
        Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
        
        Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
      }
      .padding(30.0)
      .frame(maxWidth: show ? .infinity : Screen.width - 60, maxHeight: show ? .infinity : 280)
      .offset(y: show ? 460 : 0)
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
      .shadow(color: Color.black.opacity(0.2), radius: 20.0, x: 0.0, y: 20.0)
      .opacity(show ? 1 : 0)
      
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
          
          ZStack {
            Image(systemName: "xmark")
              .font(.system(size: 16.0, weight: .medium, design: .default))
              .frame(width: 36, height: 36)
              .foregroundColor(.white)
              .background(Color.black)
              .clipShape(Circle())
              .opacity(show ? 1.0 : 0.0)
            
            Image(uiImage: #imageLiteral(resourceName: "Logo1"))
              .opacity(show ? 0.0 : 1.0)
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
      .frame(maxWidth: show ? .infinity : Screen.width - 60, maxHeight: show ? 460 : 280)
      .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
      .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
      .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20.0, x: 0.0, y: 20.0)
      
      .onTapGesture {
        show.toggle()
      }
    }
    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    .edgesIgnoringSafeArea(.all)
  }
}
