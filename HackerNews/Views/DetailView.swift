//
//  DetailView.swift
//  HackerNews
//
//  Created by Evgeniy Uskov on 28.10.2019.
//  Copyright © 2019 Evgeniy Uskov. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
