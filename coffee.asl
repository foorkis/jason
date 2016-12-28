/* Initial beliefs and rules */

coffeeGrinded(false).
coffeeBoiled(false).
coffeeServed(false).

/* Initial goals */

!start.

/* Plans */

+!start : true <-
 !needToGrindCoffee;
 !needToBoilCoffee;
 !needToServeCoffee;
 !finalCondition.

+!needToGrindCoffee: coffeeGrinded(false) <-
 .print ("needed to grind coffee");
 .send(cook1, achieve, grindCoffee).

+!needToBoilCoffee: coffeeGrinded(true) & coffeeBoiled(false) <-
 .print ("needed to boil coffee");
 .send(cook2, achieve, boilCoffee).

+!needToBoilCoffee: not (coffeeGrinded(true) & coffeeBoiled(false)) <-
 !needToBoilCoffee.

+!needToServeCoffee: coffeeGrinded(true) & coffeeBoiled(true) <-
 .print ("needed to serve coffee");
 .send (cook3, achieve, serveCoffee).

+!needToServeCoffee: not (coffeeGrinded(true) & coffeeBoiled(true)) <-
 !needToServeCoffee.

+!finalCondition: coffeeGrinded(true) & coffeeBoiled(true) & coffeeServed(true) <-
.print("done").

+!finalCondition: not (coffeeGrinded(true) & coffeeBoiled(true) & coffeeServed(true)) <-
 !finalCondition.