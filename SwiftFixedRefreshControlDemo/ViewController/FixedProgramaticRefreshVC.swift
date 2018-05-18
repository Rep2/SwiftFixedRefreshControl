import UIKit

class FixedProgramaticRefreshVC: SelectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = RefreshControlType.programatic.description

        refreshControl = UIRefreshControl()
        refreshControl?.isOpaque = false

        tableView.refreshControl?.beginRefreshing()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}
