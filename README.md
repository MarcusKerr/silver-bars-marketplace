# SilverBars Marketplace

See the demand for silver bars on the market!

![silver_bars](https://user-images.githubusercontent.com/15127871/51451861-50561d00-1d2f-11e9-8882-90736e90210a.jpeg)

[![Build Status](https://travis-ci.org/MarcusKerr/silver-bars-marketplace.svg?branch=master)](https://travis-ci.org/MarcusKerr/silver-bars-marketplace)

## Quickstart:

### Prerequisits:

- you must have Ruby proamming language installed on your machine to run this program. You can get ruby [here](https://rvm.io/rvm/install).

### How to install:

1. Clone this project `https://github.com/MarcusKerr/silver-bars-marketplace.git`
2. Change into the directory `cd silver-bars-marketplace`
3. run `bundle install` to add depencencies

### How to use:

1. Enter your Ruby REPL and require the `LiveORderBoard.rb` file:

```
$ irb
> require './lib/LiveOrderBoard.rb'
```

2. Instantiate a Live Order Board:

```
> live_order_board = LiveOrderBoard.new
```

3. Register Orders using the `buy` and `sell` methods. You must provide:
 
  - user id        (Integer)
  - order quantity (Integer/Float)
  - price per kg   (Integer/Float)

```
> live_order_board.buy(1, 3.5, 10)
> live_order_board.sell(2, 10, 3.50)
```

4. To view the love order board, use the `summary` method:

```
> live_order_board.summary
```

5. And to cancel an order, call the method `cancel_order` on your Live Order Board, with an order id string as the argurment:

```
> live_order_board.cancel_order('1b')
> live_order_board.cancel_order('1s')
```

### How to run the tests:

Feature tests and unit tests can both be executed with the command `rspec`:

```
$ rspec
```

### Test coverage:

Simplecov final coverage report:

<img width="1423" alt="screenshot 2019-01-21 at 08 10 17" src="https://user-images.githubusercontent.com/15127871/51460675-0df30700-1d54-11e9-9aaf-978606ea0794.png">

## User Stories:

```
As a user
So that I can Buy or Sell silver bars,
I want to be able to register an order.

As a user
So that I have the option to change my mind about my order,
I want to be be able to cancel an order.

As a user
So that I can see the recent demand for Silver Bars,
I want to be able to see a summary of live orders.

As a client
So that we can present our summary in the most concise way,
We want orders for the same price to be merged together.

As a client
So that we can easily identify SELL orders,
We want the lowest price to be displayed first.

As a client
So that we can easily indentify BUY orders,
We want the highest price to be displayed first.
```

## Diagram:

![silver_bars_marketplace](https://user-images.githubusercontent.com/15127871/51466504-4699dd00-1d62-11e9-878b-9109e3fe41de.png)



### Technologies:

* Ruby
* Rspec - Teating framework for Feature and Unit tests
* Simplecov - Code coverage tool
* Travis CI - Conitinuous Intergration tool monitoring state of master branch with each push
* Rubocop - For linting Ruby syntax and conforming to a popular style guide

## Code extract:

 ```
 class LiveOrderBoard
  USER_ID_ERROR = 'User id must be a whole number'
  QUANTITY_ERROR = 'Order quantity must be a number(kg)'
  PRICE_ERROR = 'Price per kg must be a number(£)'
  ORDER_ID_ERROR = 'Order id must be a string'

  def initialize(live_orders = LiveOrders.new, summary = Summary)
    @live_orders = live_orders
    @summary = summary
  end

  def buy(user_id, order_quantity, price_per_kg)
    validate_details(user_id, order_quantity, price_per_kg)
    @live_orders.add(user_id, order_quantity, price_per_kg, :BUY)
  end
 ```

## Specification:

Imagine you're working as a programmer for a company called SilverBars Marketplace and you have just received a new requirement. In it we would like to display to our users how much demand for silver bars there is on the market.
To do this we would like to have a 'Live Order Board' that can provide us with the following functionality:

1. Register an order. Order must contain these fields:
* user id
* order quantity (e.g.: 3.5 kg)
* price per kg (e.g.: £303)
* order type: BUY or SELL

2. Cancel a registered order - this will remove the order from 'Live Order Board'

3. Get summary information of live orders (see explanation below) Imagine we have received the following orders:
* a) SELL: 3.5 kg for £306 [user1]
* b) SELL: 1.2 kg for £310 [user2]
* c) SELL: 1.5 kg for £307 [user3]
* d) SELL: 2.0 kg for £306 [user4]

Our ‘Live Order Board’ should provide us the following summary information:

* 5.5 kg for £306 // order a + order d
* 1.5 kg for £307 // order c
* 1.2 kg for £310 // order b

The first thing to note here is that orders for the same price should be merged together (even when they are from different users). In this case it can be seen that order a) and d) were for the same amount (£306) and this is why only their sum (5.5 kg) is displayed (for £306) and not the individual orders (3.5 kg and 2.0 kg).The last thing to note is that for SELL orders the orders with lowest prices are displayed first. Opposite is true for the BUY orders.
Notes:

* Please provide a simple implementation of the live order board in any software language

* The solution should have some instructions on how to demonstrate its functionality/correctness

* No database, UI/WEB or a standalone runnable is needed for this assignment

* Please upload it on GitHub or BitBucket and make it available for us to pull

* If during your implementation you'll find that something could be designed in multiple different ways, just implement the one which seems most reasonable to you and if you could provide a short (once sentence) reasoning why you choose this way and not another one, it would be great.

## Approach to solving the challenge:

1. Research orderboard to give more context to what I am making. This really helped to provide context and helped me to visualize a solution as I had no idea what an order board was.

2. Refine the project requirements into clear and concise user stories.

3. Sketch diagram of my current understanding of the system, this is likely to evolve over time.

4. Exlored testing options ultimately deciding to use Rspec for both unit and feature testing.

5. I focusd on the BDD cycle always writing a feature test first followed by unit tests.

## Design Decisions and Assumptions:

- Live Orders: I initially decided to store the 'Live Orders' in a hash within the 'Live Order Board' class however, as the program grew I decided that extracting logic for 'Live Orders' to a seprate class increase coheasion in both classes.

- Merging Orders: Initially I was storing meged orders in a hash, however this became quite confising so I decided to make this an object istead. This object inherits the Order class so also has access to Order's methods.

- Order Id: I made the assumtion that one user could place many orders therefore the 'user_id' would not be sufficient for cancelling orders, resulting in the birth or a unique 'order_id'.

- Type: I decided to use symbols as the 'type' for the Orders to increase performance and because they are immutable. I also considered using booleans but symbols were more readable.

## Next steps:

- Introduce module to hold order details to allow my tests to be more DRY.

- Extract some logic from Summary to a seperate class to increase cohesion and have classes with Single Responsibilty, my Summary class is doing way too much. Likeley to become Summary Class and Printer Class.

- Refactor `merge_orders` method into multiple smaller methods with single responsibility!

- Raise error if user enters order id that does not exist
