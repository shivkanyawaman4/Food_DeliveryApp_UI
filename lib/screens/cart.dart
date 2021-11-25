import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(order.food.imageUrl),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: Theme.of(context).textTheme.headline3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.restaurant.name,
                          style: Theme.of(context).textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 0.8)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  order.quantity.toString(),
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            '\$${order.quantity * order.food.price}',
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((element) {
      (Order order) => totalPrice += order.quantity * order.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: Text(
          'Cart ${currentUser.cart.length}',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          } else {
            return Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimated Delivery Time:',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '25 Min',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost:',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.green.shade400),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, -1), blurRadius: 6.0)
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          child: Text(
            'CHECKOUT',
           style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
