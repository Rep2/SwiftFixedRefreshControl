import SwiftViewModels
import SwiftGenericCells
import ReusableDataSource
import UIKit

class SelectionViewController: UITableViewController {
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
