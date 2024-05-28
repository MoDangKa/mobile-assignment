import 'package:flutter/material.dart';
import 'package:mobile_assignment/models/fibonacci.dart';
import 'package:mobile_assignment/widgets/fibonacc_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Fibonacci> fibonacciSeries = [];
  final List<Fibonacci> keeper = [];
  Fibonacci? lastInBox;
  Fibonacci? lastOutBox;

  @override
  void initState() {
    super.initState();
    fibonacciSeries = generateFibonacciSeries(40);
  }

  List<Fibonacci> generateFibonacciSeries(int n) {
    List<Fibonacci> series = [];
    int a = 0;
    int b = 1;

    for (int i = 0; i < n; i++) {
      String sharp = a % 3 == 0
          ? "circle"
          : a % 3 == 1
              ? "square"
              : "cross";
      series.add(Fibonacci(index: i, number: a, sharp: sharp));
      int next = a + b;
      a = b;
      b = next;
    }

    return series;
  }

  void moveItemToBox(Fibonacci item) {
    setState(() {
      lastInBox = item;
      fibonacciSeries.removeWhere((f) => f.number == item.number);
      keeper.add(item);
      keeper.sort((a, b) => a.index.compareTo(b.index));
    });
    _showModalBottomSheet(context, item);
  }

  void closeModal(Fibonacci item) {
    setState(() {
      lastOutBox = item;
      keeper.removeWhere((k) => k.number == item.number);
      fibonacciSeries.add(item);
      fibonacciSeries.sort((a, b) => a.index.compareTo(b.index));
    });
    Navigator.of(context).pop();
  }

  void _showModalBottomSheet(BuildContext context, Fibonacci item) {
    List<Fibonacci> filteredList =
        keeper.where((k) => k.sharp == item.sharp).toList();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1,
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return FibonacciItem(
                onTap: () => closeModal(filteredList[index]),
                color: filteredList[index] == lastInBox
                    ? Colors.green
                    : Colors.transparent,
                data: filteredList[index],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Example",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.blue.shade300,
      ),
      body: ListView.builder(
        itemCount: fibonacciSeries.length,
        itemBuilder: (context, index) {
          return FibonacciItem(
            onTap: () => moveItemToBox(fibonacciSeries[index]),
            color: fibonacciSeries[index] == lastOutBox
                ? Colors.red
                : Colors.transparent,
            data: fibonacciSeries[index],
          );
        },
      ),
    );
  }
}
