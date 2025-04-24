import 'package:flutter/material.dart';
import 'package:hoxton_wealth_project/UI/password_screen/password_screen.dart';

class EmailScreen extends StatelessWidget {
   EmailScreen({super.key});

final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeaf2f0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter your Email',
                style: TextStyle(fontSize: 25.0, fontFamily: 'PTSerif'),
              ),
              SizedBox(height: 10),
              Text(
                'Create a new account or continue where you left off',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 30),
              Text('Email', style: TextStyle(fontSize: 15.0)),
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid email';
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'By clicking on continue you agree with our Privacy Policy and Terms & Conditions',
                style: TextStyle(fontSize: 12.0),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //if(_formKey.currentState!.validate()){
                     Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => PasswordScreen()),
                  );
               //   }
                 
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFF004731)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
