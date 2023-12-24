//
//  ViewController.swift
//  SampleFileIO
//
//  Created by 부재식 on 12/24/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var writeBtn: UIButton!
    @IBOutlet weak var readBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    lazy var fileManager = {
        return FileManager.default
    }()
    
    lazy var desktopDirectory = {
        return fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first
    }()
    
    lazy var documentDirectory = {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    }()
    
    lazy var libraryDirectory = {
        return fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first
    }()
    
    lazy var userDirectory = {
        return fileManager.urls(for: .userDirectory, in: .userDomainMask).first
    }()
    
    lazy var downloadDirectory = {
        return fileManager.urls(for: .downloadsDirectory, in: .userDomainMask).first
    }()
    
    lazy var trashDirectory = {
        return fileManager.urls(for: .trashDirectory, in: .userDomainMask).first
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        printDiversePath()
        initView()
    }
    
    private func printDiversePath() {
        
        print("desktopDirectory: \(desktopDirectory?.absoluteString ?? "")")
        print("documentDirectory: \(documentDirectory?.absoluteString ?? "")")
        print("libraryDirectory: \(libraryDirectory?.absoluteString ?? "")")
        print("userDirectory: \(userDirectory?.absoluteString ?? "")")
        print("downloadDirectory: \(downloadDirectory?.absoluteString ?? "")")
        print("trashDirectory: \(trashDirectory?.absoluteString ?? "")")
        
        let dirName = "dir"
        let dirPath = documentDirectory?.appendingPathComponent(dirName)
        print("dirPath: \(dirPath?.absoluteString ?? "")")
        
    }
    
    private func initView() {
        writeBtn.addTarget(self, action: #selector(clickWriteBtn), for: .touchUpInside)
        readBtn.addTarget(self, action: #selector(clickReadBtn), for: .touchUpInside)
        deleteBtn.addTarget(self, action: #selector(clickDeleteBtn), for: .touchUpInside)
        
        
    }
    
    @objc
    func clickWriteBtn() {
        print("clickWriteBtn")
        
        do {
            let fileName = "testFile.txt"
            guard let filePath = documentDirectory?.appendingPathComponent(fileName) else { return }
            print("filePath: \(filePath.absoluteString)")
            
            let data = "Hello World!"
            try data.write(to: filePath, atomically: false, encoding: .utf8)
        } catch let error {
            print("write error : \(error.localizedDescription)")
        }
    }
    
    @objc
    func clickReadBtn() {
        print("clickReadBtn")
        
        do {
            let fileName = "testFile.txt"
            guard let filePath = documentDirectory?.appendingPathComponent(fileName) else { return }
            print("filePath: \(filePath.absoluteString)")
            
            let data = try String(contentsOf: filePath, encoding: .utf8)
            contentLabel.text = data
            
        } catch let error {
            print("read error : \(error.localizedDescription)")
        }
    }
    
    @objc
    func clickDeleteBtn() {
        print("clickDeleteBtn")
        
        do {
            let fileName = "testFile.txt"
            guard let filePath = documentDirectory?.appendingPathComponent(fileName) else { return }
            print("filePath: \(filePath.absoluteString)")
            
            try fileManager.removeItem(at: filePath)
        } catch let error {
            print("delete error : \(error.localizedDescription)")
        }
    }
    
    
    
    
    
    
    
    


}

