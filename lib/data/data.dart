// Food

import 'package:_food_delivery_ui_practice/models/food.dart';
import 'package:_food_delivery_ui_practice/models/order.dart';
import 'package:_food_delivery_ui_practice/models/restaurant.dart';
import 'package:_food_delivery_ui_practice/models/user.dart';

final _burrito =
    Food(imageUrl: "assets/images/burrito.jpg", name: "Burrito", description:"burrito, a common cylindrical food item of Mexican and American origin consisting of a tortilla wrapped around a mixed filling of such ingredients as meat, cheese, beans, and vegetables.", price: 700);

final _steak =
    Food(imageUrl: "assets/images/steak.jpg", name: "Steak", price: 1500, description: null);

final _pasta =
    Food(imageUrl: "assets/images/pasta.jpg", name: "Pasta", price: 1200, description: null);

final _ramen =
    Food(imageUrl: "assets/images/ramen.jpg", name: "Ramen", price: 950, description: null);

final _pancakes =
    Food(imageUrl: "assets/images/pancakes.jpg", name: "Pancakes", price: 350, description: null);

final _burger =
    Food(imageUrl: "assets/images/burger.jpg", name: "Burger", price: 1100, description: null);

final _pizza =
    Food(imageUrl: "assets/images/pizza.jpg", name: "Pizza", price: 1350, description: null);

final _salmon = Food(
    imageUrl: "assets/images/salmon.jpg", name: "Salmon Salad", price: 1450, description: null);

// Restaurants

final _restaurant0 = Restaurant(
    imageUrl: "assets/images/restaurant0.jpg",
    name: "Victoria Hotel",
    address: "Kenyatta Avenue, Nakuru",
    rating: 5,
    menu: [
      _burrito,
      _steak,
      _pasta,
      _ramen,
      _pancakes,
      _burger,
      _pizza,
      _salmon
    ]);

final _restaurant1 = Restaurant(
    imageUrl: "assets/images/restaurant1.jpg",
    name: "Festo cafe",
    address: "Kabarak University, Nakuru",
    rating: 4.1,
    menu: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza]);

final _restaurant2 = Restaurant(
    imageUrl: "assets/images/restaurant2.jpg",
    name: "Black Pearl",
    address: "Rafiki center, Nakuru",
    rating: 5,
    menu: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon]);

final _restaurant3 = Restaurant(
    imageUrl: "assets/images/restaurant3.jpg",
    name: "Baristo Palace",
    address: "Barkasen Center",
    rating: 4.3,
    menu: [_burger, _steak, _burger, _pizza, _salmon]);

final _restaurant4 = Restaurant(
    imageUrl: "assets/images/restaurant4.jpg",
    name: "Silver Crane",
    address: "Oloika Center",
    rating: 4.0,
    menu: [_burger, _ramen, _pancakes, _salmon]);

// Restaurants List

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4
];

// User

final currentUser = User(name: "Zeeshan Ahmed", orders: [
  Order(
      restaurant: _restaurant2, food: _steak, date: "Dec 5, 2022", quantity: 1),
  Order(
      restaurant: _restaurant0, food: _ramen, date: "Dec 5, 2022", quantity: 3),
  Order(
      restaurant: _restaurant1,
      food: _burrito,
      date: "Dec 5, 2022",
      quantity: 2),
  Order(
      restaurant: _restaurant3,
      food: _salmon,
      date: "Dec 5, 2022",
      quantity: 1),
  Order(
      restaurant: _restaurant4,
      food: _pancakes,
      date: "Dec 5, 2022",
      quantity: 1)
], cart: [
  Order(
      restaurant: _restaurant2,
      food: _burger,
      date: "Dec 5, 2022",
      quantity: 2),
  Order(
      restaurant: _restaurant2, food: _pasta, date: "Dec 5, 2022", quantity: 1),
  Order(
      restaurant: _restaurant3,
      food: _salmon,
      date: "Dec 5, 2022",
      quantity: 1),
  Order(
      restaurant: _restaurant4,
      food: _pancakes,
      date: "Dec 5, 2022",
      quantity: 3),
  Order(
      restaurant: _restaurant1,
      food: _burrito,
      date: "Dec 5, 2022",
      quantity: 2)
]);
