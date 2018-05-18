import UIKit

class Fix1Attempt: SelectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = RefreshControlType.programatic.description

        refreshControl = UIRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.refreshControl?.beginRefreshing()
        tableView.scrollRectToVisible(CGRect(x: 0, y: (tableView.refreshControl?.bounds.height ?? 0), width: 0, height: 0), animated: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}
