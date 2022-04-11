//
//  EditLocationView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 12/29/21.
//

import SwiftUI

struct EditLocationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var location: Location
    var onSave: (Location) -> Void
                
    @State private var title: String
    @State private var color: String
    @State private var icon: String
    @State private var items: [Item]
    
    var saveLocationToolBarItem: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarTrailing) {
            
            Button(Strings.save) {

                var newLocation = location
                newLocation.id = UUID()
                newLocation.title = title
                newLocation.color = color
                newLocation.icon = icon
                newLocation.items = items
                
                onSave(newLocation)
                dismiss()

            }
            
        }
        
    }
    
    var dismissToolBarItem: some ToolbarContent {
        
        ToolbarItem(placement: .navigationBarLeading) {
            
            Button(Strings.dismiss) { dismiss() }
            
        }
        
    }

    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _title = State(initialValue: location.title)
        _color = State(initialValue: location.color)
        _icon = State(initialValue: location.icon)
        _items = State(initialValue: location.items)
        
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    TextField(Strings.locationName, text: $title)
                    
                }
                
                Section(header: Text(Strings.color)) {
                    
                    ColorSelectionView(color: $color)
                    
                }
                
                Section(header: Text(Strings.icon)) {
                    
                    IconSelectionView(icon: $icon, color: $color)
                    
                }
                
                Section(header: Text(Strings.items)) {
                    
                    ForEach(items) { item in
                        
                        HStack(spacing: 5) {
                            
                            NavigationLink {
                                
                                EditItemView(item: item) { newItem in
                                    
                                    if let index = items.firstIndex(of: item) {
                                        
                                        items[index] = newItem
                                        
                                    }
                                    
                                }
                                
                            } label: {
                                
                                ItemView(item: item)
                                
                            }
                           
                            
                        }
                        
                    }
                    .onDelete(perform: withAnimation { delete })
                    .listStyle(.grouped)
                    
                    Button {
                        
                        withAnimation {
                            
                            let newItem = Item(id: UUID(), title: Strings.name, color: color)
                            items.append(newItem)
                            
                        }
                        
                    } label: {
                        
                        Text(Strings.addNewItem)
                            .foregroundColor(Color(color))
                        
                    }

                    
                }
                
            }
            .navigationTitle(Strings.locationDetails)
            .animation(.easeInOut, value: 0)
            .toolbar {
                
                saveLocationToolBarItem
                dismissToolBarItem
                
            }
            
        }
        
    }
    
    func delete(at offsets: IndexSet) {

        items.remove(atOffsets: offsets)

    }
    
}

struct EditLocationView_Previews: PreviewProvider {
    static var previews: some View {
        EditLocationView(location: Location.example) { _ in }
    }
}
