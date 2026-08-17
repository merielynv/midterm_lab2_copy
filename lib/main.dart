import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// StatefulWidget because it needs to maintain state (dark mode on/off)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This variable holds the current theme state
  bool isDarkMode = false;

  // Function that toggles dark mode and rebuilds the widget
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: ProfilePage(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
    );
  }
}

// StatelessWidget because this page does not manage its own state
class ProfilePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  // Function that opens a modal popup showing a GIF
  void showGifPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text("Welcome My Gal")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.center, // centers content horizontally
            children: [
              Image.asset('assets/assets/images/blushing_cat.gif', height: 200),
            ],
          ),
          actionsAlignment:
              MainAxisAlignment.center, // centers the Close button
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
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
        title: const Text("STUDENT PROFILE"),
        centerTitle: true, // <-- centers the AppBar title
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            // Replaced Icon with Image.asset using sun/moon image files
            icon: Image.asset(
              isDarkMode
                  ? 'assets/images/light_mode.png'
                  : 'assets/images/dark_mode.png',
              width: 24,
              height: 24,
              color: Colors.white, // Tints the black image icon to white
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.pinkAccent,
                backgroundImage: AssetImage(
                  'assets/images/my_image.jpg', // placeholder photo
                ),
              ),
              const SizedBox(height: 12),

              // Name and nickname
              const Text(
                "Merielyn B. Navea",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "\"Merie\"",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),

              // Button that opens the GIF modal
              ElevatedButton.icon(
                onPressed: () => showGifPopup(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
                // Replaced Icon with Image.asset using click image file
                icon: Image.asset(
                  'assets/images/click.png',
                  width: 20,
                  height: 20,
                  color: Colors.white, // Tints the black click image to white
                ),
                label: const Text("Greetings"),
              ),

              const SizedBox(height: 16),
              const Divider(thickness: 1),

              // Personal Information Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.cake, color: Colors.pinkAccent),
                        title: Text("Age"),
                        subtitle: Text("20 years old"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                          color: Colors.pinkAccent,
                        ),
                        title: Text("Birthday"),
                        subtitle: Text("May 08, 2006"),
                      ),
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.pinkAccent),
                        title: Text("Address"),
                        subtitle: Text("Cabuyao, Laguna"),
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite, color: Colors.pinkAccent),
                        title: Text("Hobby"),
                        subtitle: Text("Watching Kdrama, Cdrama & Anime"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.format_quote,
                          color: Colors.pinkAccent,
                        ),
                        title: Text("Motto"),
                        subtitle: Text(
                          "There are no regrets in life, only lessons.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Academic Information Card (Spaced identically with ListTiles)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Academic Information",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.school, color: Colors.pinkAccent),
                        title: Text("Degree"),
                        subtitle: Text("BS Information Technology"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.menu_book,
                          color: Colors.pinkAccent,
                        ),
                        title: Text("Favorite Subject"),
                        subtitle: Text("Mobile App Development"),
                      ),
                      ListTile(
                        leading: Icon(Icons.code, color: Colors.pinkAccent),
                        title: Text("Programming Languages"),
                        subtitle: Text("Dart, Java, Kotlin"),
                      ),
                      ListTile(
                        leading: Icon(Icons.flag, color: Colors.pinkAccent),
                        title: Text("Career Goal"),
                        subtitle: Text("Mobile App Developer"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
