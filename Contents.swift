//: Playground - noun: a place where people can play

// Janet Weber  DUE 10/26/2015
// Using enumerations and structures, build a playground to prototype
// an interactive menu for my new gourmet burger bistro.

import UIKit

// ***************** Beverages  **********************
let beverageVarieties = ["Water","Wine","Coffee","None"]  // used to display beverage menu
enum BType {case water, wine, coffee, none}               // add more beverage varieties here
                                                          //    and immediately above
struct Bvg {                                    // Bvg (beverage) structure
    var variety: BType                          //   2 components (variety and cost)
    var cost : Float                            //   plus function getBvg
    
    func getBvg() -> String {                   // returns the string value of
        var rtrnStr : String = ""               //   enum setting.
        switch self.variety {
            case .water: rtrnStr = "Water"
            case .wine: rtrnStr = "Wine"
            case .coffee: rtrnStr = "Coffee"
            case .none: rtrnStr = "None"
        }
        return (rtrnStr)
    }
}

// ****************  Sides  ***********************
let sideVarieties = ["Salad","Steamed Vegies","Soup",     // used to diplay side menu
                "French Fries","Mashed Potatos"]          // add more side varieties here
enum SType {case salad, vegies, soup, fries, mpotatos}    //     and immediately above

struct Side {                                   // Side (side dish) structure
    var choice: SType                           //   2 components (choice and cost)
    var cost: Float                             //   plus function getSide
    
    func getSide() -> String {                  // returns the string value of
        var rtrnStr : String = ""               //    enum setting.
        switch self.choice {
            case .salad: rtrnStr = "Salad"
            case .vegies: rtrnStr = "Steamed Vegies"
            case .soup: rtrnStr = "Soup"
            case .fries: rtrnStr = "French Fries"
            case .mpotatos: rtrnStr = "Mashed Potatos"
        }
        return (rtrnStr)
    }
}

// ****************  Burgers  ****************
// Constant arrays for initial display of menu.
let burgerVarieties = ["Beef","Turkey","Vegie"]
let burgerDoneness = ["Well Done","Medium Well","Medium","Medium Rare","Rare"]
let burgerToppings = ["Lettuce","Tomato","Onion","Ketchup","Mustard","Mayo",
                   "Pickles","Jalapenos","Cheese"]
// Meat type enum, how well done enum and a toppings enum
enum MType {case beef, turkey, vegie}
enum Doneness {case well, mediumWell, medium, mediumRare, rare}
enum Toppings {case lettuce, tomato, onions, ketchup, mustard, mayo, pickles, jalapenos, cheese}

struct Burger {                 // burger structure with meat enum, cooked enum, array of
    var meat: MType             //     toppings (enum) and cost
    var cooked: Doneness
    var toppings : [Toppings]   // array of toppings (enum)
    var cost: Float
    
  }
// ************  MEAL  *********************
// Meal structure consting of 2 structures (burger, beverage) and
//     2 functions: description and getCost
struct Meal{
    var burger: Burger
    var beverage: Bvg
    var side : Side
    
    func description() -> String{               // gets values of enum settings and appends
        var i : Int                             //   them to a string to be returned.
        
        var descrStr : String = "  Burger => "
        switch (burger.meat){
            case .beef: descrStr = descrStr + "beef\n"
            case .turkey: descrStr = descrStr + "turkey\n"
            case .vegie: descrStr = descrStr + "vegie\n"
        }
        
        descrStr = descrStr + "     Cooked: "
        switch (burger.cooked){
            case .well: descrStr = descrStr + "Well-Done"
            case .mediumWell: descrStr = descrStr + "Medium-Well"
            case .medium: descrStr = descrStr + "Medium"
            case .mediumRare: descrStr = descrStr + "Medium-Rare"
            case .rare: descrStr = descrStr + "Rare"
        }
        
        descrStr = descrStr + "\n     Toppings: "
        i = 0;
        while (i<burger.toppings.count) {
            switch (burger.toppings[i]) {
                case .lettuce: descrStr = descrStr + "Lettuce "
                case .tomato: descrStr = descrStr + "Tomato "
                case .onions: descrStr = descrStr + "Onion "
                case .ketchup: descrStr = descrStr + "Ketchup "
                case .mustard: descrStr = descrStr + "Mustard "
                case .mayo: descrStr = descrStr + "Mayo "
                case .pickles: descrStr = descrStr + "Pickles "
                case .jalapenos: descrStr = descrStr + "Jalapenos "
                case .cheese: descrStr = descrStr + "Cheese "
            }
            i++
        }

        descrStr = descrStr + "\n  Side => " + side.getSide()
        descrStr = descrStr + "\n  Beverage => " + beverage.getBvg()
        descrStr = descrStr + "\n  Meal Cost => $\(burger.cost+beverage.cost)"
        return (descrStr)
    }
    
