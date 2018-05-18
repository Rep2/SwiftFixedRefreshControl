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

        NotificationCenter.default.addObserver(self, selector: #selector(RefreshTableViewController.applicationWillEnterForeground), name: .UIApplicationWillEnterForeground, object: nil)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        restartRefreshControl()
    }

    @objc
    private func applicationWillEnterForeground() {
        restartRefreshControl()
    }

    func restartRefreshControl() {
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
    open func refreshControlValueChanged() {
        isLoading = true
    }
}
