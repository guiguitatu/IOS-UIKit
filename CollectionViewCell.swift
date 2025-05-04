// File: CollectionViewCell.swift
// Célula customizada para exibir cada obra em modo Dark

import UIKit

class CollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!   // Miniatura da obra
    @IBOutlet weak var tituloLabel: UILabel!     // Título exibido
    @IBOutlet weak var artistaLabel: UILabel!    // Artista exibido

    override func awakeFromNib() {
        super.awakeFromNib()

        // Aparência da imagem
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true

        // Sombra da célula
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false

        // Cantos arredondados no conteúdo
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true

        // Fundo escuro e texto branco
        backgroundColor = .darkGray
        tituloLabel.textColor = .white
        artistaLabel.textColor = .white

        // Fonte e linhas
        tituloLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        artistaLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        tituloLabel.numberOfLines = 2
        artistaLabel.numberOfLines = 1
    }

    // Popula a célula com dados da obra
    func configure(with obra: ObraDeArte) {
        imageView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
    }
}
