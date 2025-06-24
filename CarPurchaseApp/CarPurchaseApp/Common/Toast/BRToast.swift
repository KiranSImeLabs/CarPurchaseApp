//
//  BRToast.swift
//  Brollert
//
//  Created by Simelabs on 23/10/24.
//

import UIKit
class Toast {
    static func show(message: String, on baseView: UIView, backgdColor:UIColor = .black, txtColor:UIColor = .white) {
        let containerView = UIView()
        containerView.backgroundColor = backgdColor.withAlphaComponent(1)
        containerView.alpha = 0
        containerView.layer.cornerRadius = 25
        containerView.clipsToBounds = true

        let toastLabel = UILabel()
        toastLabel.textColor = txtColor
        toastLabel.textAlignment = .center
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        
        baseView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(greaterThanOrEqualTo: baseView.leadingAnchor, constant: 30).isActive = true
        containerView.trailingAnchor.constraint(lessThanOrEqualTo: baseView.trailingAnchor, constant: -30).isActive = true
        containerView.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        containerView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true

        containerView.addSubview(toastLabel)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
        toastLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15).isActive = true

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            containerView.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                containerView.alpha = 0
            }, completion: { _ in
                containerView.removeFromSuperview()
            })
        })
    }
}
