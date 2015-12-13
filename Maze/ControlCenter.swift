//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(robot: ComplexRobotObject) {
      
        let robotIsBlocked = isFacingWall(robot, direction: robot.direction)
        
        // Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(robot)
        print(myWallInfo)
        
        
        // Categorize the robot's current location based on the number of walls
        
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        // Test whether the values of the above constants are correct
        
        print(isThreeWayJunction)
        print(isTwoWayPath)
        print(isDeadEnd)
        
        // Three-way Path - else-if statements
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(robot)
        } else if  isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(robot, wallInfo: myWallInfo)
        } else if isTwoWayPath && !robotIsBlocked {
            robot.move()
        } else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(robot, wallInfo: checkWalls(robot))
        } else if isDeadEnd && !robotIsBlocked {
            robot.move()
        } else if isDeadEnd && robotIsBlocked {
            robot.rotateRight()
        }
        
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
        self.moveComplexRobot(robot)
    }
    
}