
// data/subjects_data.dart
import 'package:flutter/material.dart';

class Subject {
  final String name;
  final String code;
  final String description;
  final IconData icon;

  Subject({
    required this.name,
    required this.code,
    required this.description,
    required this.icon,
  });
}


class SubjectsData {
  static final Map<int, List<Subject>> yearWiseSubjects = {
    1: [
      Subject(
        name: 'Web Design',
        code: 'BSC 1',
        description: 'Fundamental mathematical concepts and calculus',
        icon: Icons.functions,
      ),
      Subject(
        name: 'Computer Architecture',
        code: 'Bsc 1',
        description: 'Basic physics principles and mechanics',
        icon: Icons.science,
      ),
       Subject(
        name: 'Programming Methodlogy with DSA',
        code: 'Bsc 1',
        description: 'Basic physics principles and mechanics',
        icon: Icons.science,
      ),
      // Add more subjects...
    ],
    2: [
      Subject(
        name: 'Web design with Php',
        code: 'CS201',
        description: 'Advanced data structures and algorithms',
        icon: Icons.account_tree,
      ),
      Subject(
        name: 'Computer Networks',
        code: 'CS202',
        description: 'Introduction to computer networks and security',
        icon: Icons.network_check,
      ),
       Subject(
        name: 'Programming with Java',
        code: 'CS202',
        description: 'Introduction to computer networks and security',
        icon: Icons.network_check,
      ),

      // Add more subjects...
    ],
    3: [
      Subject(
        name: 'Web design with Angular',
        code: 'CS301',
        description: 'Introduction to machine learning and AI concepts',
        icon: Icons.psychology,
      ),
      Subject(
        name: 'Operating Systems',
        code: 'CS302',
        description: 'Database management and SQL queries',
        icon: Icons.storage,
      ),
       Subject(
        name: 'Programming with Python',
        code: 'CS302',
        description: 'Database management and SQL queries',
        icon: Icons.storage,
      ),
      // Add more subjects...
    ],
  };
}

// screens/subject_detail_screen.dart
class SubjectDetailScreen extends StatelessWidget {
  final Subject subject;

  const SubjectDetailScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    subject.icon,
                    size: 40,
                    color: Colors.blue[800],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject.code,
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subject.description,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Add more details as needed...
          ],
        ),
      ),
    );
  }
}

// widgets/subject_card.dart
class SubjectCard extends StatelessWidget {
  final Subject subject;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  subject.icon,
                  color: Colors.blue[800],
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subject.code,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// screens/year_tabs_screen.dart
class YearTabsScreen extends StatelessWidget {
  const YearTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Academic Subjects',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue[800],
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            ),
            tabs: const [
              Tab(text: '1st Year'),
              Tab(text: '2nd Year'),
              Tab(text: '3rd Year'),
            ],
          ),
        ),
        body: TabBarView(
          children: [1, 2, 3].map((year) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: SubjectsData.yearWiseSubjects[year]?.length ?? 0,
              itemBuilder: (context, index) {
                final subject = SubjectsData.yearWiseSubjects[year]![index];
                return SubjectCard(
                  subject: subject,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubjectDetailScreen(
                          subject: subject,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}