//
//  IncidentMapIcon.swift
//  Project1
//
//  Created by Apple on 09/01/26.
//

import Foundation
import SwiftUI

struct IncidentMapIcon: View {
    let iconURL: String

    var body: some View {
        AsyncImage(url: URL(string: iconURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 32, height: 32)

            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(6)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 4)

            default:
                Image(systemName: "mappin.circle.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
    }
}
