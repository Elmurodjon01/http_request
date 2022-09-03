import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_request/model/employee.dart';
import 'package:http_request/services/http_service.dart';

import '../model/post.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void _apiPostList (){
    Net.GET(Net.Api_list, Net.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
  void _apiCreatePost (Employee employee){
    Net.POST(Net.Api_create, Net.paramsCreate(employee)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiUpdate (Employee employee){
    Net.PUT(Net.Api_update + employee.id.toString(), Net.paramsUpdate(employee)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }
  void _apiDeletePost (Employee employee){
    Net.DELETE(Net.Api_delete + employee.id.toString(), Net.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse (String response){
setState(() {
  data = response;
});
  }
  String data = '';
  @override
  void initState() {
    super.initState();
   // var post = Post(id: 1, title: 'inha', body: 'online', userId: 12);
    _apiPostList();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            //not equal to
            child: Column(
              children: [

                Text(data),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//data != null ? data : 'no Data'
