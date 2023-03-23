//
//  ContentView.swift
//  SwiftUI-Menus-Tutorial
//
//  Created by Aisultan Askarov on 23.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    var elements: [menuSection] = [menuSection(rows: [menuRow(title: "Drop Down", icon: "chevron.compact.down")]), menuSection(rows: [menuRow(title: "First", icon: "1.circle.fill"), menuRow(title: "Second", icon: "2.circle.fill")]), menuSection(rows: [menuRow(title: "Third", icon: "3.circle.fill"), menuRow(title: "Fourth", icon: "4.circle.fill")]), menuSection(rows: [menuRow(title: "Fifth", icon: "5.circle.fill"), menuRow(title: "Sixth", icon: "6.circle.fill")])]
    
    var dropDownElements: [menuRow] = [menuRow(title: "First", icon: "1.circle"), menuRow(title: "Second", icon: "2.circle"), menuRow(title: "Third", icon: "3.circle")]
    
    var body: some View {
        
        ZStack {
            
            Menu {
                
                ForEach(elements.reversed(), id: \.self) { section in
                    Section(content: {
                        
                        ForEach(section.rows.reversed()) { row in
                            
                            if row.title == "Drop Down" {
                                
                                Menu {
                                    
                                    ForEach(dropDownElements) { dropRow in
                                        
                                        sectionElementButton(title: dropRow.title, icon: dropRow.icon)
                                        
                                    }
                                    
                                } label: {
                                    sectionElementButton(title: row.title, icon: "")
                                }
                                
                            } else {
                                sectionElementButton(title: row.title, icon: row.icon)
                            }
                        }
                        
                    })
                }
                
            } label: {
                Circle()
                    .fill(.gray.opacity(0.15))
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 13.0, weight: .semibold))
                            .foregroundColor(.pink)
                            .padding()
                    }
            } primaryAction: {
                print("Primary Action")
            }
            .colorScheme(.dark)
            
        }
        
    }
    
    @ViewBuilder
    func sectionElementButton(title: String, icon: String) -> some View {
        
        Button() {
            print("pressed")
        } label: {
            HStack {
                Text(title)
                    .font(.system(size: 14.0, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 14.0, weight: .semibold, design: .default))
            }
        }
        
    }
    
    @ViewBuilder
    func dropDownMenu(elements: [menuRow]) -> some View {
        
        Menu {
            
            ForEach(elements) { row in
                
                sectionElementButton(title: row.title, icon: row.icon)
                
            }
            
        } label: {
            Circle()
                .fill(.gray.opacity(0.15))
                .frame(width: 30, height: 30)
                .overlay {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 13.0, weight: .semibold))
                        .foregroundColor(.pink)
                        .padding()
                }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct menuSection: Identifiable, Hashable {

    let id: String
    let rows: [menuRow]
    
    init(rows: [menuRow]) {
        self.id = UUID().uuidString
        self.rows = rows
    }
    
}

struct menuRow: Identifiable, Hashable {
    
    let id: String
    var title: String
    var icon: String
    
    init(title: String, icon: String) {
        self.id = UUID().uuidString
        self.title = title
        self.icon = icon
    }
    
}
