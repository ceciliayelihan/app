//
//  RegisterViewController.swift
//  BeautyDiary
//
//  Created by Chih-Hsuan Cherng on 3/20/18.
//  Copyright © 2018 BeautyDiary. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    var users = [NSManagedObject]()
    var alertController: UIAlertController?

    @IBOutlet weak var lblRegister: UILabel!
    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    @IBAction func btnSignUp(_ sender: Any) {
        if txtFieldUsername.text == "" || txtFieldPassword.text == "" {
            self.alertController = UIAlertController(title: "Alert", message: "You must enter a value for all fields.", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            self.alertController!.addAction(OKAction)
            self.present(alertController!, animated: false, completion: nil)
        } else {
            saveUser(txtFieldUsername.text!, password:txtFieldPassword.text!)
            lblRegister.text = "User Saved!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Core Data Setup
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        var fetchedResults: [NSManagedObject]? = nil
        
        // Try and get data
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Set data to local variable
        if let results = fetchedResults {
            users = results
        } else {
            print("Could not fetch")
        }
    }
    
    func saveUser(_ username:String, password:String) {
        // Core Data Setup
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Set the attribute values
        user.setValue(username, forKey:"username")
        user.setValue(password, forKey:"password")
        // ...
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        users.append(user)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
