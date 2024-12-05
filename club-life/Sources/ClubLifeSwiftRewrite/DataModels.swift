//
//  DataModels.swift
//

import Foundation
import Observation

@Observable
class UserDataModel {
    var memberNumber: String
    var clubData: ClubDataModel
    var memberSince: Date
    var membershipFriendlyName: String
    var firstName: String
    var lastName: String
    var barcode: String
    var gender: String
    var birthday: Date
    var phoneNumber: String
    var email: String
    var lastVisitDate: Date
    var rewardsPoints: Int
    var scheduledClasses: Int
    init(memberNumber: String, clubData: ClubDataModel, memberSince: Date, membershipFriendlyName: String, firstName: String, lastName: String, barcode: String, gender: String, birthday: Date, phoneNumber: String, email: String, lastVisitDate: Date, rewardsPoints: Int, scheduledClasses: Int) {
        self.memberNumber = memberNumber
        self.clubData = clubData
        self.memberSince = memberSince
        self.membershipFriendlyName = membershipFriendlyName
        self.firstName = firstName
        self.lastName = lastName
        self.barcode = barcode
        self.gender = gender
        self.birthday = birthday
        self.phoneNumber = phoneNumber
        self.email = email
        self.lastVisitDate = lastVisitDate
        self.rewardsPoints = rewardsPoints
        self.scheduledClasses = scheduledClasses
    }
}

@Observable
class ClubDataModel {
    var name: String
    var number: String
    var address1: String
    var address2: String?
    var city: String
    var state: String
    var zip: String
    var clubPhone: String
    var supportPhone: String
    var clubEmail: String
    var supportEmail: String
    var clubLogoUrl: String?
    var defaultBrandingColor: String
    var darkModeBrandingColor: String
    var clubHours: [ClubHoursDataModel]
    init(name: String, number: String, address1: String, address2: String? = nil, city: String, state: String, zip: String, clubPhone: String, supportPhone: String, clubEmail: String, supportEmail: String, clubLogoUrl: String? = nil, defaultBrandingColor: String?, darkModeBrandingColor: String?, clubHours: [ClubHoursDataModel]) {
        self.name = name
        self.number = number
        self.address1 = address1
        self.address2 = address2
        self.city = city
        self.state = state
        self.zip = zip
        self.clubPhone = clubPhone
        self.supportPhone = supportPhone
        self.clubEmail = clubEmail
        self.supportEmail = supportEmail
        self.clubLogoUrl = clubLogoUrl
        self.defaultBrandingColor = defaultBrandingColor ?? "#c33f4d"
        self.darkModeBrandingColor = darkModeBrandingColor ?? "#c33f4d"
        self.clubHours = clubHours
    }
}

@Observable
class ClubServiceDataModel {
    var name: String
    var serviceDescription: String
    var schedule: [Date]
    init(name: String, serviceDescription: String, schedule: [Date]) {
        self.name = name
        self.serviceDescription = serviceDescription
        self.schedule = schedule
    }
}

@Observable
class BannerDataModel {
    var id: Int
    var iconUrl: String
    var linkUrl: String?
    var title: String?
    init(id: Int, iconUrl: String, linkUrl: String? = nil, title: String? = nil) {
        self.id = id
        self.iconUrl = iconUrl
        self.linkUrl = linkUrl
        self.title = title
    }
}

@Observable
class UserCheckinDataModel {
    var checkinDateTime: Date
    var checkinClubId: String
    init(checkinDateTime: Date, checkinClubId: String) {
        self.checkinDateTime = checkinDateTime
        self.checkinClubId = checkinClubId
    }
}

@Observable
class BadgeDataModel {
    var id: String
    var name: String
    var badgeDescription: String
    var iconUrl: String
    var userHasBadge: Bool
    init(id: String, name: String, badgeDescription: String, iconUrl: String, userHasBadge: Bool) {
        self.id = id
        self.name = name
        self.badgeDescription = badgeDescription
        self.iconUrl = iconUrl
        self.userHasBadge = userHasBadge
    }
}

class ClubHoursDataModel {
    var dayNumber: Int
    var openHour: String
    var closeHour: String
    var isStaffed: Bool
    var service: String?
    var isDefaultHoursForDay: Bool
    var is24Hours: Bool
    init(dayNumber: Int, openHour: String, closeHour: String, isStaffed: Bool, service: String? = nil, isDefaultHoursForDay: Bool? = nil, is24Hours: Bool? = nil) {
        self.dayNumber = dayNumber
        self.openHour = openHour
        self.closeHour = closeHour
        self.isStaffed = isStaffed
        self.service = service
        self.isDefaultHoursForDay = isDefaultHoursForDay ?? false
        self.is24Hours = is24Hours ?? false
    }
}

enum NotificationType {
    case normal
    case warning
    case urgent
}

@Observable
class NotificationDataModel {
    var notificationId: UUID = UUID()
    var subject: String
    var messageBody: String
    var imageUrl: String?
    var sentDate: Date
    var isRead: Bool
    var readDate: Date?
    var notificationType: NotificationType
    init(subject: String, messageBody: String, imageUrl: String? = nil, sentDate: Date, isRead: Bool? = nil, readDate: Date? = nil, notificationType: NotificationType? = .normal) {
        self.subject = subject
        self.messageBody = messageBody
        self.imageUrl = imageUrl
        self.sentDate = sentDate
        self.isRead = isRead ?? false
        self.readDate = readDate
        self.notificationType = notificationType ?? .normal
    }
}

@Observable
class ClubScheduledServicesDataModel: Identifiable {
    var id: UUID = UUID()
    var serviceId: String
    var startDateTime: Date
    var serviceTitle: String
    var serviceDescription: String
    var instructorName: String
    var durationMin: Int
    var serviceLocationClub: ClubDataModel
    var totalSpots: Int
    var reservedSpots: Int
    var isAvailableToBook: Bool
    var memberIsSignedUp: Bool
    init(serviceId: String, startDateTime: Date, serviceTitle: String, serviceDescription: String, instructorName: String, durationMin: Int, serviceLocationClub: ClubDataModel, totalSpots: Int, reservedSpots: Int, isAvailableToBook: Bool, memberIsSignedUp: Bool? = nil) {
        self.serviceId = serviceId
        self.startDateTime = startDateTime
        self.serviceTitle = serviceTitle
        self.serviceDescription = serviceDescription
        self.instructorName = instructorName
        self.durationMin = durationMin
        self.serviceLocationClub = serviceLocationClub
        self.totalSpots = totalSpots
        self.reservedSpots = reservedSpots
        self.isAvailableToBook = isAvailableToBook
        self.memberIsSignedUp = memberIsSignedUp ?? false
    }
}
