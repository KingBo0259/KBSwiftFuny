//
//  KBDesignPatternMenuTableViewController.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/18.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import UIKit

class KBDesignPatternMenuTableViewController: UITableViewController {
    
    typealias row = (title:String, classInstanll:UIViewController?)
    let groups = ["创建型模式(5种)","结构型模式（7种）","行为型模式(11种)"]
    
    let patternMenus : [[row]] = [
        //frist
        [("工厂方法模式",SimpleFactoryController()),("抽象工厂模式",RKPatternEmptyViewController()),
         ("单例模式", SingletonController()),
         ("建造者模式",nil),
         ("原型模式",nil)],
        //second
        [("适配器模式",nil),
         ("装饰器模式",nil),
                    ("代理模式",nil),
                    ("外观模式",nil),
                    ("桥接模式",nil),
                    ("组合模式",nil),
                    ("享元模式",nil)]
                    ,
        //third
        [("策略模式",nil),("模板方法模式",nil),("观察者模式",nil),("迭代子模式",nil),("责任链模式",nil),("命令模式",nil),("备忘录模式",nil),("状态模式",nil),("访问者模式",nil),("中介者模式",nil),("解释器模式",nil)]
    ]
    
    let controls:NSArray=[[SimpleFactoryController()],[]]
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="设计模式列表"
        tableView.tableHeaderView = headView
        hidesBottomBarWhenPushed = true
     }
    
   var headView:UIView {
    let tempView=UIView()
    tempView.backgroundColor=UIColor.yellow
    tempView.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
    
    //设计模式
    let descrptionLabel=UILabel()
    descrptionLabel.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
    descrptionLabel.textColor = UIColor.black
    descrptionLabel.textAlignment = NSTextAlignment.left
    descrptionLabel.numberOfLines = 0
    descrptionLabel.font = UIFont.systemFont(ofSize: 14.0)
    
    let titleStr="设计模式的六大原则.\n\r 1、单一职责原则.\n2、里氏替换原则（Liskov Substitution Principle）\n3、依赖倒转原则（Dependence Inversion Principle）.\n4、接口隔离原则（Interface Segregation Principle）.\n5、迪米特法则（最少知道原则）（Demeter Principle）\n6、合成复用原则（Composite Reuse Principle）"
    let attributeString=NSMutableAttributedString(string: titleStr)
    
    attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 18.0), range: NSMakeRange(0, 10))
    
    
    descrptionLabel.attributedText=attributeString
    tempView.addSubview(descrptionLabel)
    return tempView;
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return patternMenus[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "reuseIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        // Configure the cell...
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: reuseIdentifier)
            cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        cell!.textLabel?.text = (patternMenus[indexPath.section][indexPath.row]).title
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groups[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let rowData = patternMenus[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(rowData.classInstanll  ?? RKPatternEmptyViewController(), animated: true)
    }
}
