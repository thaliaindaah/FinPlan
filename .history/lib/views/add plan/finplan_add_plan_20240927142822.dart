import 'package:flutter/material.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({Key? key}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  String? _selectedOption;
  final List<String> _options = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Below Text Field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Allows scrolling
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Enter option',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedOption,
                  hint: Text('Select an option'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue; // Update the selected value
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                  items: _options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                      print('Text: ${_textController.text}, Selected: $_selectedOption');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}