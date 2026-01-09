//
//  IncidentDetailView.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import SwiftUI
import MapKit

struct IncidentDetailView: View {
    let incident: Incident

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: incident.latitude,
                longitude: incident.longitude
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }

    var body: some View {
        ScrollView {
            Map(coordinateRegion: .constant(region), annotationItems: [incident]) { item in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: item.latitude,
                        longitude: item.longitude
                    )
                ) {
                    IncidentMapIcon(iconURL: item.typeIcon)
                }
            }
            .frame(height: 300)

            detailsSection
        }
        .navigationTitle(incident.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            info("Location", incident.location)
            info("Status", incident.status)
            info("Type", incident.type)
            info("Last Updated", incident.formatIncidentlandiTime(incident.lastUpdated))
            info("Call Time", incident.formatIncidentlandiTime(incident.callTime))

            if let desc = incident.description {
                info("Description", desc)
            }
        }
        .padding()
    }

    private func info(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.body)
        }
    }
}
