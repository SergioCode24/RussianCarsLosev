import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rus_car/model/cart_list.dart';
import 'package:rus_car/pages/card_of_car.dart';

import 'list_view_sample_for_card_of_car.dart';

class GridViewCartSample extends StatefulWidget {
  int carId;
  final VoidCallback updateSum;

  GridViewCartSample({super.key, required this.carId, required this.updateSum});

  @override
  State<GridViewCartSample> createState() => _GridViewCartSample(carId);
}

class _GridViewCartSample extends State<GridViewCartSample> {
  final int carId;
  _GridViewCartSample(this.carId);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardOfCar(
                  id: carId,
                ),
              ),
            );
          },
          child: Container(
            color: Colors.black12,
            child:Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    carsInCart[carId].images[0],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      carsInCart[carId].name,
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      carsInCart[carId].equipment,
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: carsInCart[carId].isButtonDisabled ? null : () {
                            if (carsInCart[carId].count < 1) {}
                            else if (carsInCart[carId].count == 2) {
                              carsInCart[carId].isButtonDisabled = true;
                              setState(() {
                                carsInCart[carId].count--;
                                widget.updateSum();
                              });
                            }
                            else {
                              setState(() {
                                carsInCart[carId].count--;
                                widget.updateSum();
                              });
                            }
                          },
                          child: const Text('-'),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          carsInCart[carId].count.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              carsInCart[carId].count++;
                              widget.updateSum();
                              carsInCart[carId].isButtonDisabled = false;
                            });
                          },
                          child: const Text('+'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '${carsInCart[carId].price * carsInCart[carId].count} рублей',
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<CartModel>(
                    builder: (context, cart, child) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            carsInCart.removeWhere((element) => element.id == carId);
                            widget.updateSum();
                          });
                          cart.removeFromCart(carId);
                        },
                        child: const Text(
                          'Удалить',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}