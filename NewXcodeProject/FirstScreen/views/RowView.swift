//
//  RowView.swift
//  NewXcodeProject
//
//  Created by Fabio Acri on 20/08/2019.
//  Copyright © 2019 Fabio Acri. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var trailer: TrailerModel
    
    var body: some View {
        HStack(spacing: 15) {
            Image(uiImage: trailer.movieImage).resizable().scaledToFit()
                .frame(width: 100, height: 160, alignment: .center)
            Text("\(trailer.movieLabel)")
                .fontWeight(.bold)
                .font(.system(size: 28.0))
        }
    }
}
