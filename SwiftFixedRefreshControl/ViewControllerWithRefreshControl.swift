import UIKit

class ViewControllerWithRefreshControl: UIViewController {
    private var isAnimating: Bool = false

    let tableView = TableViewWithRefreshControl(style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        view = tableView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isAnimating {
            tableView.startAnimatingRefreshControl()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        tableView.stopAnimatingRefreshControl()
        tableView.setContentOffset(.zero, animated: true)
    }

    public func setNotFoundLabelText(_ text: String) {
        tableView.notFoundLabel.text = text
    }

    public func didStartLoading() {
        isAnimating = true

        tableView.startAnimatingRefreshControl()
    }

    public func didEndLoading() {
        isAnimating = false

        tableView.stopAnimatingRefreshControl()
    }
}
