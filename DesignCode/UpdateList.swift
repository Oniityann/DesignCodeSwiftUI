//
//  UpdateList.swift
//  DesignCode
//
//  Created by PH on 2021/1/14.
//

import SwiftUI

struct UpdateList: View {
  @ObservedObject var store = UpdateStore()
  
  func addUpdate() {
    store.updates.append(Update(image: "Card1", title: "New Item", text: "text", date: "Jan 1"))
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(store.updates) { update in
          NavigationLink(destination: UpdateDetail(update: update)) {
            HStack(alignment: .top) {
              Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
              
              VStack(alignment: .leading, spacing: 8.0) {
                Text(update.title)
                  .font(.system(size: 20, weight: .bold))
                
                Text(update.text)
                  .lineLimit(2)
                  .font(.subheadline)
                  .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                
                Text(update.date)
                  .font(.caption)
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            }
            .padding(.vertical, 8)
          }
        }
        .onDelete { indexSet in
          store.updates.remove(at: indexSet.first!)
        }
        .onMove{ indices, newOffset in
          store.updates.move(fromOffsets: indices, toOffset: newOffset)
        }
      }
      .navigationBarTitle(Text("Updates"))
      .navigationBarItems(
        leading: Button(action: addUpdate) {
        Text("Add Update")
      },
        trailing: EditButton()
      )
      .listStyle(PlainListStyle())
      
    }
  }
}

struct UpdateList_Previews: PreviewProvider {
  static var previews: some View {
    UpdateList()
  }
}
