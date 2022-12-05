import 'package:_food_delivery_ui_practice/data/data.dart';
import 'package:_food_delivery_ui_practice/models/order.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    currentUser.cart.forEach((Order order) {
      totalPrice += order.food.price * 1;
    });
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Cart (${currentUser.cart.length})"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCart(order);
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Estimate Total Time",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "25 min",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Cost",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80)
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(thickness: 1.0, color: Colors.grey),
          itemCount: currentUser.cart.length + 1),
      bottomSheet: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Payment Successful"),
              content: Text(
                  "Your payment of Ksh. $totalPrice has successfully been processed."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    color: Colors.deepOrange,
                    padding: const EdgeInsets.all(14),
                    child: const Text("okay"),
                  ),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              boxShadow: [
                BoxShadow(
                    blurRadius: 6, color: Colors.black26, offset: Offset(0, -1))
              ]),
          child: const Center(
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCart(Order order) {
    return Container(
      height: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(order.food.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.8, color: Colors.grey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                order.quantity.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: Text(
              "\$${order.food.price * order.quantity}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
