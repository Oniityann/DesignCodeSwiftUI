//
//  Modifiers.swift
//  DesignCode
//
//  Created by PH on 2021/1/15.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: Color.black.opacity(0.1), radius: 1.0, x: 0.0, y: 1.0)
      .shadow(color: Color.black.opacity(0.1), radius: 10.0, x: 0.0, y: 12.0)
  }
}

struct FontModifier: ViewModifier {
  var style: Font.TextStyle = .body
  
  func body(content: Content) -> some View {
    content
      .font(.system(style, design: .default))
  }
}

struct CustomFontModifier: ViewModifier {
  var size: CGFloat = 28.0
  
  func body(content: Content) -> some View {
    content.font(.custom("WorkSans-Bold", size: size))
  }
}
