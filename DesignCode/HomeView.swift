//
//  HomeView.swift
//  DesignCode
//
//  Created by PH on 2021/1/13.
//

import SwiftUI

struct HomeView: View {
  @Binding var showProfile: Bool
  @State var showUpdate = false
  
  var body: some View {
    ZStack {
      VStack {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8392156863, green: 0.8431372549, blue: 0.8901960784, alpha: 1)), Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .top, endPoint: .bottom)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        
        Spacer()
      }
      .offset(y: -50.0)
      
      VStack {
        HStack {
          Text("Watching")
            .font(.system(size: 28, weight: .bold))
          
          Spacer()
          
          AvatarView(showProfile: $showProfile)
          
          Button(action: {
            showUpdate.toggle()
          }, label: {
            Image(systemName: "bell")
              .renderingMode(.original)
              .font(.system(size: 16, weight: .medium))
              .frame(width: 36, height: 36)
              .background(Color.white)
              .clipShape(Circle())
              .shadow(color: Color.black.opacity(0.1), radius: 1.0, x: 0.0, y: 1.0)
              .shadow(color: Color.black.opacity(0.2), radius: 20.0, x: 0.0, y: 10.0)
          })
          .sheet(isPresented: $showUpdate) {
            ContentView()
          }
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.leading, 14)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 20) {
            ForEach(SectionData) { section in
              GeometryReader { geometry in
                SectionView(section: section)
                  .rotation3DEffect(
                    Angle(degrees: Double(geometry.frame(in: .global).minX - 30.0) / -20.0),axis: (x: 0.0, y: 5.0, z: 0.0)
                  )
              }
              .frame(width: 275, height: 275)
            }
          }
          .padding(30)
          .padding(.bottom, 30)
        }
        
        Spacer()
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(showProfile: .constant(false))
  }
}

struct SectionView: View {
  var section: Section
  
  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Text(section.title)
          .font(.system(size: 24, weight: .bold, design: .default))
          .frame(width: 160, alignment: .leading)
          .foregroundColor(.white)
        
        Spacer()
        
        Image(section.logo)
      }
      
      Text(section.text.uppercased())
        .frame(maxWidth: .infinity, alignment: .leading)
      
      section.image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: 275, height: 275)
    .background(section.color)
    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .shadow(color: section.color.opacity(0.3), radius: 20, x: 0.0, y: 20.0)
  }
}

struct Section: Identifiable {
  var id = UUID()
  var title: String
  var text: String
  var logo: String
  var image: Image
  var color: Color
}

let SectionData = [
  Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
  Section(title: "Build a SwiftUI App", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
  Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card5")), color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))),
]
