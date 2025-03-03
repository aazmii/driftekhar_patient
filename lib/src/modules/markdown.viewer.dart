import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_html/flutter_html.dart' show Html;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown/markdown.dart' as md;
// import 'package:markdown/markdown.dart' as md;

class MarkdownViewer extends ConsumerStatefulWidget {
  const MarkdownViewer({super.key, required this.path});
  final String path;

  @override
  ConsumerState<MarkdownViewer> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends ConsumerState<MarkdownViewer> {
  String markdownContent = '';
  @override
  void initState() {
    _loadFile();
    super.initState();
  }

  Future<void> _loadFile() async {
    final String content = await rootBundle.loadString(widget.path);
    setState(() => markdownContent = content);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Html(data: md.markdownToHtml(markdownContent)),
    );
  }
}
