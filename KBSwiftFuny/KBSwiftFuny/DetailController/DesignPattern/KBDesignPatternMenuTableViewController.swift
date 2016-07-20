//
//  KBDesignPatternMenuTableViewController.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/18.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import UIKit

class KBDesignPatternMenuTableViewController: UITableViewController {
    
    
    

    let groups = ["创建型模式(5种)","结构型模式（7种）","行为型模式(11种)"]
    
    let patternMenus = [["简单工厂方法模式","抽象工厂模式","单例模式","建造者模式","原型模式"]
                        ,["适配器模式","装饰器模式","代理模式","外观模式","桥接模式","组合模式","享元模式"]
                        ,["策略模式","模板方法模式","观察者模式","迭代子模式","责任链模式","命令模式","备忘录模式","状态模式","访问者模式","中介者模式","解释器模式"]]
    
    
    let controls:NSArray=[[SimpleFactoryController()],[]]
    

    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="设计模式列表"
        

        
        self.tableView.tableHeaderView=headView;
        
    }

    
   var headView:UIView {
    let tempView=UIView()
    tempView.backgroundColor=UIColor.yellowColor()
    tempView.frame=CGRectMake(0, 0,CGRectGetWidth( self.view.frame), 200)
    
    
    //设计模式
    let descrptionLabel=UILabel()
    descrptionLabel.frame=CGRectMake(0, 0,CGRectGetWidth( self.view.frame), 200)
    descrptionLabel.textColor=UIColor.blackColor()
    descrptionLabel.textAlignment=NSTextAlignment.Left
    descrptionLabel.numberOfLines=0
    descrptionLabel.font=UIFont.systemFontOfSize(14.0)
    
    let titleStr="设计模式的六大原则.\n\r 1、单一职责原则.\n2、里氏替换原则（Liskov Substitution Principle）\n3、依赖倒转原则（Dependence Inversion Principle）.\n4、接口隔离原则（Interface Segregation Principle）.\n5、迪米特法则（最少知道原则）（Demeter Principle）\n6、合成复用原则（Composite Reuse Principle）"
    let attributeString=NSMutableAttributedString(string: titleStr)
    
    attributeString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(18.0), range: NSMakeRange(0, 10))
    
    
    descrptionLabel.attributedText=attributeString
    tempView.addSubview(descrptionLabel)
    return tempView;
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return groups.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return patternMenus[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let reuseIdentifier = "reuseIdentifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier)

        // Configure the cell...
        if cell==nil {
            cell=UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
            cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
        }

        cell!.textLabel?.text=patternMenus[indexPath.section][indexPath.row]
        return cell!
    }

    

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groups[section]
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.section>controls.count-1) {
            return
        }
    
        let arry=controls.objectAtIndex(indexPath.section) as? NSArray;
        if (arry==nil||indexPath.row>arry!.count-1){
            return
        }
        
        let controller=arry?[indexPath.row] as! UIViewController;
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
