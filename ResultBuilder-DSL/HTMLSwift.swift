//
//  HTMLSwift.swift
//  ResultBuilder-DSL
//
//  Created by Nhat Le on 20/7/24.
//

import SwiftUI
import WebKit

// MARK: WebView
struct WebView: UIViewRepresentable {
    @HtmlBuilder var content: () -> [HtmlTag]

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let string = content()
            .map { $0.render() }
            .joined()
        
        let fullHtml = "<html>" + string + "</html>"
        print(fullHtml)
        webView.loadHTMLString(
            fullHtml,
            baseURL: nil
        )
    }
}

func isValidStringURL(_ string: String) -> Bool {
    URL(string: string) != nil
}

let imageUrl = "https://media.sketchfab.com/models/6a42b31bac064b00a91fbfebec07c852/thumbnails/11b24996ec7d41fbbbe0eac1096c3b47/bd2e09523e57484e96a3caa7e4961aea.jpeg"

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
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
                        .style(width: Int(UIScreen.main.bounds.width), height: 100)
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

// Mark: Mac
enum MacCategory: String {
    case macbookPro = "Macbook Pro"
    case air = "Macbook Air"
    case mini = "Mac Mini"
    case pro = "Mac Pro"
    case studio = "Mac Studio"
}

struct Mac {
    let type: String
    let name: String
    let categorry: MacCategory
    let powerAdapter: String
    let price: Double
    let year: String
    let cpu: String
}

extension Mac {
    static let sample: [Self] = [
        .init(type: "DeskTop", name: "MacMini2020", categorry: .mini, powerAdapter: "--", price: 600, year: "2020", cpu: "M1"),
        .init(type: "DeskTop", name: "MacMini2022", categorry: .mini, powerAdapter: "--", price: 700, year: "2022", cpu: "M2"),
        .init(type: "Laptop", name: "MacbookPro14", categorry: .macbookPro, powerAdapter: "64w", price: 1000, year: "2023", cpu: "M3"),
        .init(type: "Laptop", name: "MacbookPro14", categorry: .macbookPro, powerAdapter: "64w", price: 1500, year: "2023", cpu: "M3Pro"),
        .init(type: "Laptop", name: "MacbookPro16", categorry: .macbookPro, powerAdapter: "94w", price: 2000, year: "2023", cpu: "M3Pro"),
        .init(type: "Laptop", name: "MacbookPro16", categorry: .macbookPro, powerAdapter: "94w", price: 2000, year: "2020", cpu: "M3Max"),
        .init(type: "DeskTop", name: "MacStudio", categorry: .studio, powerAdapter: "--", price: 3000, year: "2022", cpu: "M2Max"),
        .init(type: "DeskTop", name: "MacStudio", categorry: .studio, powerAdapter: "--", price: 3500, year: "2022", cpu: "M2Ultra"),
        .init(type: "DeskTop", name: "MacPro", categorry: .pro, powerAdapter: "--", price: 6000, year: "2023", cpu: "M2Ultra")
    ]
}


