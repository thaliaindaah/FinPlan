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
      body: const Center(
        child: 
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter Plan Name',
          ),
        ),
      ),
    );
  }
}