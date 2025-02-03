
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final List<Map<String, String>> contacts = [];

  void addContact() {
    final String name = nameController.text;
    final String number = numberController.text;

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contacts.add({'name': name, 'number': number});
      });
      nameController.clear();
      numberController.clear();
    }
  }

  void deleteContact(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure for Delete?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Icon(Icons.delete),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: addContact,
              child: Text('Add'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => deleteContact(index),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(contacts[index]['name']!),
                      subtitle: Text(contacts[index]['number']!),
                      trailing: Icon(Icons.phone),
                    ),
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

