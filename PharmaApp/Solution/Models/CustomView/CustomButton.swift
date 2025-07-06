import UIKit

class BottomBorderButton: UIButton {
    private let bottomBorder = CALayer()
    /// Толщина линии
    var borderHeight: CGFloat = 2 {
        didSet { setNeedsLayout() }
    }

    /// Цвет линии (можно менять в любой момент)
    var borderColor: UIColor = .blue {
        didSet {
            bottomBorder.backgroundColor = borderColor.cgColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBorder()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBorder()
    }

    private func setupBorder() {
        bottomBorder.backgroundColor = borderColor.cgColor
        layer.addSublayer(bottomBorder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Обновляем фрейм линии при изменении размера кнопки
        let y = bounds.height - borderHeight
        bottomBorder.frame = CGRect(x: 0, y: y, width: bounds.width, height: borderHeight)
    }
}
