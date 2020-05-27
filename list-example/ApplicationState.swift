//
//  ListItem.swift
//  list-example
//
//  Created by Ben Baran on 5/27/20.
//  Copyright © 2020 Ben Baran. All rights reserved.
//

import Foundation


class ApplicationState: ObservableObject {
    
    @Published var favorites = [ListItem]()
    
    @Published var others = [ListItem]()
}

class ListItem : Hashable {
    
    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    init(id: Int, name: String) {
        
        self.id = id
        
        self.name = name
    }
    
    var id = 0
    
    var name = String()
}
