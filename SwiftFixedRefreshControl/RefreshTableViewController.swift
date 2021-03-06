import UIKit

open class RefreshTableViewController: UITableViewController {
    private var isLoading: Bool = false

    public var isUserInteractionEnabled = true {
        didSet {
            if isUserInteractionEnabled {
                if refreshControl == nil {
                    refreshControl = refreshControlInstance
                }
            } else {
                if let refreshControl = refreshControl, !refreshControl.isRefreshing {
                    self.refreshControl = nil
                }
            }
        }
    }

    public func beginRefreshing() {
        if refreshControl == nil {
            refreshControl = refreshControlInstance
        }

        refreshControl?.beginRefreshing()
        isLoading = true
    }

    public func endRefreshing() {
        refreshControl?.endRefreshing()
        isLoading = false

        if !isUserInteractionEnabled {
            refreshControl = nil
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = refreshControlInstance

        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        restartRefreshControl()
    }

    private func restartRefreshControl() {
        if isLoading {
            refreshControl = refreshControlInstance
            refreshControl?.beginRefreshing()
        }
    }

    private var refreshControlInstance: UIRefreshControl {
        let refreshControl = UIRefreshControl()

        refreshControl.addTarget(self, action: #selector(refreshControlValueChanged), for: .valueChanged)

        return refreshControl
    }

    @objc
    open func refreshControlValueChanged() {
        isLoading = true
    }

    @objc
    private func applicationWillEnterForeground() {
        restartRefreshControl()
    }
}
