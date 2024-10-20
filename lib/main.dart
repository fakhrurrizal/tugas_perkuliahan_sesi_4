import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  HomeScreen({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  final List<Map<String, dynamic>> roomData = [
    {
      'name': 'Bed Room',
      'devices': 7,
      'icon': Icons.bed,
      'color': Colors.purple[300]
    },
    {
      'name': 'Kitchen',
      'devices': 5,
      'icon': Icons.kitchen,
      'color': Colors.amber[100]
    },
    {
      'name': 'Living Room',
      'devices': 10,
      'icon': Icons.weekend,
      'color': Colors.pink[100]
    },
    {
      'name': 'Dining Room',
      'devices': 8,
      'icon': Icons.restaurant,
      'color': Colors.green[100]
    },
    {
      'name': 'Bath Room',
      'devices': 4,
      'icon': Icons.bathtub,
      'color': Colors.blue[100]
    },
    {
      'name': 'Office Room',
      'devices': 12,
      'icon': Icons.computer,
      'color': Colors.cyan[100]
    },
    {
      'name': 'Guest Room',
      'devices': 10,
      'icon': Icons.person,
      'color': Colors.lightGreen[100]
    },
    {
      'name': 'Drawing Room',
      'devices': 8,
      'icon': Icons.brush,
      'color': Colors.purple[100]
    },
    {
      'name': 'Music Room',
      'devices': 6,
      'icon': Icons.music_note,
      'color': Colors.deepOrange[100]
    },
    {
      'name': 'Game Room',
      'devices': 7,
      'icon': Icons.videogame_asset,
      'color': Colors.teal[100]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: roomData.length,
        itemBuilder: (context, index) {
          final room = roomData[index];
          return Card(
            color: room['color'],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        room['icon'],
                        size: 25,
                        color: room['color'],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    room['name'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${room['devices']} devices',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
