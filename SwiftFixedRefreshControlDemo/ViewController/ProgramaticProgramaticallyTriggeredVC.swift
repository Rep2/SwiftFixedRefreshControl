import UIKit

class ProgramaticRefreshVC: SelectionViewController {
    let refreshControl2 = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = RefreshControlType.programatic.description

        tableView.refreshControl = refreshControl2
        tableView.refreshControl?.beginRefreshing()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}
