import 'package:flutter/material.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({Key? key}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Plan', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: 
        TextFormField(
          decoration: InputDecoration(
          labelText: 'Nama',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
          fillColor: const Color.fromRGBO(230, 244, 241, 1),
          filled: true,
        ),
      ),
    )
    );
  }
}