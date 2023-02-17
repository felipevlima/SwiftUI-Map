//
//  ContentView.swift
//  SwiftUITeste
//
//  Created by Felipe Vieira Lima on 17/02/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showSheet: Bool = false
    @State private var address: String = ""
    @State private var showUserProfile: Bool = false
    
    var body: some View {
        SideBarStack(sidebarWidth: 270, showSidebar: $showUserProfile) {
            VStack {
                VStack {
                    Text("IMaps")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    List {
                        ForEach(1...10, id: \.self) { index in
                            Text("Index: \(index)")
                        }
                    }
                    .listStyle(.plain)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Sair")
                        .frame(maxWidth: .infinity, maxHeight: 30)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 20)
            }
        } content: {
            Map(coordinateRegion: .constant(.init(center: .init(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 10000, longitudinalMeters: 10000)))
                .ignoresSafeArea()
                .overlay(alignment: .topTrailing) {
                    HStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showUserProfile.toggle()
                            }
                            
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.title3)
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                                .foregroundColor(.blue)
                                .background(.white)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.5), radius: 5)
                        }
                        TextField("Endereço", text: $address)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.white)
                            .clipShape(Capsule())
                            .shadow(color: .black.opacity(0.5), radius: 5)
                        
                        Button {
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "suit.heart.fill")
                                .font(.title3)
                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                                .foregroundColor(.red)
                                .background(.white)
                                .clipShape(Capsule())
                                .shadow(color: .black.opacity(0.5), radius: 5)
                        }
    //                    .padding(15)
                    }
                    .padding(20)
                    
                }
    //            .sheet(isPresented: $showUserProfile) {
    //                Text("User detail")
    //                    .presentationDetents([.large])
    //            }
                .sheet(isPresented: $showSheet) {
                    List {
                        ForEach(1...10, id: \.self) { index in
                            Text("Row With Index: \(index)")
                        }
                    }
                    .presentationDetents([.medium, .large])
                }
                .overlay(alignment: .bottom) {
                    Button {
                        
                    } label: {
                        Text("Buscar")
                            .frame(maxWidth: .infinity, maxHeight: 30)
                           
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal, 20)
                    .shadow(color: .black.opacity(0.5), radius: 5)
            }
        }
//        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
