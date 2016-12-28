/* Initial beliefs and rules */

coffeeServed(false).
milkAdded(false).
sugarAdded(false).
coffeeIsInACup(false).

/* Initial goals */

!start.

/* Plans */

+!start: true <- .print("cook3 is ready").

+!serveCoffee <-
 !addSugar;
 !addMilk;
 !pourCoffeeInACup;
 .print("cook3 finished his work");
 .send(coffee, tell, coffeeServed(true)).

+!addSugar: sugarAdded(false) <-
 -+sugarAdded(true);
 .print("sugar added").

+!addMilk: milkAdded(false) <-
 -+milkAdded(true);
 .print("milk added").

+!pourCoffeeInACup: coffeeIsInACup(false) <-
 -+coffeeIsInACup(true);
 .print("poured coffee in a cup").

+!serveCoffee: coffeeServed(false) <-
 !serveCoffee.
