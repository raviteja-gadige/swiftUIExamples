//
//  IncidentService.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import Foundation

final class IncidentService {
    static func loadIncidents() -> [Incident] {
        guard let url = Bundle.main.url(forResource: "coding", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        return (try? JSONDecoder().decode([Incident].self, from: data)) ?? []
    }
}
