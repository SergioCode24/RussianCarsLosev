import 'package:flutter/material.dart';
import 'package:rus_car/model/history_pay_list.dart';
import 'package:rus_car/pages/card_of_car.dart';



class GridViewHistoryPaySample extends StatefulWidget {
  int carId;
  final VoidCallback update;
  GridViewHistoryPaySample({super.key, required this.carId, required this.update});
  @override
  State<GridViewHistoryPaySample> createState() => _GridViewHistoryPaySample(carId);
}
class _GridViewHistoryPaySample extends State<GridViewHistoryPaySample> {
  final int carId;

  _GridViewHistoryPaySample(this.carId);

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
                  update: widget.update,
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
                    historyPayCars[carId].images[0],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      historyPayCars[carId].name,
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
                      historyPayCars[carId].equipment,
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
                      'В количестве ${historyPayCars[carId].count} штук',
                      style: const TextStyle(
                        fontSize: 18,
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
                      '${historyPayCars[carId].price * historyPayCars[carId].count} рублей',
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
