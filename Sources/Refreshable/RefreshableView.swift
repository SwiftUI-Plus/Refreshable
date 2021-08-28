import SwiftUI

/// A convenient view for building custom refresh UI
public struct RefreshableView<Content: View>: View {

    @Environment(\.refreshAction) private var action
    @ObservedObject private var refresher = Refresher()

    /// Represents the current phase/state of the refresh
    public enum RefreshPhase {
        /// No refresh is in progress, the provided `refresher` can be used to trigger a refresh using the associated `action`.
        ///
        /// Most commonly you would simply write:
        ///
        ///     refresher.perform(action)
        case idle(refresher: Refresher, action: (Binding<Refresh>) -> Void)
        /// A refresh is in progress, show a spinner or some other state
        case refreshing
        /// A refresh is not supported on this view. This is the phase you'll recieve if no `onRefresh` has been added in the parent hierarchy
        case notSupported
    }

    private let content: (RefreshPhase) -> Content

    public init(@ViewBuilder _ content: @escaping (_ phase: RefreshPhase) -> Content) {
        self.content = content
    }

    public var body: some View {
        if let action = action {
            content(
                refresher.isRefreshing
                    ? .refreshing
                    : .idle(
                        refresher: refresher,
                        action: action
                    )
            )
        } else {
            content(.notSupported)
        }
    }
}

struct RefreshableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RefreshableView { phase in
                switch phase {
                case .notSupported:
                    Text("Not supported")
                default:
                    Text("Refreshable")
                }
            }

            RefreshableView { state in
                switch state {
                case .notSupported:
                    Text("Not supported")
                default:
                    Text("Refreshable")
                }
            }
            .onRefresh { _ in }
        }
        .previewLayout(.sizeThatFits)
    }
}
