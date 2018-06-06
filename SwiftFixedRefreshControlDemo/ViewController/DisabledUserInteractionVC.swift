import SwiftFixedRefreshControl
import SwiftViewModels
import SwiftGenericCells
import ReusableDataSource
import UIKit

class DisabledUserInteractionVC: RefreshTableViewController {
    let dataSource = ReusableTableViewDataSource()

    public override func viewDidLoad() {
        super.viewDidLoad()

        isUserInteractionEnabled = false

        title = "Type selection"

        tableView.dataSource = dataSource

        let types = RefreshControlType.all

        beginRefreshing()

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.endRefreshing()
        }

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

    override func refreshControlValueChanged() {
        super.refreshControlValueChanged()
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(RefreshControlType.all[indexPath.row].viewController, animated: true)
    }
}
