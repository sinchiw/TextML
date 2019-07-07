//
//  ViewController.swift
//  BusinessOrSportML
//
//  Created by Wilmer sinchi on 7/7/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var label: UILabel!
    

   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label.text = ""
        
        // Do any additional setup after loading the view.
    }
    @IBAction func predictTap(_ sender: Any) {
        guard let text = textfield.text else{return}
        //setting the empty textfeild as input so, see where it match and give the ouputs of a possible prediction
        let input = headlinesInput.init(text: text)
        guard let output = try? headlines().prediction(input: input) else{return}
        guard let feature = output.featureValue(for: "label") else {return}
        print(feature.stringValue)
        label.text = feature.stringValue
        
        
    }

}

/*As I mentioned in Training an Image Classification Model With Create ML, it's good practice to divide your datasets into two categories: one for training the model and one for testing. Since you want to give your actual model the most attention, 80% of your dataset should be used for training, and you should save the other 20% to make sure everything is working as it should. After all, that's important too!
 
 If you've seen the previous tutorial, you might find this concept familiar. It's simply included here in case you haven't. In essence, we'll be splitting up the data by using the randomSplit(by:seed:) method from MLDataTable.
 
 Paste the following line of code into your playground:
 
 1
 let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)
 Looking at the documentation, randomSplit(by:seed:) returns a tuple, which contains two MLDataTables. We'll be storing them as (trainingData, testingData), putting 80% of the dataset in trainingData and 20% in testingData. */

