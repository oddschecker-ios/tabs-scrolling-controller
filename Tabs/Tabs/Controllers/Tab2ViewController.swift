
import UIKit

class Tab2ViewController: UIViewController {

    fileprivate let tableView = UITableView()
    weak var delegate: TabScrollViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupHierarchy()
        setupConstraints()
    }

    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.pinToSuperviewEdges()
    }
}

extension Tab2ViewController: TabChildComponent {

    var viewController: UIViewController {
        return self
    }

    func updateInset(inset: UIEdgeInsets) {
        tableView.contentInset = inset
    }
}

extension Tab2ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)

        cell.textLabel?.text = NSLocalizedString("UITableViewCell", comment: "")

        return cell

    }    
}

extension Tab2ViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        delegate?.scrollDidScroll(offset: scrollView.contentOffset.y)
    }
}
