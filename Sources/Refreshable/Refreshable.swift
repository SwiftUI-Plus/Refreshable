import SwiftUI

extension View {

    /// Enables a refresh action for the specified view, if it supports this action
    /// - Parameter action: The action to perform when refreshing
    public func onRefresh(_ action: @escaping (Binding<Refresh>) -> Void) -> some View {
        environment(\.refreshAction, action)
    }

}

/// Represents the current refresh, consumers should call `refresh.wrappedValue.end()` to end refreshing
public struct Refresh {

    private var _isRefreshing: Binding<Bool>

    /// Indicates whether a view is currently refreshing
    public var isRefreshing: Bool {
        _isRefreshing.wrappedValue
    }

    /// Ends refreshing
    ///
    /// If `isRefreshing` is false, `end()` is a no-op.
    public mutating func end() {
        _isRefreshing.wrappedValue = false
    }

    internal init(_ isRefreshing: Binding<Bool>) {
        _isRefreshing = isRefreshing
    }

}

struct RefreshEnvironmentKey: EnvironmentKey {
    public static let defaultValue: ((Binding<Refresh>) -> Void)? = nil
}

extension EnvironmentValues {

    /// Returns the refresh action associated with this view, if any.
    public fileprivate(set) var refreshAction: ((Binding<Refresh>) -> Void)? {
        get { self[RefreshEnvironmentKey.self] }
        set { self[RefreshEnvironmentKey.self] = newValue }
    }

}
