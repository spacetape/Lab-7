import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        // Добавьте настройку интерфейса для ProfileViewController здесь
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
}
