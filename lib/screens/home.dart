import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';
import 'package:food_delivery_ui/widgets/recent_orders.dart';

import 'cart.dart';
import 'restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RestaurantScreen(restaurant: restaurant))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey.shade200,
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                        image: AssetImage(restaurant.imageUrl)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 20),
                        ),
                        RatingStars(restaurant.rating),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.address,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '0.2 miles away',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle_outlined),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        actions: [
          TextButton(
            child: Text(
              'Cart ${currentUser.cart.length}',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor)),
                hintText: 'Search Food or restaurants',
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Nearby Restaurants',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              _buildRestaurants(),
            ],
          )
        ],
      ),
    );
  }
}
