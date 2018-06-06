import UIKit

enum RefreshControlType: CustomStringConvertible {
    case interfaceBuilder
    case programatic
    case fixed
    case disableUserInteraction

    static var all: [RefreshControlType] {
        return [
            .interfaceBuilder,
            .programatic,
            .fixed,
            disableUserInteraction
        ]
    }

    var description: String {
        switch self {
        case .interfaceBuilder:
            return "Interface builder"
        case .programatic:
            return "Programatic"
        case .fixed:
            return "Fixed"
        case .disableUserInteraction:
            return "Disable user interaction"
        }
    }

    var viewController: UIViewController {
        switch self {
        case .interfaceBuilder:
            return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InterfaceBuilderRefreshVC")
        case .programatic:
            return ProgramaticRefreshVC(style: .grouped)
        case .fixed:
            return FixedProgramaticRefreshVC(style: .grouped)
        case .disableUserInteraction:
            return DisabledUserInteractionVC(style: .grouped)
        }
    }
  }
