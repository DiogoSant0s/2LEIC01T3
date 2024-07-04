import 'package:flutter/material.dart';
import 'package:partylander/entities/host.dart';
import 'package:partylander/entities/event.dart';
import 'package:partylander/view/HomePageWidget.dart';

class EventCreationPageWidget extends StatefulWidget {
  const EventCreationPageWidget({super.key});
  @override
  EventCreationPageWidgetState createState() => EventCreationPageWidgetState();
}

class EventCreationPageWidgetState extends State<EventCreationPageWidget> {
  //Event currently being created
  late Event newEvent;

  // Controllers for the text fields
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _webpageController = TextEditingController();
  final _imageLinkController = TextEditingController();

  // Variables to store the selected start and end dates
  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour + 1);
  DateTime _endDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour + 2);

  //Auxiliary functions to ensure the end of an event always comes after its start
  void _onStartDateChanged(DateTime date) {
    setState(() {
      _startDate = date;
      if (_endDate.isBefore(_startDate)) {
        _endDate = _startDate;
        _endDate.add(const Duration(hours: 1));
      }
    });
  }

  void _onEndDateChanged(DateTime date) {
    setState(() {
      if (date.isBefore(_startDate)) {
        _endDate = _startDate;
        _endDate.add(const Duration(hours: 1));
      } else {
        _endDate = date;
      }
    });
  }

  int getDaysInSaidDate(DateTime date) {
    if (date.month == 2) {
      if (date.year % 4 == 0) {
        if (date.year % 100 == 0) {
          if (date.year % 400 == 0) {
            return 29;
          }
          return 28;
        }
        return 29;
      }
      return 28;
    } else if (date.month == 4 || date.month == 6 || date.month == 9 || date.month == 11) {
      return 30;
    } else {
      return 31;
    }
  }

  // Variables to store the monetization type
  bool _monetization = false;
  String _monetizationString = 'Free';

  void createEvent() {
    newEvent = Event(name: _nameController.text, startDate: _startDate, endDate: _endDate, location: _locationController.text,
        description: _descriptionController.text, type: '', host: Host(username: 'Someone', location: 'Anywhere', email:'email'));
    newEvent.setMonetization(_monetization);
    if (_webpageController.text.isNotEmpty) {
      newEvent.setWebsite(_webpageController.text);
    }
    if (_imageLinkController.text.isNotEmpty) {
      newEvent.setDescriptivePicture(_imageLinkController.text);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text box for the event name
             TextField(
               controller: _nameController,
               decoration: const InputDecoration(
                 labelText: 'Event Name',
                 hintText: 'Enter a name for the event',
               ),
             ),
            const SizedBox(height: 16),
            // Dropdown buttons for the start date
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Start Date Container
                  DropdownButton<int>(
                    value: _startDate.year,
                    onChanged: (int? year) {
                      _onStartDateChanged(DateTime(year!, _startDate.month, _startDate.day, _startDate.hour, _startDate.minute));
                      },
                    items: List.generate(DateTime.now().year - 1969, (index) => DropdownMenuItem<int>(
                      value: 1970 + index,
                      child: Text('${1970 + index}'),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Month Dropdown
                  DropdownButton<int>(
                    value: _startDate.month,
                    onChanged: (int? month) {
                      _onStartDateChanged(DateTime(_startDate.year, month! + 1, _startDate.day, _startDate.hour, _startDate.minute));
                      },
                    items: List.generate(12, (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Day Dropdown
                  DropdownButton<int>(
                    value: _startDate.day,
                    onChanged: (int? day) {
                      _onStartDateChanged(DateTime(_startDate.year, _startDate.month, day! + 1, _startDate.hour, _startDate.minute));
                      },
                    items: List.generate(getDaysInSaidDate(DateTime(_startDate.year, _startDate.month)), (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Hour Dropdown
                  DropdownButton<int>(
                    value: _startDate.hour,
                    onChanged: (int? hour) {
                      _onStartDateChanged(DateTime(_startDate.year, _startDate.month, _startDate.day, hour!, _startDate.minute));
                      },
                    items: List.generate(24, (index) => DropdownMenuItem<int>(
                      value: index,
                      child: Text(index.toString().padLeft(2, '0')),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Minute Dropdown
                  DropdownButton<int>(
                    value: _startDate.minute,
                    onChanged: (int? minute) {
                      _onStartDateChanged(DateTime(_startDate.year, _startDate.month, _startDate.day, _startDate.hour, minute!));
                      },
                    items: List.generate(60, (index) => DropdownMenuItem<int>(
                      value: index,
                      child: Text(index.toString().padLeft(2, '0')),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ]
            ),
            // Dropdown buttons for the end date
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Start Date Container
                  DropdownButton<int>(
                    value: _endDate.year,
                    onChanged: (int? year) {
                      _onEndDateChanged(DateTime(year!, _endDate.month, _endDate.day));
                      },
                    items: List.generate(DateTime.now().year - 1969, (index) => DropdownMenuItem<int>(
                      value: 1970 + index,
                      child: Text('${1970 + index}'),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Month Dropdown
                  DropdownButton<int>(
                    value: _endDate.month,
                    onChanged: (int? month) {
                      _onEndDateChanged(DateTime(_endDate.year, month!, _endDate.day));
                      },
                    items: List.generate(12, (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Day Dropdown
                  DropdownButton<int>(
                    value: _endDate.day,
                    onChanged: (int? day) {
                      _onEndDateChanged(DateTime(_endDate.year, _endDate.month, day!));
                      },
                    items: List.generate(DateTime(_endDate.year, _endDate.month + 1, 0).day, (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Hour Dropdown
                  DropdownButton<int>(
                    value: _endDate.hour,
                    onChanged: (int? hour) {
                      _onEndDateChanged(DateTime(_endDate.year, _endDate.month, _endDate.day, hour!, _endDate.minute));
                      },
                    items: List.generate(24, (index) => DropdownMenuItem<int>(
                      value: index,
                      child: Text(index.toString().padLeft(2, '0')),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Minute Dropdown
                  DropdownButton<int>(
                    value: _endDate.minute,
                    onChanged: (int? minute) {
                      _onEndDateChanged(DateTime(_endDate.year, _endDate.month, _endDate.day, _endDate.hour, minute!));
                      },
                    items: List.generate(60, (index) => DropdownMenuItem<int>(
                      value: index,
                      child: Text(index.toString().padLeft(2, '0')),
                    ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ]),
            // Text box for the location
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                hintText: 'Enter the location of the event',
              ),
            ),
            const SizedBox(height: 16),
            // Text box for the description
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter a description for the event',
              ),
            ),
            const SizedBox(height: 16),
            // Text box for the webpage (non-obligatory)
            TextField(
              controller: _webpageController,
              decoration: const InputDecoration(
                labelText: 'Webpage (optional)',
                hintText: 'Enter the webpage for the event',
              ),
            ),
            const SizedBox(height: 16),
            // Dropdown button for the monetization type
            DropdownButton<String>(
              hint: const Text('Monetization Type'),
              value: _monetizationString,
              onChanged: (String? value) {
                setState(() {
                  _monetizationString = value!;
                });
                if (_monetizationString == 'Paid') {
                  _monetization = true;
                } else {
                  _monetization = false;
                }},
              items: <String>['Free', 'Paid'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Text box for the event name
            TextField(
              controller: _imageLinkController,
              decoration: const InputDecoration(
                labelText: 'Image link (optional)',
                hintText: "Enter a link for the event's image",
              ),
            ),
            const SizedBox(height: 16),
            // Button to create the event
            ElevatedButton(
              onPressed: () {
                // Validate the mandatory fields
                if (_nameController.text.isEmpty || _locationController.text.isEmpty || _descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill in all mandatory fields')),
                  );
                } else {
                  createEvent();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePageWidget())
                  );
                  dispose();
                }
                },
              child: const Text('Create Event'),
            ),],
        ),
      ),
    );
  }

  @override
  void dispose() {
  // Dispose the text field controllers
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _webpageController.dispose();
    _imageLinkController.dispose();
    super.dispose();
  }
}
