import 'package:flutter/material.dart';
import 'package:pract3_2/models/user.dart';
import 'package:pract3_2/screens/example_nested.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPageState extends State<MyLogin> {
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Stack(children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline3,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                  initialValue: widget.user.username),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                initialValue: widget.user.password,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberUser,
                      onChanged: (checked) {
                        setState(() {
                          rememberUser = !rememberUser;
                        });
                    }),
                    const Text('Remember me')
                  ],
                )
              ),
              ElevatedButton(
                child: const Text('ENTER'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/catalog');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              )
            ],
          ),
          Align(alignment: Alignment.topRight, child: MaterialButton(child: const Text('Press me!'), onPressed: () { Navigator.push(context, MaterialPageRoute<NestedNavigator>(builder: (context) => const NestedNavigator())); },),)
          ])
        ),
      ),
    );
  }
}

class MyLogin extends StatefulWidget {
  final User user;
  const MyLogin(this.user, {Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => MyLoginPageState();
}
