import SwiftUI
import Combine

/// In most cases you should just use the `RepreshableView` instead. This is provided for more advanced implementations where that view isn't sufficient.
///
/// An observer to simplify creating custom refresh views. See `RefreshableView` for an example of how to use this.
public final class Refresher: ObservableObject {

    /// Returns `true` if the observer is currently refreshing, `false` otherwise
    @Published public private(set) var isRefreshing = false
    private var cancel: AnyCancellable?

    public init() { }

    /// Begins a refresh action
    /// - Parameter action: The action to  perform
    public func perform(_ action: @escaping (Binding<Refresh>) -> Void) {
        guard !isRefreshing else { return }
        isRefreshing = true

        let refresh = Binding(get: { self.isRefreshing }, set: { self.isRefreshing = $0 })
        let binding = Binding(get: { Refresh(refresh)}, set: { _ in })

        cancel = Just(binding).sink { [weak self] value in
            self?.isRefreshing = value.wrappedValue.isRefreshing
        }

        action(binding)
    }
    
}
