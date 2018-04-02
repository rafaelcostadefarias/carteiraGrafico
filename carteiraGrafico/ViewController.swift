//
//  ViewController.swift
//  carteiraGrafico
//
//  Created by Rafael Farias on 02/04/18.
//  Copyright © 2018 Rafael Farias. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var rfStepper: UIStepper!
    @IBOutlet weak var rvStepper: UIStepper!
    
    @IBOutlet weak var pieCarteira: PieChartView!
    
    //MARK: Propriedades
    var rfDataEntry = PieChartDataEntry(value: 0)
    var rvDataEntry = PieChartDataEntry(value: 0)
    
    var alocacaoCarteira = [PieChartDataEntry]()
    
    
    //MARK: Métodos ViewContriller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rfStepper.value = 30
        rvStepper.value = 70
        
        pieCarteira.chartDescription?.text = ""
        
        rfDataEntry.value = rfStepper.value
        rfDataEntry.label = "Renda Fixa"
        
        rvDataEntry.value = rvStepper.value
        rvDataEntry.label = "Renda Variável"
        
        alocacaoCarteira = [rfDataEntry, rvDataEntry]
        
        updateChartData()
        
        
    }

    //MARK: Actions

    @IBAction func changeRF(_ sender: UIStepper) {
        rfDataEntry.value = sender.value
        rvDataEntry.value = abs(sender.value - 100)
        rvStepper.value = rvDataEntry.value
        updateChartData()
        
    }
    

    @IBAction func changeRV(_ sender: UIStepper) {
        rvDataEntry.value = sender.value
        rfDataEntry.value = abs(sender.value - 100)
        rfStepper.value = rfDataEntry.value
        updateChartData()
    }
    
    //MARK: Métodos próprios
    func updateChartData(){
        
        let chartDataSet = PieChartDataSet(values: alocacaoCarteira, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let pieColors = [UIColor.blue, UIColor.red]
        
        chartDataSet.colors = pieColors
        
        pieCarteira.data = chartData
        
    }
    
}

