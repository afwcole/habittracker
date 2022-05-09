import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/pages/empty_state_page.dart';
import 'package:habittracker/pages/homepage.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/widgets/build_bottom_sheet.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppDataProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFF9F7FF),
      ),
      home: Consumer<UserDataProvider>(
        builder: (context, userDataProvider, child) => Scaffold(
          resizeToAvoidBottomInset: true,
          body: userDataProvider.habitList.isEmpty
              ? EmptyStateBody()
              : const HomePage(),
          extendBody: true,
          floatingActionButton: userDataProvider.habitList.isEmpty
              ? null
              : FloatingActionButton(
                  elevation: 10,
                  backgroundColor: const Color(0xFF7856CE),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.8),
                      context: context,
                      backgroundColor: const Color(0xFFF9F7FF),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      builder: (context) => const BuildBottomSheet(),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
        ),
      ),
    );
  }
}
