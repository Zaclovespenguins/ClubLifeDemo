import Foundation
import SwiftUI

struct BannerCarouselComponent: View {
    var bannerData: [BannerDataModel]
    var screenWidth: CGFloat
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                // These if SKIP directives are because Compose doesn't have an analogue for .scrollTargetBehavior(.viewAligned) or .contentMargins(16, for: .scrollContent)
                #if SKIP
                    Rectangle()
                        .frame(width: screenWidth * 0.1)
                        .foregroundStyle(.clear)

                #endif
                ForEach(bannerData, id: \.id) { banner in
                    AsyncImage(url: URL(string: banner.iconUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()

                            #if !SKIP
                                .containerRelativeFrame(
                                    .horizontal, count: 1,
                                    spacing: 16)
                            #elseif SKIP
                                .frame(
                                    width: screenWidth
                                        * 0.8
                                )
                            #endif
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 15))
                    } placeholder: {
                        ProgressView()
                    }
                }
                #if SKIP
                    Rectangle()
                        .frame(width: screenWidth * 0.1)
                        .foregroundStyle(.clear)

                #endif
            }
            #if !SKIP
                .scrollTargetLayout()
                .scrollIndicators(.never)
            #endif
        }
        #if !SKIP
            .contentMargins(16, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        #endif
    }
}
