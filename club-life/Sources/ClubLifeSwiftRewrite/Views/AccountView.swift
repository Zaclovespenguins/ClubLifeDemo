import SwiftUI


struct AccountView: View {
    var userData: UserDataModel
    
    @State var feedbackPopupShown: Bool = false
    @State var feedbackText: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Gender")
                        Spacer()
                        Text("\(userData.gender)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Birthday")
                        Spacer()
                        Text(userData.birthday, style: .date)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Phone Numbers")
                        Spacer()
                        Text("\(userData.phoneNumber)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("\(userData.email)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                } header: {
                    HStack {
                        Spacer()
                        VStack(alignment: .center) {
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)

                                VStack(alignment: .leading) {
                                    Text("\(userData.firstName) \(userData.lastName)")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    Text("\(userData.clubData.number)-\(userData.memberNumber)")
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                }
                        }
                        Spacer()
                    }
                } footer: {
                    Text("To change any of this information please contact the club directly at \(userData.clubData.clubPhone)")
                        .foregroundStyle(.secondary)
                }
                Section {
                    NavigationLink(destination: EmptyView()) {
                        Text("Payment Method")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Text("Usage History")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Text("Transaction History")
                    }
                }
                Section {
                    Button("Feedback") {
                        feedbackPopupShown = true
                    }
                        .foregroundStyle(.primary)
                    Link("Privacy Policy", destination: URL(string: "https://www.peakpayment.com/privacy-policy/")!)
                                            .foregroundStyle(.primary)
                    Button("Link Employee Account") {
                        print("Go to employee login page")
                    }
                        .foregroundStyle(.primary)
                    Button("Log Out", role: .destructive) {
                        print("Logged out!")
                    }
                }
            }
            .navigationTitle("My Account")
            .sheet(isPresented: $feedbackPopupShown) {
                NavigationStack {
                    VStack {
                        #if skip
                        Text("Feedback")
                            .font(.title)
                            .fontWeight(.heavy)
                        #endif
                        Text("How are we doing?")
                            .font(.title)
                            .fontWeight(.medium)
                        Text("Email:")
                            .font(.title3)
                        Text(userData.email)
                            .foregroundStyle(.secondary)
                        TextEditor(text: $feedbackText)
                            .padding()
                    }
                    .padding()
                    #if !skip
                    .navigationTitle("Feedback")
                    #endif
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Send") {
                                feedbackText = ""
                                feedbackPopupShown = false
                            }
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel") {
                                feedbackPopupShown = false
                                }
                            .foregroundStyle(.red)
                        }
                    }
                }
            }
        }
    }
}
