import UIKit

class InterfaceBuilderRefreshVC: SelectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = RefreshControlType.interfaceBuilder.description

        tableView.refreshControl?.beginRefreshing()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}
