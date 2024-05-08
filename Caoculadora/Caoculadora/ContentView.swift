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
    @State var result: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual idade do seu cão?")
                .font(.system(size: 24))
            Text("Anos")
            TextField("Digite quantos anos tem o seu cão.", value: $years, format: .number)
            
            Text("Meses")
            TextField("Digite quantos meses tem o seu cão.", value: $months, format: .number)
            
            Text("Porte")
            //segment controll
            if let result{
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 20)
            }
            Button(action: {
                result = 23
            }, label: {
                ZStack{
                    Color.pink
                    Text("Calcular")
                        .foregroundStyle(.white)
                }
                .cornerRadius(10)
            })
            .frame(height: 50)
            
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
