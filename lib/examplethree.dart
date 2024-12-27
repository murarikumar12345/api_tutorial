import 'dart:convert';

import 'package:api_tutorial_class/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel>userList =[];
  Future<List<UserModel>>getUserApi ()async{
   final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
     var data =jsonDecode(response.body.toString());
   if(response.statusCode==200){
       for(Map i  in data){
         userList.add(UserModel.fromJson(i));

       }
     return userList;
   }
   else{
     return userList;

   }
  }







  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [

          Expanded(
              child:FutureBuilder(
                future:getUserApi (),
                builder: (context,AsyncSnapshot<List<UserModel>>snapshot){
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else{
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder:(context,index){
                      return  Card(
                        child: Padding(
                          padding:const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ReusableRow(title:'Name',value:snapshot.data![index].name.toString()),
                              ReusableRow(title:'username',value:snapshot.data![index].username.toString()),
                              ReusableRow(title:'email',value:snapshot.data![index].email.toString()),
                              ReusableRow(title:'Address',value:snapshot.data![index].address!.city.toString()+
                                  snapshot.data![index].address!.geo!.lat.toString()


                              ),
                              ReusableRow(title:'phone',value:snapshot.data![index].phone.toString()),
                              ReusableRow(title:'company',value:snapshot.data![index].company!.name.toString()),






                            ],


                          ),
                        ),
                      );



                    });

                  }
                },

              ),
                  
              
              
              )







          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
  ReusableRow({super.key,required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
           Text(title),
          Text(value),
        ],
      ),
    );

  }
}