    func getCost() -> Float {                   // returns the cost of the meal
        var cost : Float
        cost = burger.cost+beverage.cost+side.cost
        return(cost)
    }
}


var table : [Meal]  // holds an array of meals
var j : Int         // integer loop variable
var tab : Float     // used to caluclate tab (cost) for entire table
// ************************************************************
//
//  Main Program
//
// *****************************************************
//
//  ******   Display Menu **********
println("Bill's WeBurgers!  MENU")
println("\nBurgers")
for (var i:Int = 0; i<burgerVarieties.count; i++){
    println("   \(burgerVarieties[i])")
}
println("\n   Burger Doneness Preference")
for (var i:Int=0; i<burgerDoneness.count; i++) {
    println("      \(burgerDoneness[i])")
}
println("\n   Burger Toppings Available")
for (var i:Int=0; i<burgerToppings.count; i++){
    println("      \(burgerToppings[i])")
}
println("\nSides")
for (var i:Int = 0; i<sideVarieties.count; i++) {
    println("   \(sideVarieties[i])")
}
println("\nBeverages")
for (var i:Int = 0; i<beverageVarieties.count; i++){
    println("   \(beverageVarieties[i])")
    if (beverageVarieties[i] == "Wine"){
       println("     Red\n     White")}
}
println("\n\n")

// **** get table one's order  ******
println ("TABLE #1")
let JanetsBeverage = Bvg(variety: BType.coffee, cost: 2)
let JanetsBurger = Burger(meat: MType.beef, cooked: Doneness.medium, toppings: [.lettuce,.tomato,.onions,.jalapenos,.mustard], cost: 7.95)
let JanetsSide = Side(choice: SType.vegies, cost: 3.50)
let JanetsMeal = Meal(burger: JanetsBurger, beverage: JanetsBeverage, side: JanetsSide)
println("Janet's meal: ")
println(JanetsMeal.description())

let MarksBeverage = Bvg(variety: BType.water, cost: 0)
let MarksBurger = Burger(meat: MType.turkey, cooked: Doneness.well, toppings: [.lettuce,.tomato,.mayo,.cheese],
    cost: 8.95)
let MarksSide = Side(choice: SType.mpotatos, cost: 3.95)
let MarksMeal = Meal(burger: MarksBurger, beverage: MarksBeverage, side: MarksSide)
println("\nMark's meal: ")
println(MarksMeal.description())

let HannahsBeverage = Bvg(variety: BType.none, cost: 0)
let HannahsBurger = Burger(meat: MType.turkey, cooked: Doneness.mediumWell, toppings: [.cheese,.lettuce,.tomato,.ketchup], cost: 6.95)
let HannahsSide = Side(choice: SType.fries, cost: 2.25)
let HannahsMeal = Meal(burger: HannahsBurger, beverage: HannahsBeverage, side: HannahsSide)
println("\nHannah's Meal: ")
println(HannahsMeal.description())

let ChristiansBeverage = Bvg(variety: BType.wine, cost: 4.5)
let ChristiansBurger = Burger(meat: MType.beef, cooked: Doneness.well, toppings: [.cheese, .mayo, .pickles],
    cost: 7.25)
let ChristiansSide = Side(choice: SType.salad, cost: 3.25)
let ChristiansMeal = Meal(burger: ChristiansBurger, beverage: ChristiansBeverage, side: ChristiansSide)
println("\nChristian's Meal: ")
println(ChristiansMeal.description())

// assign meals to table and get total tab (display)
table = [JanetsMeal, MarksMeal, HannahsMeal, ChristiansMeal]
j = 0;
tab = 0;
while (j<table.count){
    tab = tab + table[j].getCost()
    j++
}
println("\nTab for the entire table => $\(tab)")


