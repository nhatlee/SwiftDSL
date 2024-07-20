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
                    content: "width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=1"
                )
            }
            WebBody {
                H1("Mac models")
                if isValidStringURL(imageUrl) {
                    P("Mac models")
                    Img(url: imageUrl)
                        .alt(text: "This is Macbook pro")
                        .style(width: Int(UIScreen.main.bounds.width/2), height: 100)
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
