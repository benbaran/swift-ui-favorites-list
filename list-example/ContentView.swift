//
//  ContentView.swift
//  list-example
//
//  Created by Ben Baran on 5/27/20.
//  Copyright © 2020 Ben Baran. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var state: ApplicationState
    
    var body: some View {
        
        VStack{
            List {
                Section(header: Text("Favorites")) {
                    
                    ForEach(state.favorites, id: \.self) { favorite in

                        HStack{
                            
                            Button(
                                action: {
                                    self.state.others.append(favorite)
                                    
                                    self.state.favorites = self.state.favorites.filter {$0 != favorite}
                                    
                                    self.sortItems()
                            },
                                label: {Image(systemName: "heart.fill").foregroundColor(.red)}
                            )
                                .id(favorite.id)
                            
                            Text(favorite.name)
                            
                        }
                    }
                }
                
                Section(header: Text("Others")) {
                    
                    ForEach(state.others, id: \.self) { other in
                        
                        HStack{
                            
                            Button(
                                action: {
                                    self.state.favorites.append(other)
                                    
                                    self.state.others = self.state.others.filter {$0 != other}
                                    
                                    self.sortItems()
                            },
                                label: {Image(systemName: "heart")}
                            )
                                .id(other.id)
                            
                            
                            Text(other.name)
                            
                        }
                    }
                }
            }
        }.onAppear(){
            
            self.populateState()
        }
    }
    
    func sortItems(){

        self.state.favorites.sort {
            $0.name < $1.name
        }

        self.state.others.sort {
            $0.name < $1.name
        }
    }
    
    func populateState(){
        
        state.others.append(ListItem(id: 1, name: "One"))
        
        state.others.append(ListItem(id: 2, name: "Two"))
        
        state.others.append(ListItem(id: 3, name: "Three"))
        
        state.others.append(ListItem(id: 4, name: "Four"))
        
        state.others.append(ListItem(id: 5, name: "Five"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
