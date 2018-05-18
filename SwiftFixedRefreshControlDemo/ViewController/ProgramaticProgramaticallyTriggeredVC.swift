import UIKit

class ProgramaticRefreshVC: SelectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = RefreshControlType.programatic.description

        refreshControl = UIRefreshControl()
    }
}
