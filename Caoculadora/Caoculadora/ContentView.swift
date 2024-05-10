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
    @State var porteSelecionado: Porte = .pequeno
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual idade do seu cão?")
                .font(.header5)
            Text("Anos")
                .font(.body1)
            TextField("Digite quantos anos tem o seu cão.", value: $years, format: .number)
            Text("Meses")
                .font(.body1)
            TextField("Digite quantos meses tem o seu cão.", value: $months, format: .number)
            
            Text("Porte")
            Picker("Porte", selection: $porteSelecionado){
                ForEach(Porte.allCases, id: \.self) {porte in
                    Text(porte.rawValue.capitalized).tag(porte)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Divider()
            Spacer()
            //segment controll
            if let result{
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
                        .font(.body1)
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
        
        result = porteSelecionado.conversaoIdade(
            anos: years,
            meses: months
        )
    }
}

#Preview {
    ContentView()
}
