//
//  ContentView.swift
//  RealmProject
//
//  Created by Fatima Kahbi on 4/18/24.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.items, id: \.id) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Button("Delete") { viewModel.delete(item: item)}
                        .buttonStyle(.borderedProminent)
                    Button("Update") { viewModel.update(item: item)}
                        .buttonStyle(.borderedProminent)
                }
            }
            HStack {
                Button("Add") {viewModel.add()}
                Button("Reload") {
                    viewModel.load()
                    for item in viewModel.items {
                        print(item)
                    }
                }
            }
        }
        .onAppear {
            viewModel.load()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
