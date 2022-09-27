//
//  ViewController.swift
//  AlumnosTable
//
//  Created by Alumno on 9/22/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class AlumnosController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvAlumnos: UITableView!
    var Alumnos : [Alumno] = []
    
    //Altura de celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //Nùmero de secciones que tiene mi table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas por seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alumnos.count
    }
    
    //Construye cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAlumno") as? CeldaAlumnoController
        celda?.lblNombre.text = Alumnos[indexPath.row].nombre
        celda?.lblMatricula.text = Alumnos[indexPath.row].matricula
        celda?.lblCarrera.text = Alumnos[indexPath.row].carrera
        celda?.lblEdad.text = Alumnos[indexPath.row].edad
        return celda!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Alumnos.append(Alumno(nombre: "Max Rivera", matricula: "199177", carrera: "Multimedia", edad: "21"))
        Alumnos.append(Alumno(nombre: "Daney Arvayo", matricula: "199468", carrera: "Multimedia", edad: "23"))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! DetallesAlumnoController
        destino.alumno = Alumnos[tvAlumnos.indexPathForSelectedRow!.row]
    }
}

