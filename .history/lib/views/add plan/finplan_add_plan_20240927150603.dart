import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Plan'),
      ),
      body: SingleChildScrollView(
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
                hint: Text('Kurs'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue; // Update the selected value
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Kurs';
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
                hint: Text('Rencana'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue; // Update the selected value
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Rencana';
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
                decoration: InputDecoration(labelText: 'Jumlah', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
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
                hint: Text('Kategori'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue; // Update the selected value
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Kategori';
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
                  labelText: 'Tanggal',
                  filled: true,
                  fillColor: Color.fromRGBO(230, 244, 241, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1))),
                  enabledBorder: const OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(230, 244, 241, 1), width: 1.0)),
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 20),
              Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
                width: 200,
                height: 200,
                child:_image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Unggah Gambar Struk', textAlign: TextAlign.center),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
                    ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, fixedSize: const Size(500, 50),
                  backgroundColor: const Color.fromRGBO(59, 118, 34, 1),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Simpan'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}