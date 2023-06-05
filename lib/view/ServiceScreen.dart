import 'package:flutter/material.dart';
import 'package:home_service_flutter/backend/AllWorkController.dart';
import 'package:home_service_flutter/model/WorkModel.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<WorkModel> _works = [];
  final AllWorkController _workController = AllWorkController();

  @override
  void initState() {
    super.initState();
    _fetchWorks(); // Call the function to fetch works data
  }

  Future<void> _fetchWorks() async {
    try {
      final works = await _workController.apiService.getAllWorks();
      setState(() {
        _works = works;
      });
    } catch (e) {
      print('Failed to fetch works: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Screen'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: _works.length,
        itemBuilder: (context, index) {
          final work = _works[index];
          return GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(work.icon),
                  SizedBox(height: 8.0),
                  Text(work.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
