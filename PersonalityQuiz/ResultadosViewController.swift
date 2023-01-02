//
//  ResultadosViewController.swift
//  PersonalityQuiz
//
//  Created by Дмитрий Имаев on 25.12.2022.
//

import UIKit

class ResultadosViewController: UIViewController {

    @IBOutlet weak var imagenFinal: UIImageView!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var explicacionDeResultadoLabel: UILabel!
    
    
    var respuestas: [Answer]
    
    init?(coder: NSCoder, respuestas:[Answer]){
        self.respuestas = respuestas
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResultados()
        navigationItem.hidesBackButton = true
    }
    
    func calculateResultados(){
        let frequencyOfAnswer = respuestas.reduce(into: [:]) {
            (counts, answer) in counts[answer.tipo, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswer.sorted{$0.1 > $1.1}.first!.key
        
        resultadoLabel.text = "Eres \(mostCommonAnswer.rawValue)!"
        explicacionDeResultadoLabel.text = mostCommonAnswer.defenition
        imagenFinal.image = UIImage(named: mostCommonAnswer.rawValue)
        }
        
    }
    
