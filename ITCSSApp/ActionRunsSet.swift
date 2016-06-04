//
//  File.swift
//  ITCSSApp
//
//  Created by Pankaj Singh on 6/4/16.
//  Copyright © 2016 Pankaj Singh. All rights reserved.
//

import Foundation
class ActionRunsSet
{
    var shift: String=""
    func getActionRuns(shift:String)->[ActionRun]
    {
        switch(shift)
        {
            case "Opening": return getOpeningTask()
            
        case "Closing": return getClosingTask()
            
         default: return getRoutineTask()
            
        }
    }
    func  getOpeningTask()->[ActionRun]
    {
        var task:[ActionRun]=[ActionRun]()
        var task1 : ActionRun = ActionRun(name: "task1",description: "task1 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task2",description: "task2 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task3",description: "task3 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task4",description: "task4 Descriotion")
        task.append(task1)
        return task
    }
    func  getClosingTask()->[ActionRun]
    {
        var task:[ActionRun]=[ActionRun]()
        var task1 : ActionRun = ActionRun(name: "task1",description: "task1 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task2",description: "task2 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task3",description: "task3 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task4",description: "task4 Descriotion")
        task.append(task1)
        return task
    }
    func  getRoutineTask()->[ActionRun]
    {
        var task:[ActionRun]=[ActionRun]()
        var task1 : ActionRun = ActionRun(name: "task1",description: "task1 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task2",description: "task2 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task3",description: "task3 Descriotion")
        task.append(task1)
        task1 = ActionRun(name: "task4",description: "task4 Descriotion")
        task.append(task1)
        return task
    }

    
}
