# SilverBars Marketplace Tech Test

## Usage

## User Stories

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

## Specification

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

 Please provide a simple implementation of the live order board in any software language
 The solution should have some instructions on how to demonstrate its functionality/correctness
 No database, UI/WEB or a standalone runnable is needed for this assignment
 Please upload it on GitHub or BitBucket and make it available for us to pull
 If during your implementation you'll find that something could be designed in multiple different ways, just
implement the one which seems most reasonable to you and if you could provide a short (once sentence) reasoning why you choose this way and not another one, it would be great.