import 'package:code_library/screens/bsc/select_year_screen.dart';
import 'package:flutter/material.dart';

// Book model to represent book data
class Book {
  final String title;
  final String description;
  final IconData icon;

  Book(
      {required this.title, required this.description, this.icon = Icons.book});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample book data - can be replaced with actual data source
  final List<Book> books = [
    Book(
        title: 'BSc E-Books ',
        description: 'For Computer Science Students',
        icon: Icons.science),
    Book(
        title: 'BCA E-Books',
        description: 'For Computer Science Students',
        icon: Icons.biotech),
    Book(
        title: 'Syllabus',
        description: 'Only Computer Subjects',
        icon: Icons.data_exploration),
    Book(
        title: 'All Papers',
        description: 'Only Computer Subjects',
        icon: Icons.calculate),
  ];

  // Search controller to filter books
  final TextEditingController _searchController = TextEditingController();
  List<Book> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _filteredBooks = books;
    _searchController.addListener(_filterBooks);
  }

  void _filterBooks() {
    setState(() {
      _filteredBooks = books
          .where((book) =>
              book.title
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              book.description
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_img.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Main Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Search TextField
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade800,
                      ),
                      hintText: 'Search book....',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10))),
                ),

                const SizedBox(height: 20),

                // Featured Section
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'New Books Collection',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // Book Grid
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                        ),
                        itemCount: _filteredBooks.length,
                        itemBuilder: (context, index) {
                          final book = _filteredBooks[index];
                          return GestureDetector(
                            onTap: () {
                              if (book.title == 'BSc E-Books') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentYearSelectionScreen(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue.shade300,
                                    child: Icon(book.icon, color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    book.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    book.description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
