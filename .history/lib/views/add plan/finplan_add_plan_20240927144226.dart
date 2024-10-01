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

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _textController.text = "${picked.toLocal()}".split(' ')[0]; // Format as YYYY-MM-DD
      });
    }
  }

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
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true
                  ),
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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(230, 244, 241, 1),
                    )
                  ),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true
                  ),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(230, 244, 241, 1),
                    )
                  ),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                  fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true
                  ),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Note', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                fillColor: const Color.fromRGBO(230, 244, 241, 1), filled: true),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _textController,
                readOnly: true, // Prevent manual input
                decoration: InputDecoration(
                  labelText: 'Select Date',
                  filled: true,
                  fillColor: Colors.lightBlueAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, fixedSize: const Size(220, 50),
                  backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Login'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}