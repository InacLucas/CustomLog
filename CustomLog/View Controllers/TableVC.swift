//
//  TableVC.swift
//  CustomLog
//
//  Created by treinamento on 25/09/19.
//  Copyright © 2019 in.kpro. All rights reserved.
//

import UIKit

class  TableVC: UITableViewController {
  
   
    
    
    var filmes: [Filme] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var filme: Filme
        
        filme = Filme(titulo: "Filme 1", descricao: "Descricao 1")
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 2", descricao: "Descricao 2")
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 3", descricao: "Descricao 3")
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 4", descricao: "Descricao 4")
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 5", descricao: "Descricao 5")
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 6", descricao: "Descricao 6")
        filmes.append(filme)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filme: Filme = filmes[indexPath.row]
        
        let celula = tableView.dequeueReusableCell(withIdentifier:"celulaReuso", for: indexPath) as! FilmeCelula
        
        celula.tituloLabel.text = filme.titulo
        celula.tituloLabel.textColor = UIColor.init(red: 199/255, green: 7/255, blue: 0/255, alpha: 1)
        celula.descricaoLabel.text = filme.descricao
        
        
        
        
        //celula.textLabel?.text = filme.titulo
        
        return celula
        
        
    }
    
    
}



