import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';
import 'package:my_document/presentation/pages/mobile/documents/MobileListDocumentScreen.dart';
import 'package:my_document/presentation/pages/mobile/documents/MobileTransactionScreen.dart';

import '../../../bloc/document/document_bloc.dart';
import '../../../bloc/document/document_event.dart';

class MobileDocumentScreen extends StatefulWidget {
  const MobileDocumentScreen({super.key});

  @override
  State<MobileDocumentScreen> createState() => _MobileDocumentScreenState();
}

class _MobileDocumentScreenState extends State<MobileDocumentScreen> {
  final List<String> typesDocuments = [
    "Joining Document",
    "Transaction Document",
    "Team Document",
    "Tax Document",
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DocumentBloc>(context).add(DocumentsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text('Documents',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.3,
                letterSpacing: -0.4,
                color: const Color(0xff303030),
              )),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
            itemCount: typesDocuments.length,
            itemBuilder: (context, index) => SizedBox(
              height: 60,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          typesDocuments[index] == "Transaction Document"
                              ? MobileTransactionScreen(
                                  typesDocument: typesDocuments[index])
                              : MobileListDocumentScreen(
                                  typesDocument: typesDocuments[index])));
                },
                shape: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(48, 48, 48, 0.5), width: 1)),
                title: Text(
                  typesDocuments[index],
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor),
                ),
                trailing: Image.asset(
                  'assets/right.png',
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ));
  }
}
