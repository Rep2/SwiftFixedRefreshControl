import UIKit

class TableViewWithRefreshControl: UITableView {
    lazy var notFoundLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 50))

        label.text = NSLocalizedString("No data", comment: "No data table view label text")
        label.textColor = .darkGray
        label.isHidden = true
        label.textAlignment = .center

        self.backgroundView = label

        return label
    }()

    init(style: UITableViewStyle) {
        super.init(frame: .zero, style: style)

        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupSubviews()
    }

    func setupSubviews() {
        DispatchQueue.main.async {
            self.refreshControl = UIRefreshControl()
            self.addSubview(self.refreshControl!)
        }
    }

    override func reloadData() {
        super.reloadData()

        notFoundLabel.isHidden = numberOfSections > 0
    }

    func startAnimatingRefreshControl() {
        setContentOffset(CGPoint(x: 0, y: -(refreshControl?.bounds.height ?? 0)), animated: false)
        refreshControl?.beginRefreshing()
    }

    func stopAnimatingRefreshControl() {
        refreshControl?.endRefreshing()
    }
}
