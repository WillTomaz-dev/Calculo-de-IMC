//
//  ViewController.swift
//  Calculo IMC
//
//  Created by William Tomaz on 14/10/19.
//  Copyright © 2019 William Tomaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightValue: UITextField!
    @IBOutlet weak var heightValue: UITextField!
    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var viewBackground: UIView!
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        self.view.endEditing(true)
        self.viewBackground.isHidden = true
        
        var resultCalculate: Float
        
        let weight = (weightValue.text! as NSString).floatValue
        
        var height = (heightValue.text! as NSString).floatValue
        
        height = height * height
        
        resultCalculate = weight / height
        
        if weightValue.text!.isEmpty {
            let vazio = UIAlertController(title: "Campo vazio!", message: "Digite o seu peso para calcular", preferredStyle: .alert)
            let confirmar = UIAlertAction(title: "Confirmar", style: .destructive, handler: nil)
            present(vazio, animated: true, completion: nil)
            vazio.addAction(confirmar)
        } else if heightValue.text!.isEmpty {
            let vazio = UIAlertController(title: "Campo vazio!", message: "Digite a sua altura para calcular", preferredStyle: .alert)
            let confirmar = UIAlertAction(title: "Confirmar", style: .destructive, handler: nil)
            present(vazio, animated: true, completion: nil)
            vazio.addAction(confirmar)
        } else if (resultCalculate <= 18.5){
        //magreza
            self.viewBackground.isHidden = false
            resultValue.text = String(format: "%.2f Magreza", resultCalculate)
            resultImage.image = UIImage(named: "magreza")
        } else if (resultCalculate >= 18.6 && resultCalculate <= 24.9){
        //normal
            self.viewBackground.isHidden = false
            resultValue.text = String(format: "%.2f Ideal", resultCalculate)
            resultImage.image = UIImage(named: "ideal")
        } else if (resultCalculate >= 25.0 && resultCalculate <= 29.9 ){
        //acima
            self.viewBackground.isHidden = false
            resultValue.text = String(format: "%.2f Sobrepeso", resultCalculate)
            resultImage.image = UIImage(named: "sobre")
        } else {
        //obeso
            self.viewBackground.isHidden = false
            resultValue.text = String(format: "%.2f Obeso", resultCalculate)
            resultImage.image = UIImage(named: "obesidade")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBackground.isHidden = true
    }


}

