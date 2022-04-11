//
//  EditItemView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 1/4/22.
//

import SwiftUI

struct EditItemView: View {
    
    var item: Item
    var onSave: (Item) -> Void
    
    @State private var title: String
    @State private var color: String
    
    init(item: Item, onSave: @escaping (Item) -> Void) {
        self.item = item
        self.onSave = onSave
        
        _title = State(initialValue: item.title)
        _color = State(initialValue: item.color)
        
    }
    
    var body: some View {
        
        Form {
            
            Section(header: Text(Strings.title)) {
                
                TextField(Strings.enterTitle, text: $title)
                
            }
            
            Section(header: Text(Strings.color)) {
                
                ColorSelectionView(color: $color)
                
            }
            
            Button {
                
                var newItem = item
                newItem.id = UUID()
                newItem.title = title
                newItem.color = color
                
                onSave(newItem)
                
            } label: {
                
                Text(Strings.save)
                    .foregroundColor(Color(color))
                
            }
            
        }
        .navigationTitle(Strings.itemDetails)
        .animation(.easeInOut, value: 0)
        .onDisappear {
            
            var newItem = item
            newItem.id = UUID()
            newItem.title = title
            newItem.color = color
            
            onSave(newItem)
            
        }
        
    }
    
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(item: Item.example) { _ in }
    }
}
