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
        title: Text('Persistent Dropdown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(230, 244, 241, 1),
                    )
                  ),
                  ),
                focusColor: Color.fromRGBO(230, 244, 241, 1),
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
                    // Optionally clear the form if needed
                    _textController.clear();
                    setState(() {
                      _selectedOption = null; // Reset selected option
                    });
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}