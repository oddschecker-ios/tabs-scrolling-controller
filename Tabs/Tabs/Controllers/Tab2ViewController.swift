
import UIKit

class Tab2ViewController: UIViewController {

    weak var delegate: TabScrollViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {}

    private func setupHierarchy() {}

    private func setupConstraints() {}
}

extension Tab2ViewController: TabChildComponent {

    var viewController: UIViewController {
        return self
    }
    
}

extension Tab1ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)

    }
    
}
extension Tab2ViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        delegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }
    
}
