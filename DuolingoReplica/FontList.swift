//
//  FontList.swift
//  DuolingoReplica
//
//  Created by Claudia Tobias on 10/11/25.
//

import SwiftUI

struct FontListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(UIFont.familyNames.sorted(), id: \.self) { family in
                    Text("Family: \(family)")
                        .font(.headline)
                        .padding(.top)
                    
                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self) { name in
                        Text(name)
                            .font(.custom(name, size: 16))
                            .padding(.leading)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    FontListView()
}
