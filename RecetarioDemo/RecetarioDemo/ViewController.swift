//
//  ViewController.swift
//  RecetarioDemo
//
//  Created by Montserrat De la Paz on 04/03/21.
//  Copyright © 2021 Montserrat De la Paz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    final let urlBusqueda = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=X")
    private var meals = [Menu]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listarMenu()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func listarMenu(){
        guard let listarURL = urlBusqueda else { return }
        
        URLSession.shared.dataTask(with: listarURL){data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("error al cargar el menu")
                return
            }
            print("Menu completo")
            do {
                let decorder = JSONDecoder()
                let listarMenus = try decorder.decode(Meals.self, from: data)
                self.meals = listarMenus.meals
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Intente de nuevo mas tarde")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell else { return UITableViewCell() }
        cell.nombrebl.text = "Nombre: " + meals[indexPath.row].strMeal
        cell.categoriabl.text = "Categoria: " + meals[indexPath.row].strCategory
        
        if let imageURL = URL(string: meals[indexPath.row].strMealThumb){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        
        return cell
        
    }
}

