import PluginInterface
import SwiftUI

struct PluginA: PluginInterfaceProtocol {
    var manifest: ProjectManifest = ProjectManifest(displayName: "Test Plugin", bundleIdentifier: "com.sirilee.TestPlugin", author: "sirily11", shortDescription: "A testing plugin", repository: "https://github.com/sirily11/TestPlugin", keywords: ["test", "swift-ui"])
    
    
    let fileUtils: FileUtilsProtocol
    let nsPanelUtils: NSPanelUtilsProtocol
    
    var id = UUID()
    
    var view: some View {
        FileView(fileUtils: fileUtils, nsPanelUtils: nsPanelUtils)
    }
}


@_cdecl("createPlugin")
public func createPlugin() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(PluginABuilder()).toOpaque()
}

final class PluginABuilder: PluginBuilder {
    override func build(fileUtils: FileUtilsProtocol, nsPanelUtils: NSPanelUtilsProtocol) -> any PluginInterfaceProtocol {
        PluginA(fileUtils: fileUtils, nsPanelUtils: nsPanelUtils)
    }
}
