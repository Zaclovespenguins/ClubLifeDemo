import Foundation
import SwiftUI

struct ScheduleView: View {
    let scheduleTypes = ["Club Schedule", "My Schedule"]
    @State var pickerSelection: String = "Club Schedule"
    @State var showInfoAlert: Bool = false
    @State var scrollPosition: Date? = nil
    var scheduledServices: [ClubScheduledServicesDataModel] =
        testClubScheduledServicesDataModel

    var body: some View {
        NavigationStack {
            VStack {
                Picker(selection: $pickerSelection) {
                    ForEach(scheduleTypes, id: \.self) {
                        Text($0)
                    }
                } label: {
                    Text("Label")
                }
                .pickerStyle(.segmented)
                .padding()
                .animation(.easeInOut, value: pickerSelection)

                Group {
                    if pickerSelection == scheduleTypes[0] {
                        ClubScheduleViewListComponent(
                            scheduledServices: scheduledServices,
                            showInfoAlert: $showInfoAlert
                        )
                    } else {
                        MyScheduleViewListComponent(
                            scheduledServices: scheduledServices)
                    }
                }
                .transition(.slide)
            }
            .navigationTitle("Schedules")
            .alert(
                "Class Unavailable\nContact your club for more information",
                isPresented: $showInfoAlert
            ) {
                Button("OK", role: .cancel) {}
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Test Button")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
