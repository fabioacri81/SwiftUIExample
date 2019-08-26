//
//  ContentView.swift
//  NewXcodeProject
//
//  Created by Fabio Acri on 20/08/2019.
//  Copyright © 2019 Fabio Acri. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: TrailerViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List {
                    ForEach(viewModel.listOfTrailers) { trailer in
                        RowView(trailer: trailer)
                            .onTapGesture {
                                UIApplication.shared.open(URL(string: trailer.movieUrl)!, options: [:], completionHandler: nil)
                        }
                    }
                }.listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Apple Trailers")
        }
    }
}
