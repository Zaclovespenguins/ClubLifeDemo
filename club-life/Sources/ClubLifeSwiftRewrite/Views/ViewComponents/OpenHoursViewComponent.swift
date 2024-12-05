import SwiftUI
import Foundation

struct OpenHoursViewComponent: View {
    var clubHours: [ClubHoursDataModel]
    
    
    var body: some View {
        Text(checkIfClubIsOpen(clubHours: clubHours))
    }
    
    private func checkIfClubIsOpen(clubHours: [ClubHoursDataModel]) -> String { 
        let calendar =  Calendar.current
        let currentComponents = calendar.dateComponents([.weekday], from: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        if let todayHours: ClubHoursDataModel = clubHours.filter { $0.dayNumber == currentComponents.weekday ?? 1 - 1 && $0.isDefaultHoursForDay}.first {
            let todayOpenTime = convertHourAndMinuteToCurrentDateTime(hourAndMinute: todayHours.openHour)
            let todayCloseTime = convertHourAndMinuteToCurrentDateTime(hourAndMinute: todayHours.closeHour)
            
            if (todayHours.openHour == "00:00" && todayHours.closeHour == "23:59") || todayHours.is24Hours {
                return "Open 24 Hours"
            } else if todayCloseTime.timeIntervalSinceReferenceDate - Date.now.timeIntervalSinceReferenceDate < 360 && todayCloseTime.timeIntervalSinceReferenceDate - Date.now.timeIntervalSinceReferenceDate > 0 {
                return "Closing soon! Open until \(dateFormatter.string(from: todayCloseTime))"
            } else if todayCloseTime.timeIntervalSinceReferenceDate - Date.now.timeIntervalSinceReferenceDate > 360 {
                return "Open until \(dateFormatter.string(from: todayCloseTime))"
            } else if todayCloseTime.timeIntervalSinceReferenceDate - Date.now.timeIntervalSinceReferenceDate < 0 {
                return "Opens at \(dateFormatter.string(from: todayOpenTime))"
            }
        }
        return "Unable to get hours. Please check with club for hours"
    }
    private func convertHourAndMinuteToCurrentDateTime(hourAndMinute: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateStyle = .short

        let today = dateFormatter.string(from: Date.now)
        dateFormatter.dateFormat = "M/d/yy H:mm"
        
        return dateFormatter.date(from: "\(today) \(hourAndMinute)") ?? Date.now
    }
}
