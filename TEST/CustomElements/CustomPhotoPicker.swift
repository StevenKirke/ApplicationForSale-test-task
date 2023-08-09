//
//  CustomPhotoPicker.swift
//  TEST
//
//  Created by Steven Kirke on 19.03.2023.
//

import SwiftUI
import PhotosUI

struct CustomPhotoPicker: View {
    
    @ObservedObject var profileVM: ProfileViewModel
    
    @State var selectedItem: PhotosPickerItem?
    @State var selectedImageData: Data?
        
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()
        ) {
            VStack(spacing: 10) {
                profileVM.takeImage(data: selectedImageData)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 90)
                    .clipShape(Circle())
                        .frame(width: 90, height: 90)
                    .overlay(
                        Circle().stroke(Color.g_C0C0C0, lineWidth: 2)
                    )
                Text("Change photo")
                    .customFont(size: 12, weight: .semibold, color: .g_808080)
            }
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    self.selectedImageData = data
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}


#if DEBUG
struct CustomPhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPhotoPicker(profileVM: .init())
    }
}
#endif


