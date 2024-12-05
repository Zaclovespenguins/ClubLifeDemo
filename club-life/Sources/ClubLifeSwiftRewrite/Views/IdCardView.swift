import Foundation
import SwiftUI

#if !skip
    import PassKit
#endif

struct IdCardView: View {
    var userData: UserDataModel

    @State var showPKaddVC: Bool = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Name")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    Text("\(userData.firstName) \(userData.lastName)")
                        .font(.title2)
                }
                .padding()
                VStack {
                    Text("Member Since")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    Text(userData.memberSince, style: .date)
                        .font(.title2)
                }
                .padding()
                Spacer()
            }
            .padding()
            Image("barcodeQrCode")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding()
            Text("Barcode: \(userData.barcode)")
                .foregroundStyle(.secondary)
                .font(.subheadline)

            Spacer()

            #if !skip
                let pkPassObjectPlaceholder: PKPass = try! PKPass(
                    data: try! Data(
                        contentsOf: Bundle.module.url(
                            forResource: "clubLifePocAppleWalletPass",
                            withExtension: ".pkpass")!))

                AddPassToWalletButton(
                    [pkPassObjectPlaceholder], onCompletion: placeHolderFunc
                )
                .frame(width: 250, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.5), radius: 15)
                .padding()
            // TODO: There is some sort of concurrency issue with Kotlin since it has to suspend the app in order to add the pass to the Wallet. For now this is just a pretty button.
            #elseif SKIP
                ComposeView { _ in
                    com.google.wallet.button.WalletButton(
                        onClick = { print("AH") })
                }
            #endif
            Spacer()
        }
    }
}

#if !skip
    func placeHolderFunc(_ isDone: Bool) {

    }
#endif
