/* Initial beliefs and rules */

coffeeBoiled(false).
waterIsInTurk(false).
coffeeIsInTurk(false).
stoveTurnedOn(false).

/* Initial goals */

!start.

/* Plans */

+!start: true <- .print("cook2 is ready").

+!boilCoffee <- .print ("start boiling coffee");
 !pourCoffeeInTurk;
 !addWater;
 !turnOnStove;
 !boilCoffeeInTurk;
 !turnOffStove;
 .print("cook2 finished his work");
 .send(coffee,tell,coffeeBoiled(true)).

+!pourCoffeeInTurk: coffeeIsInTurk(false) <-
 .print("coffee poured in turk");
 -+coffeeIsInTurk(true).

+!pourCoffeeInTurk: not coffeeIsInTurk(false) <-
 !pourCoffeeInTurk.

+!addWater: waterIsInTurk(false) <-
 .print("adding water");
 -+waterIsInTurk(true).

+!addWater: not waterIsInTurk(false) <-
 !addWater.

+!turnOnStove: stoveTurnedOn(false) <-
 .print("turning on stove");
 -+stoveTurnedOn(true).

+!boilCoffeeInTurk: coffeeBoiled(false) <-
 -+coffeeBoiled(true);
 .print("coffee was boiled in turk").


+!boilCoffeeInTurk: not coffeeBoiled(false) <-
 !boilCoffeeInTurk.

+!turnOffStove: stoveTurnedOn(true) <-
 -+stoveTurnedOn(false);
 .print("stove was switched off").
