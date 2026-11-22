import 'package:flutter/material.dart';
import 'model/contant_model.dart';
import 'widget/add_contant_bottom_sheet.dart';
import 'widget/custom_action_bottomn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showContantBottomChet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AddContantBottomSheet(
          onContactAdded: () {
            setState(() {});
          },
        );
      },
    );
  }

  void deleteAllContacts() {
    setState(() {
      ContantModel.contantList.clear();
    });
  }

  void deleteSingleContact(int index) {
    setState(() {
      ContantModel.contantList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xff29384D),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset("lib/assets/image/splash.png"),
        ),
        leadingWidth: width * 0.3,
      ),
      body: ContantModel.contantList.isEmpty
          ? Center(
              child: Image.asset("lib/assets/image/splash2.png"),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: ContantModel.contantList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final contact = ContantModel.contantList[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFEACC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Image & Name Overlay
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: contact.imagefile != null
                                    ? Image.file(
                                        contact.imagefile!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )
                                    : Image.asset(
                                        "lib/assets/image/yamal.png", // Placeholder image path for user
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFFEACC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    contact.userName,
                                    style: const TextStyle(
                                      color: Color(0xff29384D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Email Row
                        Row(
                          children: [
                            const Icon(Icons.email,
                                size: 14, color: Color(0xff29384D)),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                contact.email,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff29384D),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Phone Row
                        Row(
                          children: [
                            const Icon(Icons.phone,
                                size: 14, color: Color(0xff29384D)),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                contact.phone,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff29384D),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Delete Button per card
                        SizedBox(
                          height: 32,
                          child: ElevatedButton.icon(
                            onPressed: () => deleteSingleContact(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.delete, size: 14),
                            label: const Text(
                              "Delete",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: CustomActionBottomn(
        isadd: true,
        isdelet: ContantModel.contantList.isNotEmpty,
        showAdd: showContantBottomChet,
        deleteContant: deleteAllContacts,
      ),
    );
  }
}
