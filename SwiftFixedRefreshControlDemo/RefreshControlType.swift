import UIKit

enum RefreshControlType: CustomStringConvertible {
    case interfaceBuilder
    case programatic
    case fixed

    static var all: [RefreshControlType] {
        return [
            .interfaceBuilder,
            .programatic,
            .fixed
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
        }
    }
  }
