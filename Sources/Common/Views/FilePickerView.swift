//
//  FilePickerView.swift
//  
//
//  Created by devonly on 2022/11/24.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

public struct FilePickerView: View {
    public typealias Completeion = (URL) -> ()
    let fileType: UTType
    let onSelected: (URL) -> ()

    public init(fileType: UTType, onSelected: @escaping Completeion) {
        self.fileType = fileType
        self.onSelected = onSelected
    }

    public var body: some View {
        _FilePickerView(fileType: fileType, onSelected: onSelected)
    }
}

private struct _FilePickerView: UIViewControllerRepresentable {
    let fileType: UTType
    let onSelected: (URL) -> ()

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller: UIDocumentPickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [.json], asCopy: true)
        controller.delegate = context.coordinator
        return controller
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: _FilePickerView

        init(_ parent: _FilePickerView) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let url = urls.first {
                parent.onSelected(url)
            }
        }
    }
}
