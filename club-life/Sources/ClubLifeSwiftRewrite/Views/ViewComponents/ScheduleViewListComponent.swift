import Foundation
import SwiftUI

struct ClubScheduleViewListComponent: View {
    var scheduledServices: [ClubScheduledServicesDataModel]
    @Binding var showInfoAlert: Bool
    @State var searchText: String = ""
    
    var filteredServices: [ClubScheduledServicesDataModel] {
        if searchText.isEmpty {
            return scheduledServices
        } else {
            return scheduledServices.filter { $0.serviceTitle.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        List {
            ForEach(0..<14) { relativeDate in
                let date = Date(
                    timeIntervalSinceNow: 86400 * Double(relativeDate))
                let nextDay = Date(
                    timeIntervalSinceNow: 86400 * (Double(relativeDate) + 1.0))
                var daysScheduledServices: [ClubScheduledServicesDataModel] =
                    filteredServices.filter {
                        $0.startDateTime >= date && $0.startDateTime <= nextDay
                    }

                Section {
                    ForEach(daysScheduledServices) { service in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(service.serviceTitle)
                                    .fontWeight(.heavy)
                                Text(service.instructorName)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                Text(
                                    "\(service.totalSpots - service.reservedSpots) of \(service.totalSpots) Available"
                                )
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .padding([.bottom])

                                Text("\(service.serviceLocationClub.name)")
                                Text(
                                    "\(service.serviceLocationClub.city), \(service.serviceLocationClub.state)"
                                )
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(service.startDateTime, style: .time)
                                    .fontWeight(.semibold)

                                Text("\(service.durationMin) min")
                                    .font(.caption)

                                Spacer()

                                if service.isAvailableToBook
                                    && service.totalSpots
                                        != service.reservedSpots
                                {
                                    Button(
                                        "\(service.memberIsSignedUp ? "Joined!" : "Join")"
                                    ) {
                                        service.memberIsSignedUp = !service
                                            .memberIsSignedUp
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .tint(
                                        getColorFromHexTheSecond(
                                            service.serviceLocationClub
                                                .defaultBrandingColor)
                                    )
                                    .foregroundStyle(.white)
                                } else {
                                    Button("Info") {
                                        showInfoAlert = true
                                    }
                                    .buttonStyle(.bordered)
                                    .tint(
                                        getColorFromHexTheSecond(
                                            service.serviceLocationClub
                                                .defaultBrandingColor)
                                    )
                                    .foregroundStyle(.white)
                                }
                            }
                        }
                        .padding()
                    }
                } header: {
                    Text(date, style: .date)
                        .font(.title)
                    Divider()
                }
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchText)
    }
}
