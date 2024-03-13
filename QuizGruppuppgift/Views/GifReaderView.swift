//
//  GifReaderView.swift
//  QuizGruppuppgift
//
//  Created by Dennis.Nilsson on 2024-03-06.
//

import SwiftUI
import WebKit

struct GifReaderView: UIViewRepresentable{
    
    let gifName: String
    
    func makeUIView(context: Context) -> some WKWebView {
        let webview = WKWebView()
        
        //Gets the data and loads it
        if let url = Bundle.main.url(forResource: gifName,
           withExtension: "gif"),let data = try?
            Data(contentsOf: url){
            webview.load(
                data,
                mimeType: "image/gif",
                characterEncodingName:"UTF-8",
                baseURL: url.deletingLastPathComponent()
            )
        }else{
            print("Error: Unable to load file")
        }
        
      
        return webview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.reload()
    }
}

#Preview {
    GifReaderView(gifName: "hotpotatologo")
}
