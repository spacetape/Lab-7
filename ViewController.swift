import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        // Создание логотипа
        let logoImageView = UIImageView(image: UIImage(named: "your_logo")) // Замените "your_logo" на имя вашего логотипа
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // Расположение логотипа
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200), // Размеры логотипа
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Создание кнопок
        let buttonTitles = ["Browse Services", "View Orders", "View Profile"]
        var previousButton: UIButton?

        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.backgroundColor = .blue // Цвет кнопки
            button.layer.cornerRadius = 10 // Скругление углов кнопки
            button.setTitleColor(.white, for: .normal) // Цвет текста кнопки
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Шрифт текста кнопки
            button.tag = index // Установка тега для идентификации кнопки
            view.addSubview(button)

            // Расположение кнопок
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])

            if let previousButton = previousButton {
                button.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: 20).isActive = true
            } else {
                button.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50).isActive = true
            }

            previousButton = button
        }
    }

    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            performSegue(withIdentifier: "segueToServices", sender: nil)
        case 1:
            performSegue(withIdentifier: "segueToOrders", sender: nil)
        case 2:
            performSegue(withIdentifier: "segueToProfile", sender: nil)
        default:
            break
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Подготовка перед переходом на другие страницы (если необходимо)
    }
}
