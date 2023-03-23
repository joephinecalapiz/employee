import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/employees/employee.dart';
import 'package:frontend_diaryapp/employees/services.dart';


class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Flutter Laravel CRUD";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  late List<Employee> _employees;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late Employee _selectedEmployee;
  late bool _isUpdating;
  late String _titleProgress;

  @override
  void initState() {
    super.initState();
    _employees = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _getEmployees();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }


  _addEmployee() {
    if (_firstNameController.text
        .trim()
        .isEmpty ||
        _lastNameController.text
            .trim()
            .isEmpty) {
      print("Empty fields");
      return;
    }
    _showProgress('Adding Employee...');
    Services.addEmployee(_firstNameController.text, _lastNameController.text)
        .then((result) {
      if (result) {
        _getEmployees();
      }
      _clearValues();
    });
  }

  _getEmployees() {
    _showProgress('Loading Employees...');
    Services.getEmployees().then((employees) {
      setState(() {
        _employees = employees;
      });
      _showProgress(widget.title);
      print("Length: ${employees.length}");
    });
  }

  _deleteEmployee(Employee employee) {
    _showProgress('Deleting Employee...');
    Services.deleteEmployee(employee.id).then((result) {
      if (result) {
        setState(() {
          _employees.remove(employee);
        });
        _getEmployees();
      }
    });
  }

  _updateEmployee(Employee employee) {
    _showProgress('Updating Employee...');
    Services.updateEmployee(
        employee.id, _firstNameController.text, _lastNameController.text)
        .then((result) {
      if (result) {
        _getEmployees();
        setState(() {
          _isUpdating = false;
        });
        _firstNameController.text = '';
        _lastNameController.text = '';
      }
    });
  }

  _setValues(Employee employee) {
    _firstNameController.text = employee.firstName;
    _lastNameController.text = employee.lastName;
    setState(() {
      _isUpdating = true;
    });
  }

  _clearValues() {
    _firstNameController.text = '';
    _lastNameController.text = '';
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataTextStyle: const TextStyle(color: Colors.white),
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal),
          dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.selected)
              ? Colors.white
              : Colors.black
          ),
          columns: const [
            DataColumn(
                label: Text("ID"),
                numeric: false,
                tooltip: "This is the employee id"),
            DataColumn(
                label: Text(
                  "FIRST",
                ),
                numeric: false,
                tooltip: "This is the first name"),
            DataColumn(
                label: Text("LAST"),
                numeric: false,
                tooltip: "This is the last name"),
            DataColumn(
                label: Text("DELETE"),
                numeric: false,
                tooltip: "Delete Action"),
          ],
          rows: _employees.map(
                (employee) =>
                DataRow(
                  cells: [
                    DataCell(
                      Text(employee.id),
                      onTap: () {
                        if (kDebugMode) {
                          print("Tapped ${employee.firstName}");
                        }
                        _setValues(employee);
                        _selectedEmployee = employee;
                      },
                    ),
                    DataCell(
                      Text(
                        employee.firstName.toUpperCase(),
                      ),
                      onTap: () {
                        if (kDebugMode) {
                          print("Tapped ${employee.firstName}");
                        }
                        _setValues(employee);
                        _selectedEmployee = employee;
                      },
                    ),
                    DataCell(
                      Text(
                        employee.lastName.toUpperCase(),
                      ),
                      onTap: () {
                        if (kDebugMode) {
                          print("Tapped ${employee.firstName}");
                        }
                        _setValues(employee);
                        _selectedEmployee = employee;
                      },
                    ),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete,color: Colors.redAccent,),
                        onPressed: () {
                          _deleteEmployee(employee);
                        },
                      ),
                      onTap: () {
                        if (kDebugMode) {
                          print("Tapped ${employee.firstName}");
                        }
                      },
                    ),
                  ],
                ),
          )
              .toList(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(_titleProgress),
        actions: <Widget>[

          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _getEmployees();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _firstNameController,
              decoration: const InputDecoration.collapsed(
                hintText: "First Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _lastNameController,
              decoration: const InputDecoration.collapsed(
                hintText: "Last Name",
              ),
            ),
          ),
          _isUpdating
              ? Row(
            children: <Widget>[
              OutlinedButton(
                child: const Text('UPDATE'),
                onPressed: () {
                  _updateEmployee(_selectedEmployee);
                },
              ),
              OutlinedButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    _isUpdating = false;
                  });
                  _clearValues();
                },
              ),
            ],
          )
              : Container(),
          Expanded(
            child: _dataBody(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEmployee();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}