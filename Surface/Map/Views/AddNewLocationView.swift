//
//  AddNewLocationView.swift
//  Surface
//
//  Created by Brandon Rodriguez on 1/4/22.
//

import SwiftUI

struct AddNewLocationView: View {
    
    var body: some View {
        
        Image(systemName: SFSymbols.plus)
            .foregroundColor(.blue)
            .padding()
            .background(.black.opacity(0.75))
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .padding(.trailing)
        
    }
    
}

struct AddNewLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewLocationView()
    }
}
