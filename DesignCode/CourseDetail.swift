//
//  CourseDetail.swift
//  DesignCode
//
//  Created by ph on 2021/1/23.
//

import SwiftUI

struct CourseDetail: View {
  var course: Course
  @Binding var show: Bool
  @Binding var active: Bool
  @Binding var activeIndex: Int
  
  var body: some View {
    ScrollView {
      VStack {
        VStack {
          HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8.0) {
              Text(course.title)
                .font(.system(size: 24.0, weight: .bold))
                .foregroundColor(.white)
              
              Text(course.subtitle)
                .foregroundColor(Color.white.opacity(0.7))
            }
            
            Spacer()
            
            Image(systemName: "xmark")
              .font(.system(size: 16.0, weight: .medium, design: .default))
              .frame(width: 36, height: 36)
              .foregroundColor(.white)
              .background(Color.black)
              .clipShape(Circle())
              .onTapGesture {
                show = false
                active = false
                activeIndex = -1
              }
          }
          
          Spacer()
          
          Image(uiImage: course.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .frame(height: 140, alignment: .top)
        }
        .padding(show ? 30 : 20)
        .padding(.top, show ? 30 : 0)
        .frame(maxWidth: show ? .infinity : Screen.width - 60, maxHeight: show ? 460 : 280)
        .background(Color(course.color))
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .shadow(color: Color(course.color).opacity(0.3), radius: 20.0, x: 0.0, y: 20.0)
        
        VStack(alignment: .leading, spacing: 30.0) {
          Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
          
          Text("About this course")
            .font(.title)
            .bold()
          
          Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
          
          Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
        }
        .padding(30.0)
      }
      .edgesIgnoringSafeArea(.all)
    }
  }
}

struct CourseDetail_Previews: PreviewProvider {
  static var previews: some View {
    CourseDetail(course: CourseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
  }
}
