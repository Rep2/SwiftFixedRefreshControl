import UIKit

enum RefreshControlType: CustomStringConvertible {
    case interfaceBuilder
    case programatic
    case fix1
    case fixed

    static var all: [RefreshControlType] {
        return [
            .interfaceBuilder,
            .programatic,
            .fix1,
            .fixed
        ]
    }

    var description: String {
        switch self {
        case .interfaceBuilder:
            return "Interface builder"
        case .programatic:
            return "Programatic"
        case .fix1:
            return "Fix one"
        case .fixed:
            return "Fixed"
        }
    }

    var viewController: UIViewController {
        switch self {
        case .interfaceBuilder:
            return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InterfaceBuilderRefreshVC")
        case .programatic:
            return ProgramaticRefreshVC(style: .grouped)
        case .fix1:
            return Fix1Attempt(style: .grouped)
        case .fixed:
            return FixedProgramaticRefreshVC(style: .grouped)
        }
    }
  }
