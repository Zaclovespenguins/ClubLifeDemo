import SwiftUI
import Foundation

struct HomeViewQuickLinksComponent: View {
    var clubBrandingColor: String
    var label: String
    var icon: String
    
    var body: some View {
        Button {
            print("TEST AH")
        } label: {
            HStack {
                Image(systemName: icon)
                    .padding()
                Text(label)
                    .padding()
                Spacer()
            }
            .foregroundStyle(.white)
        }
        .buttonStyle(.borderedProminent)
        .tint(getColorFromHexTheSecond(clubBrandingColor))
        .padding()
    }
}
