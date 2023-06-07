import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service_flutter/backend/AllWorkController.dart';
import 'package:home_service_flutter/model/WorkModel.dart';
import 'package:home_service_flutter/view/CreateOrderScreen.dart';

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
      appBar: AppBar(centerTitle:true,title: Text('Services'),),
      body: GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: _works.length,
        itemBuilder: (context, index) {
          final work = _works[index];

          return GestureDetector(
            onTap: () {

                Get.off(CreateOrderScreen());
            },
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(width: 1,color: Colors.pink),
                    borderRadius: BorderRadius.circular(10.0),

                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Image.network(work.icon,height: 30.0,width: 30.0,),

                      Image.asset("images/test_icon.png",height: 30.0,width: 30.0,),
                      SizedBox(height: 8.0),
                      Text(work.name,style: GoogleFonts.cairo(
                        color: Colors.blueAccent,
                        fontSize: 10
                      ),),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
