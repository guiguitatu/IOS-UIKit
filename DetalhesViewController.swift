// File: DetalhesViewController.swift
// Exibe detalhes de uma obra, em modo Dark

import UIKit

class DetalhesViewController: UIViewController {
    // MARK: - Propriedades
    var obra: ObraDeArte?

    // MARK: - Outlets
    @IBOutlet weak var imagemObra: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var artistaLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var estiloLabel: UILabel!
    @IBOutlet weak var descricaoTextView: UITextView!

    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fundo e cores de texto
        view.backgroundColor = .darkGray
        descricaoTextView.backgroundColor = .darkGray

        tituloLabel.textColor = .white
        artistaLabel.textColor = .white
        anoLabel.textColor = .white
        estiloLabel.textColor = .white
        descricaoTextView.textColor = .white

        // Preenche dados
        if let obra = obra {
            imagemObra.image = UIImage(named: obra.imagemNome)
            tituloLabel.text = obra.titulo
            artistaLabel.text = obra.artista
            anoLabel.text = "Ano: \(obra.ano)"
            estiloLabel.text = "Estilo: \(obra.estilo)"
            descricaoTextView.text = obra.descricao
        }
    }

    // MARK: - Ações
    @IBAction func compartilharObra(_ sender: UIButton) {
        guard let obra = obra else { return }
        let texto = "Confira “\(obra.titulo)” do artista \(obra.artista)."
        let activityVC = UIActivityViewController(
            activityItems: [texto],
            applicationActivities: nil
        )
        present(activityVC, animated: true)
    }

    @IBAction func voltar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
