//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 1/22/23.
//

import SwiftUI
import PluginInterface

struct FileView: View {
    let fileUtils: FileUtilsProtocol
    let nsPanelUtils: NSPanelUtilsProtocol
    
    @State var paths: [String] = []
    @State var currentDir: URL? = nil
    
    var body: some View {
        VStack {
            if let currentDir = currentDir {
                Text(currentDir.absoluteString)
            }
            List(paths, id: \.self) { path in
                Text(path)
            }
            
            Button("Open Folder") {
                let url = try! fileUtils.updateCurrentWorkSpace()
                self.currentDir = url
                self.nsPanelUtils.alert(title: "OK", subtitle: "OK", okButtonText: "OK", alertStyle: .informational)
            }
            
            Button("List") {
                let paths = try! fileUtils.list()
                self.paths = paths
            }
        }
    }
}
