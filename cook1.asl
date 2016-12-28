/* Initial beliefs and rules */

coffeeGrinded(false).
coffeeMillOn(false).
coffeeInCoffeeMill(false).

/* Initial goals */

!start.

/* Plans */

+!start: true <- .print("cook1 is ready").

+!grindCoffee <- .print("start grinding coffee");
 !turnOnCoffeeMill;
 !pourCoffeeInCoffeeMill;
 !grindCoffeeInCoffeeMill;
 !turnOffCoffeeMill;
 .print("cook1 finished his work");
 .send(coffee,tell,coffeeGrinded(true)).

+!turnOnCoffeeMill: coffeeMillOn(false) <-
 .print("coffee mill turned on");
 -+coffeeMillOn(true).

+!turnOnCoffeeMill: not coffeeMillOn(false) <-
 !turnOnCoffeeMill.

+!pourCoffeeInCoffeeMill: coffeeInCoffeeMill(false) <-
 .print("coffee is in coffee mill");
 -+coffeeInCoffeeMill(true).

+!pourCoffeeInCoffeeMill: not coffeeInCoffeeMill(false) <-
 !pourCoffeeInCoffeeMill.

+!turnOffCoffeeMill: coffeeMillOn(true) <-
 .print("coffee mill switched off");
 -+coffeeMillOn(false).

+!turnOffCoffeeMill: not coffeeMillOn(true) <- !turnOffCoffeeMill.

+!grindCoffeeInCoffeeMill: coffeeGrinded(false) <-
 -+ coffeeGrinded(true);
 .print("coffee is grinded in coffeeMill").