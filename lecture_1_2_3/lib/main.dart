// import 'package:flutter/material.dart';
// import 'package:test_app/student.dart';
//
// void main() =>
//   runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Виконав Опанасевич О.Б.'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   bool isNameValid = true;
//   var validationExpr = RegExp(r'^(?<uppercase>[А-ЯЄЇ])(?<rest>[а-яєї]*)$');
//   // late String _lastname;
//   var students = [Student.fabric(StudentType.bachelor), Student.fabric(StudentType.master)];
//     // , Student.fabric(StudentType.aspirant)];
//
//   final List<TextEditingController> myControllers =
//     List.generate(2, (i) => TextEditingController());
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   void funcWithDefaultParams(String name, [String defaultParam = 'Default']){
//     print(defaultParam);
//   }
//
//   void useFunc(){
//     var a = 7;
//     var b = 7;
//     var c;
//     c ??= a - b;
//     // c ??= a + b;
//
//     Function multiply(var a, var b) {return () => a * b;}
//
//     Function outer(){       // внешняя функция
//       var n = 5;         // некоторая переменная - лексическое окружение функции inner
//       void inner(){     // вложенная функция
//         // действия с переменной n
//         n++;
//         print(n);
//       }
//       return inner;
//     }
//
//     Function fn = outer();
//     fn(); // n = 6
//     fn(); // 7
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the widget tree.
//     // This also removes the _printLatestValue listener.
//     for (var con in myControllers) {
//       con.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Center(
//
//             child: Form(
//
//               key: _formKey,
//
//               child: Column(
//                 // Column is also a layout widget. It takes a list of children and
//                 // arranges them vertically. By default, it sizes itself to fit its
//                 // children horizontally, and tries to be as tall as its parent.
//                 //
//                 // Invoke "debug painting" (press "p" in the console, choose the
//                 // "Toggle Debug Paint" action from the Flutter Inspector in Android
//                 // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//                 // to see the wireframe for each widget.
//                 //
//                 // Column has various properties to control how it sizes itself and
//                 // how it positions its children. Here we use mainAxisAlignment to
//                 // center the children vertically; the main axis here is the vertical
//                 // axis because Columns are vertical (the cross axis would be
//                 // horizontal).
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: myControllers[0],
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return "Введіть ім'я";
//                         }
//                         var matches = validationExpr.allMatches(value);
//                         if(matches.isEmpty) return "Ім'я починається з великої літери";
//                         for(var match in matches) {
//                           print('Match '  + match.namedGroup('rest')!);
//                           if(match.namedGroup('uppercase')!.isEmpty) {
//                             return "Ім'я починається з великої літери";
//                           }
//                           else if(match.namedGroup('rest') == null) {
//                             return "Будь ласка, правильно введіть своє ім'я";
//                           }
//                         }
//
//                         return null;
//                         // isNameValid = true;
//                         // setState(() {lastname = value;});
//
//                       },
//                     onChanged: (value) {
//                       !_formKey.currentState!.validate();
//                     },
//                     onFieldSubmitted: (value) {
//                       if(!_formKey.currentState!.validate()) {
//                         return;
//                       }
//
//                     },
//                     onEditingComplete: (){
//                       students[0].firstname = myControllers[0].value.text;
//                       print(students[0].lastname);
//                     },
//                     // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^[А-Яа-я]+$"))],
//                     decoration: const InputDecoration(
//                         icon: Icon(Icons.person),
//                         border: OutlineInputBorder(),
//                         labelText: "Ім'я",
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                       child: Container(
//                         // color: Colors.amber,
//                         height: 20,
//                         decoration: BoxDecoration(
//                       boxShadow: [
//                       BoxShadow(
//                       color: Colors.black38,
//                         blurRadius: 25,
//                         offset: const Offset(0, 10),
//                       ),
//                     ],
//                   )
//                       )
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: myControllers[1],
//                     // style: TextStyle(color: isNameValid ? const Color(0x002798f3) : Colors.red,),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return "Введіть прізвище";
//                       }
//                       var matches = validationExpr.allMatches(value);
//                       if(matches.isEmpty) return "Прізвище починається з великої літери або ви ввели англійські літери";
//                       for(var match in matches) {
//                         print('Match '  + match.namedGroup('rest')!);
//                         if(match.namedGroup('uppercase')!.isEmpty) {
//                           return "Прізвище починається з великої літери або ви ввели англійські літери";
//                         }
//                         else if(match.namedGroup('rest') == null) {
//                           return "Будь ласка, правильно введіть своє прізвище";
//                         }
//                       }
//
//                       return null;
//                       // isNameValid = true;
//                       // setState(() {lastname = value;});
//
//                     },
//                     onChanged: (value) {
//                       !_formKey.currentState!.validate();
//                     },
//                     onFieldSubmitted: (value) {
//                       if(!_formKey.currentState!.validate()) {
//                       return;
//                       }
//
//                     },
//                     onEditingComplete: (){
//                       students[0].lastname = myControllers[1].value.text;
//                       print(students[0].lastname);
//                     },
//                     // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"^[А-Яа-я]+$"))],
//                     decoration: const InputDecoration(
//                         icon: Icon(Icons.person),
//                         border: OutlineInputBorder(),
//                         labelText: 'Прізвище'),
//                     // style: Theme.of(context).textTheme.headline4,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             )
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//
//       )),
//       floatingActionButton: const FloatingActionButton(
//         tooltip: 'Increment',
//         onPressed: null,
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/tweets.dart';
void main() => runApp(const TwitterCloneApp());

class TwitterCloneApp extends StatelessWidget {
  const TwitterCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorBrightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          child: CircleAvatar(
              child:
              CachedNetworkImage(
                imageUrl: 'https://pbs.twimg.com/profile_images/1339934601960108036/tx6E0Ycr_400x400.jpg',
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: listOfTweets(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.pen),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomIconButton(Icons.home, Colors.blue),
            buildBottomIconButton(Icons.search, Colors.black45),
            buildBottomIconButton(Icons.notifications, Colors.black45),
            buildBottomIconButton(Icons.mail_outline, Colors.black45),
          ],
        ),
      ),
    );
  }

  Widget buildBottomIconButton(IconData icon, Color color) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {},
    );
  }

  Widget listOfTweets() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return tweets[index];
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 1,
        ),
        itemCount: tweets.length,
      ),
    );
  }
}