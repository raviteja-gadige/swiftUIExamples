//
//  IncidentListView.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import Foundation
import SwiftUI

struct IncidentListView: View {
    @StateObject private var vm = IncidentViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.incidents) { incident in
                NavigationLink {
                    IncidentDetailView(incident: incident)
                } label: {
                    IncidentRowView(incident: incident)
                }
            }
            .navigationTitle("Incidents")
            .toolbar {
                Button {
                    vm.toggleSortOrder()
                } label: {
                    Image(systemName: vm.sortOrder == .ascending
                          ? "arrow.up"
                          : "arrow.down")
                }
            }
        }
    }
}
