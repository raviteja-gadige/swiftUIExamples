//
//  IncidentRowView.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import Foundation

import SwiftUI

struct IncidentRowView: View {
    let incident: Incident
    
    var body: some View {
        HStack(spacing: 12) {
            
            // Icon with loading indicator
            AsyncImage(url: URL(string: incident.typeIcon)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                default:
                    Image(systemName: "exclamationmark.triangle")
                }
            }
            .frame(width: 36, height: 36)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(incident.formatIncidentlandiTime(incident.lastUpdated))")
                    .font(.caption)
                    .foregroundColor(.black)
                Text(incident.title)
                    .font(.headline)
                Text(incident.status)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(statusColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
            }
            
            
        }
        .padding(.vertical, 6)
    }
    
    private var statusColor: Color {
        switch incident.status.lowercased() {
        case "under control": return .green
        case "on scene": return .blue
        case "out of control": return .red
        case "pending": return .orange
        default: return .gray
        }
    }
}
