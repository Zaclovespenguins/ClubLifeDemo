import SwiftUI

enum ContentTab: String, Hashable {
    case welcome, home, settings
}

public struct ContentView: View {
    @State var appearance = ""
    @State var isBeating = false
    @State var selectedTab = "Home"

    public init() {
    }

    public var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .tag("Home")
            ScheduleView()
                .tabItem { Label("Calendar", systemImage: "calendar") }
                .tag("Calendar")
            AccountView(userData: testUserData)
                .tabItem { Label("Account", systemImage: "person") }
                .tag("Account")
        }
    }
}

func getColorFromHexTheSecond(_ hex: String, alpha: Double = 1) -> Color {
    var r = Double("0x0\(hex.suffix(6).prefix(2))") ?? Double(0x0c3)
    var g = Double("0x0\(hex.suffix(4).prefix(2))") ?? Double(0x03f)
    var b = Double("0x0\(hex.suffix(2))") ?? Double(0x04d)

    r = r / 255
    g = g / 255
    b = b / 255

    return Color(red: r, green: g, blue: b)
}

func getAbbreviatedMonth(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM"
    return formatter.string(from: date)
}
func getDayNumber(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    return formatter.string(from: date)
}
func getDayName(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE"
    return formatter.string(from: date)
}

#Preview {
    ContentView()
}
