//
//  Incident.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import Foundation

struct Incident: Identifiable, Decodable {
    let id: String
    let title: String
    let callTime: String
    let lastUpdated: String
    let latitude: Double
    let longitude: Double
    let description: String?
    let location: String
    let status: String
    let type: String
    let typeIcon: String

    var lastUpdatedDate: Date {
        ISO8601DateFormatter.incident.date(from: lastUpdated) ?? .distantPast
    }
    
    func formatIncidentlandiTime(_ isoString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withTimeZone]
        
        guard let date = isoFormatter.date(from: isoString) else {
            return isoString
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        
        return formatter.string(from: date)
    }
}

extension ISO8601DateFormatter {
    static let incident: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime, .withTimeZone]
        return f
    }()
}


