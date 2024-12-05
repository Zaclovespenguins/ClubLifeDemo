//
//  HomeView.swift
//  club-life
//
//  Created by Zachary Reyes on 11/30/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State var showIdCard: Bool = false
    @State var showAddPKPass: Bool = false
    @State private var currentBannerItem = 0

    var userData: UserDataModel = testUserData
    var bannerData: [BannerDataModel] = testBannerData

    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                ScrollView {
                    VStack {
                        BannerCarouselComponent(
                            bannerData: bannerData,
                            screenWidth: proxy.size.width)

                        VStack {
                            HStack {
                                AsyncImage(
                                    url: URL(
                                        string: userData.clubData.clubLogoUrl!)
                                ) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .clipShape(
                                            RoundedRectangle(cornerRadius: 15)
                                        )
                                        .padding()
                                } placeholder: {
                                    ProgressView()
                                }
                                VStack(alignment: .leading) {
                                    Text(userData.clubData.name)
                                        .font(.title)
                                        .fontWeight(.heavy)
                                    OpenHoursViewComponent(
                                        clubHours: userData.clubData.clubHours)
                                    Button("Show Club Hours") {
                                        print("Showing club hours")
                                    }
                                    .foregroundStyle(
                                        getColorFromHexTheSecond(
                                            userData.clubData
                                                .defaultBrandingColor))
                                }
                                .padding()
                            }
                        }

                        Text("Quick Links")
                            .font(.title3)
                            .fontWeight(.semibold)
                        ShareLink(item: URL(string: "www.example.com")!) {
                            HStack {
                                Image(systemName: "person.2")
                                    .padding()
                                Text("Refer a Friend")
                                    .padding()
                                Spacer()
                            }
                            .foregroundStyle(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(
                            getColorFromHexTheSecond(
                                userData.clubData.defaultBrandingColor)
                        )
                        .padding()
                        HomeViewQuickLinksComponent(
                            clubBrandingColor: userData.clubData
                                .defaultBrandingColor, label: "Check In",
                            icon: "person.fill.checkmark")
                        HomeViewQuickLinksComponent(
                            clubBrandingColor: userData.clubData
                                .defaultBrandingColor, label: "MyZONE",
                            icon: "arrow.right")
                    }
                }
                .navigationTitle("My Club Life")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button {
                                print("Show Notification Sheet")
                            } label: {
                                Image(systemName: "bell")
                            }
                            .padding()

                            Button {
                                showIdCard = true
                            } label: {
                                Image(systemName: "person.text.rectangle")
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showIdCard) {
                IdCardView(userData: userData)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}

//var sharePreviewTest: SharePreview = SharePreview("This is a test!", image: Image("peakFitLogo"))
