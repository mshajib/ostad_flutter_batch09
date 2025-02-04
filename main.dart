import 'package:flutter/material.dart';

void main() {
  runApp(MyAp());
}

class MyAp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContctListScreen(),
    );
  }
}

class ContctListScreen extends StatefulWidget {
  @override
  _ContactListScreenStat createState() => _ContactListScreenStat();
}

class _ContactListScreenStat extends State<ContctListScreen> {
  final TextEditingController namController = TextEditingController();
  final TextEditingController numbrController = TextEditingController();

  final List<Map<String, String>> contcts = [];

  void adContact() {
    String nam = namController.text.trim();
    String numbr = numbrController.text.trim();

    if (nam.isNotEmpty && numbr.isNotEmpty) {
      setState(() {
        contcts.add({'name': nam, 'number': numbr});
      });

      namController.clear();
      numbrController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and number')),
      );
    }
  }

  void deletContact(int indx) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Are you sure you want to delete this contact?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  contcts.removeAt(indx);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numbrController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: adContact,
              child: Text('Add Contact'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contcts.length,
                itemBuilder: (context, indx) {
                  return GestureDetector(
                    onLongPress: () {
                      deletContact(indx);
                    },
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(contcts[indx]['name']!),
                      subtitle: Text(contcts[indx]['number']!),
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
