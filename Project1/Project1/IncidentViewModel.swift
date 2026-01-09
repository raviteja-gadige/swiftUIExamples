//
//  IncidentViewModel.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import Foundation
import Combine

final class IncidentViewModel: ObservableObject {

    enum SortOrder {
        case ascending, descending
    }

    @Published var incidents: [Incident] = []
    @Published var sortOrder: SortOrder = .descending {
        didSet { sort() }
    }

    private var allIncidents: [Incident] = []

    init() {
        load()
    }

    private func load() {
        guard let url = Bundle.main.url(forResource: "coding", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([Incident].self, from: data) else {
            return
        }
        allIncidents = decoded
        sort()
    }

    private func sort() {
        incidents = allIncidents.sorted {
            sortOrder == .ascending
            ? $0.lastUpdatedDate < $1.lastUpdatedDate
            : $0.lastUpdatedDate > $1.lastUpdatedDate
        }
    }

    func toggleSortOrder() {
        sortOrder = sortOrder == .ascending ? .descending : .ascending
    }
}
