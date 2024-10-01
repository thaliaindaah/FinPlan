import 'package:flutter/material.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({Key? key}) : super(key: key);

  @override
  State<AddPlan> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlan> {
 final TextEditingController _controller = TextEditingController();
  final List<String> _options = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
  List<String> _filteredOptions = [];

  void _filterOptions(String query) {
    final filtered = _options.where((option) => option.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      _filteredOptions = filtered;
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredOptions = _options; // Start with all options
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _filterOptions,
              decoration: InputDecoration(
                labelText: 'Enter option',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredOptions[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}