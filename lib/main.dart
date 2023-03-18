import 'package:chazon/features/product_detail/pages/expand_product.dart';
import 'package:chazon/palette/palette.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/pageImports.dart';
import 'firebase_options.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
      // DevicePreview(
      //   builder: (context) => const MyApp()),
      // );
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chazon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(

          primary:  Palette.chazonBlue,
          secondary: Palette.chazonBlueLess,

        ),
        // primarySwatch: Palette.chazonBlue,
      ),
      home: SignUpPage() ,
    );
  }
}

