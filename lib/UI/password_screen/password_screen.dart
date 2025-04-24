import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hoxton_wealth_project/UI/password_screen/widgets/password_requirement.dart';
import 'package:hoxton_wealth_project/UI/animated_loading_Screen/animated_loading_screen.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreemState();
}

class _PasswordScreemState extends State<PasswordScreen> {
  String password = '';

  bool _visible = false;

  final TextEditingController _controller = TextEditingController();

  bool get isProperLength => password.length >= 8 && password.length <= 16;

  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));

  bool get hasLowercase => password.contains(RegExp(r'[a-z]'));

  bool get hasNumber => password.contains(RegExp(r'\d'));

  bool get hasSpecialChar =>
      password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        password = _controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeaf2f0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Set Password',
                style: TextStyle(fontSize: 25.0, fontFamily: 'PTSerif'),
              ),
              SizedBox(height: 10),
              Text(
                'Create a strong password to secure your account.',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 30),
              Text('Password', style: TextStyle(fontSize: 15.0)),
              Form(
                key: _formKey,

                child: TextFormField(
                  obscureText: !_visible,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _visible = !_visible),
                      icon:
                          _visible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !isProperLength ||
                        !hasUppercase ||
                        !hasLowercase ||
                        !hasNumber ||
                        !hasSpecialChar) {
                      return 'Please enter a valid password';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Password Requirements:',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              //  requirement rules
              PasswordRequirement(
                text: "8–16 characters long",
                isMet: isProperLength,
              ),
              PasswordRequirement(
                text: "At least one number",
                isMet: hasNumber,
              ),
              PasswordRequirement(
                text: "At least one special character (!@#\$...)",
                isMet: hasSpecialChar,
              ),
              PasswordRequirement(
                text: "At least one uppercase letter",
                isMet: hasUppercase,
              ),
              PasswordRequirement(
                text: "At least one lowercase letter",
                isMet: hasLowercase,
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset('assets/icon-5.svg', width: 20, height: 20),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      'We use bank-grade encription and multi-layer protection to keep your financial data keep safe from day one.',
                      softWrap: true,
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => AnimatedLoadingDashboardScreen(),
                      ),
                    );
                  }
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
                  'Set Password',
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
