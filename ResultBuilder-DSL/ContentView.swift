//
//  ContentView.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        WebView {
            Head {
                Title("My tile")
                Meta(
                    name: "viewport",
                    content: "width=device-width, initial-scale=0.9, maximum-scale=5.0, user-scalable=1"
                )
            }
            WebBody {
                H1("This is a heading!")
                if isValidStringURL(imageUrl) {
                    P("Flareon")
                    Img(url: imageUrl)
                        .alt(text: "This is flareon")
                        .style(width: 100, height: 100)
                } else {
                    P("No image")
                }
                P("Moves learnt by level up!")
                Table {
                    Tr {
                        Th("Type")
                        Th("Name")
                        Th("Cat.")
                        Th("Power")
                        Th("Price")
                        Th("Year")
                        Th("CPU")
                    }
                    for row in Mac.sample {
                        Tr {
                            Td(row.type)
                            Td(row.name)
                            Td(row.categorry.rawValue)
                            Td(row.powerAdapter)
                            Td(row.price)
                            Td(row.year)
                            Td(row.cpu)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
