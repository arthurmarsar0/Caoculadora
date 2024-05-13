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
    @State var failedInput: Bool = false
    let tituloPreencherCampos = "Preencha os campos para cãocular"
    @State var isZero: Bool = false
    let tituloZero = "Prencha com valores maior que zero"
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0 ) {
                    Text("Qual idade do seu cão?")
                        .font(.header5)
                        .padding(.top, 24.0)
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Anos")
                            .font(.body1)
                        TextField("Digite quantos anos tem o seu cão.", value: $years, format: .number)
                    }
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Meses")
                            .font(.body1)
                        TextField("Digite quantos meses tem o seu cão.", value: $months, format: .number)
                    }
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Porte")
                        Picker("Porte", selection: $porteSelecionado){
                            ForEach(Porte.allCases, id: \.self) {porte in
                                Text(porte.rawValue.capitalized).tag(porte)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Divider()
                    Spacer()
                    //segment controll
                    if let result{
                            Text("Seu cachorro tem, em idade humana...")
                                .font(.body1)
                                .frame(maxWidth: .infinity)
                            Text("\(result) ano(s)")
                            .contentTransition(.numericText())
                                .font(.display)
                                .frame(maxWidth: .infinity)
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
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                        .cornerRadius(10)
                    })
                    .frame(height: 50)
                    
                }
                .alert(tituloPreencherCampos, isPresented: $failedInput){
                    Button("OK", role: .cancel, action: {})
                }
                .alert(tituloZero, isPresented: $isZero){
                    Button("OK", role: .cancel, action: {})
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.pink, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
            
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }
    
    func processYears() {
        guard let years, let months else {
            print("prencha o campo de entrada")
            failedInput = true
            return
        }
        
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter valor maior que 0")
            isZero = true
            return
        }
        
        withAnimation(.easeIn.speed(0.5)){
            result = porteSelecionado.conversaoIdade(
                anos: years,
                meses: months
            )
        }
    }
}

#Preview {
    ContentView()
}
