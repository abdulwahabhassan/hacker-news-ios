//
//  DetailsView.swift
//  Hacker News
//
//  Created by Hassan Abdulwahab on 01/01/2022.
//

import SwiftUI

struct DetailsView: View {
    
    let url: String? //url to be passed from content view
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "www.google.com")
    }
}

