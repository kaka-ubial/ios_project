//
//  ObraDeArteView.swift
//  prova2
//
//  Created by user276492 on 4/27/25.
//

import UIKit

class ObraDeArteView: UICollectionViewCell {
    static let identifier = "ObraDeArteView"
    
    private let imagemView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        return img
    }()
    
    private let tituloLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    private let artistaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    // Inicializador padrao da celula, adiciona as subviews e configura o visual
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imagemView)
        contentView.addSubview(tituloLabel)
        contentView.addSubview(artistaLabel)
        contentView.backgroundColor = .systemGray2
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
    }
    
    // Inicializador obrigatorio que nao esta implementado
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Define a posicao e o tamanho dos elementos dentro da celula
    override func layoutSubviews() {
        super.layoutSubviews()
        imagemView.frame = CGRect(x: 5, y: 5, width: contentView.frame.width - 10, height: contentView.frame.width - 10)
        tituloLabel.frame = CGRect(x: 5, y: imagemView.frame.maxY + 5, width: contentView.frame.width - 10, height: 20)
        artistaLabel.frame = CGRect(x: 5, y: tituloLabel.frame.maxY + 5, width: contentView.frame.width - 10, height: 20)
    }
    
    // Configura a celula com os dados de uma obra de arte
    func configure(with obra: ObraDeArte) {
        imagemView.image = UIImage(named: obra.imagemNome)
        
        tituloLabel.text = obra.titulo
        tituloLabel.font = UIFont.systemFont(ofSize: 19)
        tituloLabel.textColor = .black
        
        artistaLabel.text = obra.artista
        artistaLabel.font = UIFont.italicSystemFont(ofSize: 14)
        artistaLabel.textColor = .black
    }
}
