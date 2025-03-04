import 'package:driftekhar_patient/src/constants/doc.contants.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String markdownContent = '';
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  Future<void> _loadFile() async {
    final String content = await rootBundle.loadString('assets/md/profile.md');
    setState(() => markdownContent = content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180.0),
        child: AppBar(
          leading: BackButton(color: Colors.black, onPressed: () => Navigator.pop(context)),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(20, 90, 10, 10),
            child: Row(
              children: [
                Hero(
                  tag: 'assets/icons/app.icon.png',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      height: 240,
                      width: 80,
                      fit: BoxFit.cover,
                      'assets/icons/app.icon.png',
                    ),
                  ),
                ),
                10.toWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      docName,
                      style: context.text.titleLarge,
                    ),
                    const Text('Assistant Propessor'),
                    const Text(docSpeciality),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 4, backgroundColor: context.theme.primaryColor),
                          2.toWidth,
                          const Text('MBBS (Dhaka)', style: TextStyle(fontSize: 10)),
                          5.toWidth,
                          CircleAvatar(radius: 4, backgroundColor: context.theme.primaryColorDark),
                          2.toWidth,
                          const Text('D-Ortho (BSMMU)', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),

                    // 10.toHeight,
                    const Text(
                      'Experience',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    // 5.toHeight,
                    Text('7+ years', style: context.text.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About', style: context.text.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
            Expanded(
              child: Markdown(
                controller: scrollController,
                selectable: true,
                data: markdownContent,
              ),
            ),
            // Text(markdownContent, textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }
}
