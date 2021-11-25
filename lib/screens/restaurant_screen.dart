import 'package:flutter/material.dart';
import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food? menuItem) {
    return Center(
        child: Stack(
          alignment: Alignment.center,
      children: [
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(menuItem!.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3)
                ],
                stops: [
                  0.1,0.4,0.6,0.9
                ]
              ),
              ),
        ),
        Positioned(
          bottom: 65,
          child: Column(
            children: [
              Text(menuItem.name, style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
              Text('\$${menuItem.price}', style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
            ],
          ),
        ),
         Positioned(
           bottom: 10,
           right: 10,
           child: Container(
             
                child:FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Theme.of(context).primaryColor,
                       child: Icon(Icons.add,color: Colors.white,),
              onPressed: () {},
            )),
         )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 220,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: AssetImage(widget.restaurant.imageUrl),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      '0.2 miles away',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Meanu',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  print(widget.restaurant.menu);
                  return _buildMenuItem(food);
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
