import UIKit

open class RefreshTableViewController: UITableViewController {
    private var isLoading: Bool = false

    public func beginRefreshing() {
        refreshControl?.beginRefreshing()
        isLoading = true
    }

    public func endRefreshing() {
        refreshControl?.endRefreshing()
        isLoading = false
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = refreshControlInstance
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isLoading {
            refreshControl = refreshControlInstance
            refreshControl?.beginRefreshing()
        }
    }

    private var refreshControlInstance: UIRefreshControl {
        let refreshControl = UIRefreshControl()

        refreshControl.addTarget(self, action: #selector(RefreshTableViewController.refreshControlValueChanged), for: .valueChanged)

        return refreshControl
    }

    @objc
    func refreshControlValueChanged() {
        isLoading = true
    }
}
