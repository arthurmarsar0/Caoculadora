//
//  ContentView.swift
//  Caoculadora
//
//  Created by Arthur Alves Marsaro on 07/05/24.
//

import SwiftUI

enum Sizes: String, CaseIterable {
    case small = "Pequeno"
    case medium = "Medio"
    case big = "Grande"
}

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    let portes = ["Pequeno", "Medio", "Grande"]
//    @State var porte: String = "Pequeno"
    @State var porte: Sizes = .small
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual idade do seu cão?")
                .font(.system(size: 24))
            Spacer()
            Text("Anos")
            TextField("Digite quantos anos tem o seu cão.", value: $years, format: .number)
            Text("Meses")
            TextField("Digite quantos meses tem o seu cão.", value: $months, format: .number)
            
            Text("Porte")
            Picker("Porte", selection: $porte){
                ForEach(Sizes.allCases, id: \.self) {porte in
                    Text(porte.rawValue).tag(porte)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Divider()
            Spacer()
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
            Spacer()
            Button(action: processYears, label: {
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
    
    func processYears() {
        guard let years, let months else {
            print("prencha o campo de entrada")
            return
        }
        
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter valor maior que 0")
            return
        }
        
        result = years * 7 + months * 7 / 12
    }
}

#Preview {
    ContentView()
}
