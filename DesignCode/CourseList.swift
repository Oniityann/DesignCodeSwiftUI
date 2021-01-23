//
//  CourseList.swift
//  DesignCode
//
//  Created by ph on 2021/1/18.
//

import SwiftUI

struct CourseList: View {
  @State var courses = CourseData
  @State var active = false
  @State var activeIndex = -1
  @State var activeView = CGSize.zero
  
  var body: some View {
    ZStack {
      Color.black.opacity(Double(activeView.height) / 500.0)
        .animation(.linear)
        .edgesIgnoringSafeArea(.all)
      
      ScrollView {
        VStack(spacing: 30.0) {
          
          Text("Courses")
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 30)
            .blur(radius: active ? 20 : 0)
          
          ForEach(courses.indices, id: \.self) { index in
            GeometryReader { geometry in
              CourseView(
                show: $courses[index].show,
                active: $active,
                activeIndex: $activeIndex,
                activeView: $activeView,
                course: courses[index],
                index: index
              )
              .offset(y: courses[index].show ? -geometry.frame(in: .global).minY : 0)
              .opacity(activeIndex != index && active ? 0 : 1)
              .scaleEffect(activeIndex != index && active ? 0.5 : 1)
              .offset(x: activeIndex != index && active ? Screen.width : 0)
            }
            .frame(height: 280)
            .frame(maxWidth: courses[index].show ? .infinity : Screen.width - 60)
            .zIndex(courses[index].show ? 1 : 0)
          }
        }
        .frame(width: Screen.width)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
      }
      .statusBar(hidden: active ? true : false)
      .animation(.linear)
    }
  }
}

struct CourseList_Previews: PreviewProvider {
  static var previews: some View {
    CourseList()
  }
}

struct CourseView: View {
  @Binding var show: Bool
  @Binding var active: Bool
  @Binding var activeIndex: Int
  @Binding var activeView: CGSize
  var course: Course
  var index: Int
  
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
            Text(course.title)
              .font(.system(size: 24.0, weight: .bold))
              .foregroundColor(.white)
            
            Text(course.subtitle)
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
            
            Image(uiImage: course.logo)
              .opacity(show ? 0.0 : 1.0)
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
      .gesture(
        show ?
          DragGesture()
          .onChanged { value in
            guard value.translation.height < 300.0 else { return }
            guard value.translation.height > 0.0 else { return }
            activeView = value.translation
          }
          .onEnded { _ in
            if activeView.height > 50 {
              show = false
              active = false
              activeIndex = -1
            }
            activeView = .zero
          }
          : nil
      )
      .onTapGesture {
        show.toggle()
        active.toggle()
        if show {
          activeIndex = index
        } else {
          activeIndex = -1
        }
      }
      
      if show {
        CourseDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
          .background(Color.white)
          .animation(nil)
      }
    }
    .frame(height: show ? Screen.height : 280)
    .scaleEffect(1 - activeView.height / 1000.0)
    .rotation3DEffect(Angle(degrees: Double(activeView.height)/10.0), axis: (x: 0.0, y: 10.0, z: 0.0))
    .hueRotation(Angle(degrees: Double(activeView.height) / 10.0))
    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    .gesture(
      show ?
        DragGesture()
        .onChanged { value in
          guard value.translation.height < 300.0 else { return }
          guard value.translation.height > 0.0 else { return }
//          activeView = value.translation
        }
        .onEnded { _ in
          if activeView.height > 80.0 {
            show = false
            active = false
            activeIndex = -1
          }
          activeView = .zero
        }
        : nil
    )
    .edgesIgnoringSafeArea(.all)
  }
}

struct Course: Identifiable {
  var id = UUID()
  var title: String
  var subtitle: String
  var image: UIImage
  var logo: UIImage
  var color: UIColor
  var show: Bool
}

let CourseData = [
  Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Card6"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
  Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card5"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
  Course(title: "UI Design for Developers", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card1"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), show: false)
]
