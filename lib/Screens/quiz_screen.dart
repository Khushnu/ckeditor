// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:ckeditor/Models/quiz_list.dart';
import 'package:ckeditor/Models/quizmodel.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';

class QuizScreen extends StatefulWidget {
  final TeXViewRenderingEngine renderingEngine;

  const QuizScreen(
      {Key? key, this.renderingEngine = const TeXViewRenderingEngine.mathjax()})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TeXViewQuizExampleState createState() => _TeXViewQuizExampleState();
}

class _TeXViewQuizExampleState extends State<QuizScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var widgetdata;

  var d ;
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String s = jsonEncode(quizList);
    print(s);
    jsonDecode(s);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          // physics: const ScrollPhysics(),
          children: <Widget>[
            widgetdata = Column(
              children: [
                for (int a = 0; a < quizList.length; a++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TeXView(
                      loadingWidgetBuilder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Shimmer(
                            gradient:  LinearGradient(colors: [Colors.grey, Colors.amber.shade200]),
                            child: Container(
                               height: 50,
                              width: screenWidth ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12), 
                              color: Colors.grey
                            ),
                            ),
                          ),
                        );
                      },
                      renderingEngine: widget.renderingEngine,
                      child:   TeXViewColumn(children: [
                        TeXViewDocument(quizList[a].statement,
                            style: const TeXViewStyle(
                                padding: TeXViewPadding.all(6),
                                textAlign: TeXViewTextAlign.Justify)),
                        TeXViewGroup(
                          children:
                              quizList[a].options.map((QuizOption option) {
                            return TeXViewGroupItem(
                                rippleEffect: false,
                                id: option.id,
                                child: TeXViewDocument(option.option,
                                    style: const TeXViewStyle(
                                        padding: TeXViewPadding.all(10))));
                          }).toList(),
                          selectedItemStyle: TeXViewStyle(
                              borderRadius: const TeXViewBorderRadius.all(10),
                              border: TeXViewBorder.all(TeXViewBorderDecoration(
                                  borderWidth: 1,
                                  borderColor: Colors.green[900])),
                              margin: const TeXViewMargin.all(10)),
                          normalItemStyle:
                              const TeXViewStyle(margin: TeXViewMargin.all(10)),
                          onTap: (String id) {},
                        )
                      ]),
                      style: const TeXViewStyle(
                        margin: TeXViewMargin.all(5),
                        // padding: TeXViewPadding.all(10),
                        borderRadius: TeXViewBorderRadius.all(10),
                        border: TeXViewBorder.all(
                          TeXViewBorderDecoration(
                              borderStyle: TeXViewBorderStyle.Solid,
                              borderWidth: 5),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveAsPdf,
        backgroundColor: Colors.deepPurple,
        child: const Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }

  Future<void> saveAsPdf() async {
    final pdf = pw.Document();
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted, continue with saving PDF
      if(Platform.isAndroid){
final appDocDir = await getApplicationDocumentsDirectory();
      final pdfFile = File("${appDocDir.path}/file.pdf");
        await pdfFile.writeAsBytes(await pdf.save());
      } else if(Platform.isIOS) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final pdfFile = File("${appDocDir.path}/file.pdf");
      for (var quiz in quizList) {
        pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              children: [
                pw.Paragraph(
                  text: quiz.statement,
                  style: const pw.TextStyle(fontSize: 12),
                ),
                for (var option in quiz.options)
                  pw.Paragraph(
                    text: option.option,
                    style: const pw.TextStyle(fontSize: 12),
                  ),
              ],
            );
          },
        ));
      }

      // Save the PDF to the specified path
      await pdfFile.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: const Text('PDF saved successfully!'),
          action: SnackBarAction(
              label: 'View',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PDFView(
                      filePath: "${appDocDir.path}/file.pdf",
                    ),
                  ),
                );
              }),
        ),
      );
    } else {
      // Handle permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Permission Denied to Save PDF'),
        ),
      );
    }
  }
}
}