//
//  ContentView.swift
//  Caoculadora
//
//  Created by Arthur Alves Marsaro on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual idade do seu cão?")
                .font(.system(size: 24))
            Text("Anos")
            TextField("Digite quantos anos tem o seu cão.", value: $years, format: .number)
            
            Text("Meses")
            TextField("Digite quantos meses tem o seu cão.", value: $months, format: .number)
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
