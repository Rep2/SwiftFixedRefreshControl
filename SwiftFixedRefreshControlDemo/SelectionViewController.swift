import SwiftViewModels
import SwiftGenericCells
import ReusableDataSource
import UIKit

class SelectionViewController: UITableViewController {
    enum RefreshControlType: CustomStringConvertible {
        case interfaceBuilder
        case interfaceBuilderManual

        static var all: [RefreshControlType] {
            return [
                .interfaceBuilder,
                .interfaceBuilderManual
            ]
        }

        var description: String {
            switch self {
            case .interfaceBuilder:
                return "Interface builder"
            case .interfaceBuilderManual:
                return "Interface builder manually triggered"
            }
        }

        var viewController: UIViewController {
            switch self {
            case .interfaceBuilder:
                return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InterfaceRefreshControlVC")
            case .interfaceBuilderManual:
                return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "InterfaceRefreshControlVC")
            }
        }
    }

    let dataSource = ReusableTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Type selection"

        tableView.dataSource = dataSource

        let types = RefreshControlType.all

        dataSource.present(
            presentableViewModels: types.map {
                ReusableViewModel<TitleTableViewCell>(
                    viewModel: TitleTableViewCellViewModel(
                        titleViewModel: TextViewModel(text: String(describing: $0))
                    )
                ).anyPresentable
            },
            on: tableView
        )
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(RefreshControlType.all[indexPath.row].viewController, animated: true)
    }
}
