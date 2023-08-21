import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddExpense extends StatefulWidget {
  // const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();
  String selectedOption = 'Commute';
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController();

  String _nameValue = '';
  int? _priceValue;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namecontroller.addListener(() {
      setState(() {
        _nameValue = _namecontroller.text;
      });
    });
    _pricecontroller.addListener(() {
      setState(() {
        try {
          _priceValue = int.parse(_pricecontroller.text);
        } catch (e) {
          _priceValue = null; // Reset intValue if parsing fails
        }
      });
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Add your expense"),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Category"),
                DropdownButton<String>(
                  elevation: 0,
                  value: selectedOption,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  items: <String>[
                    'Commute',
                    'Food',
                    'Stationary',
                    'Miscellaneous'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text("Name"),
                TextFormField(
                  controller: _namecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                // Text('Input value: $_nameValue'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        // style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_month),
                      )
                    ],
                  ),
                ),
                // Text(
                //   "${selectedDate.toLocal()}".split(' ')[0],
                //   // style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // ElevatedButton(
                //   onPressed: () => _selectDate(context),
                //   child: Text(
                //     'Select date',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pricecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some price';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Fluttertoast.showToast(
                          msg: "Expense added",
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add Expense'),
                  ),
                ),
                // Text('Input value: $_priceValue'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
