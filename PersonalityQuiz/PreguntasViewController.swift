//
//  PreguntasViewController.swift
//  PersonalityQuiz
//
//  Created by Дмитрий Имаев on 25.12.2022.
//

import UIKit

class PreguntasViewController: UIViewController {

    @IBOutlet weak var preguntaLabel: UILabel!
        
    
    
    @IBOutlet weak var singleStack: UIStackView!
    
    @IBOutlet weak var singleStackButton1: UIButton!
    @IBOutlet weak var singleStackButton2: UIButton!
    @IBOutlet weak var singleStackButton3: UIButton!
    @IBOutlet weak var singleStackButton4: UIButton!
    @IBOutlet weak var singleStackButton5: UIButton!
    @IBOutlet weak var singleStackButton6: UIButton!
    

    @IBOutlet weak var multiplyStack: UIStackView!
    
    @IBOutlet weak var multiplyStackLabel1: UILabel!
    @IBOutlet weak var multiplyStackLabel2: UILabel!
    @IBOutlet weak var multiplyStackLabel3: UILabel!
    @IBOutlet weak var multiplyStackLabel4: UILabel!
    @IBOutlet weak var multiplyStackLabel5: UILabel!
    @IBOutlet weak var multiplyStackLabel6: UILabel!
    
    @IBOutlet weak var multiplyStackSwitch1: UISwitch!
    @IBOutlet weak var multiplyStackSwitch2: UISwitch!
    @IBOutlet weak var multiplyStackSwitch3: UISwitch!
    @IBOutlet weak var multiplyStackSwitch4: UISwitch!
    @IBOutlet weak var multiplyStackSwitch5: UISwitch!
    @IBOutlet weak var multiplyStackSwitch6: UISwitch!
    

    
    @IBOutlet weak var rangedStack: UIStackView!
    
    @IBOutlet weak var rangedStackLabel1: UILabel!
    @IBOutlet weak var rangedStackLabel2: UILabel!
    
    @IBOutlet weak var rangedStackSlider: UISlider!
    
    
    @IBOutlet weak var progressoDePreguntas: UIProgressView!
    
    
    
    
    var preguntas: [Preguntas] = [
          Preguntas(
              text: "Que color te gusta mas?",
              tipo: .single,
              answers: [
                  Answer(text: "Azul", tipo: .azul),
                  Answer(text: "Rojo", tipo: .rojo),
                  Answer(text: "Verde", tipo: .verde),
                  Answer(text: "Amarillo", tipo: .amarillo),
                  Answer(text: "Naranja", tipo: .naranja),
                  Answer(text: "Rosa", tipo: .rosa)
              ]
                  ),
          Preguntas(
              text: "Que te interesa?",
              tipo: .multiply,
              answers: [
                  Answer(text: "Carreras", tipo: .azul),
                  Answer(text: "Medicina", tipo: .rojo),
                  Answer(text: "Limpiar", tipo: .verde),
                  Answer(text: "Construir", tipo: .amarillo),
                  Answer(text: "Nadar", tipo: .naranja),
                  Answer(text: "Volar", tipo: .rosa)
              ]
          ),
          Preguntas(text: "Que tan activo eres?",
                    tipo: .ranged,
                    answers: [
                      Answer(text: "No soy activo", tipo: .verde),
                      Answer(text: "Un poco", tipo: .naranja),
                      Answer(text: "Normal", tipo: .rojo),
                      Answer(text: "Como todos", tipo: .rosa),
                      Answer(text: "Soy muy activo", tipo: .amarillo),
                      Answer(text: "Soy demasiado activo", tipo: .azul)
                    ]
                   )
          ]
    
    var indexDePreguntas = 0
    
    
    func updateSingleStack(using answers: [Answer]){
        singleStack.isHidden = false
        singleStackButton1.setTitle(answers[0].text, for: .normal)
        singleStackButton2.setTitle(answers[1].text, for: .normal)
        singleStackButton3.setTitle(answers[2].text, for: .normal)
        singleStackButton4.setTitle(answers[3].text, for: .normal)
        singleStackButton5.setTitle(answers[4].text, for: .normal)
        singleStackButton6.setTitle(answers[5].text, for: .normal)
    }
    
    func updateMultiplyStack(using answers: [Answer]){
        multiplyStack.isHidden = false
        multiplyStackSwitch1.isOn = false
        multiplyStackSwitch2.isOn = false
        multiplyStackSwitch3.isOn = false
        multiplyStackSwitch4.isOn = false
        multiplyStackSwitch5.isOn = false
        multiplyStackSwitch6.isOn = false
        multiplyStackLabel1.text = answers[0].text
        multiplyStackLabel2.text = answers[1].text
        multiplyStackLabel3.text = answers[2].text
        multiplyStackLabel4.text = answers[3].text
        multiplyStackLabel5.text = answers[4].text
        multiplyStackLabel6.text = answers[5].text
        
    }
    
    func updateRangedStack(using answers: [Answer]){
        rangedStack.isHidden = false
        rangedStackSlider.setValue(0.5, animated: false)
        rangedStackLabel1.text = answers.first?.text
        rangedStackLabel2.text = answers.last?.text
    }
    
    
    func updateUI(){
        singleStack.isHidden = true
        multiplyStack.isHidden = true
        rangedStack.isHidden = true
        
        let currentPreguntas = preguntas[indexDePreguntas]
        let currentAnswers = currentPreguntas.answers
        let totalProgress = Float(indexDePreguntas) / Float(preguntas.count)
        
        navigationItem.title = "Pregunta #\(indexDePreguntas + 1)"
        preguntaLabel.text = currentPreguntas.text
        progressoDePreguntas.setProgress(totalProgress, animated: true)
        
        switch currentPreguntas.tipo{
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiply:
           updateMultiplyStack(using: currentAnswers)
            
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBSegueAction func muestraResultados(_ coder: NSCoder) -> ResultadosViewController? {
        return ResultadosViewController(coder: coder, respuestas: answerChosen)
    }
    
    
    
    func nextPregunta(){
        indexDePreguntas += 1
        
        if indexDePreguntas < preguntas.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Resultados", sender: nil)
        }
        
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = preguntas[indexDePreguntas].answers
        
        switch sender {
        case singleStackButton1:
            answerChosen.append(currentAnswers[0])
        case singleStackButton2:
            answerChosen.append(currentAnswers[1])
        case singleStackButton3:
            answerChosen.append(currentAnswers[2])
        case singleStackButton4:
            answerChosen.append(currentAnswers[3])
        case singleStackButton5:
            answerChosen.append(currentAnswers[4])
        case singleStackButton6:
            answerChosen.append(currentAnswers[5])
        default:
            break
        }
        
        nextPregunta()
    }
    
    
    @IBAction func multiplyAnswerButtonPressed() {
        let currentAnswers = preguntas[indexDePreguntas].answers
        if multiplyStackSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiplyStackSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multiplyStackSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multiplyStackSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        if multiplyStackSwitch5.isOn {
            answerChosen.append(currentAnswers[4])
        }
        if multiplyStackSwitch6.isOn {
            answerChosen.append(currentAnswers[5])
        }
        
        nextPregunta()
    }
    
    
    @IBAction func rangedButtonPressed() {
        let currentAnswers = preguntas[indexDePreguntas].answers
        let index = Int(round(rangedStackSlider.value * Float(currentAnswers.count - 1)))
        answerChosen.append(currentAnswers[index])
        
        nextPregunta()
    }
    

    
    
    
    
    var answerChosen: [Answer] = []
    
    
  
                      

        }
            
