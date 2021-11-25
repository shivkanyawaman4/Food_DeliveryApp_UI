import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  _buildRecentOrders(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    image: AssetImage(order.food.imageUrl),
                  ),
                ),
             
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.food.name  ,
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      order.restaurant.name,
                      style: Theme.of(context).textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      order.date,
                      style: Theme.of(context).textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
             ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
              child:FloatingActionButton(
                heroTag: null,
                backgroundColor: Theme.of(context).primaryColor,
                     child: Icon(Icons.add,color: Colors.white,),
            onPressed: (){},
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          height: 120,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrders(context, order);
            },
          ),
        )
      ],
    );
  }
}
