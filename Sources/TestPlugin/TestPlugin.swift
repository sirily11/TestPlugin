import PluginInterface

struct PluginA: PluginInterfaceProtocol {
    func run() -> String {
        return "Calling from test plugin"
    }
}


@_cdecl("createPlugin")
public func createPlugin() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(PluginABuilder()).toOpaque()
}

final class PluginABuilder: PluginBuilder {
    override func build() -> PluginInterfaceProtocol {
        PluginA()
    }
}
