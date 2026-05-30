import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EEF2),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),

              Container(
                clipBehavior: Clip.hardEdge,
                width: 340,

                margin: const EdgeInsets.symmetric(horizontal: 20),

                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Container(
                  constraints: const BoxConstraints(minHeight: 520),

                  padding: const EdgeInsets.only(
                    top: 35,
                    left: 10,
                    right: 10,
                    bottom: 15,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    image: DecorationImage(
                      image: const AssetImage('assets/images/bungabclogin.jpg'),

                      fit: BoxFit.cover,

                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.82),
                        BlendMode.lighten,
                      ),
                    ),
                  ),

                  child: Form(
                    key: _formKey,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        const SizedBox(height: 23),

                        const Text(
                          "Flowers.co",
                          style: TextStyle(
                            color: AppColors.primaryPink,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        const SizedBox(height: 15),

                        const Text(
                          "Selamat datang kembali!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 76, 4, 47),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Silahkan masuk untuk melanjutkan\nperjalanan bunga Anda.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 178, 132, 150),
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 45),

                        // EMAIL
                        const Align(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            "Alamat Email",
                            style: TextStyle(
                              color: Color(0xFF7C6670),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: emailController,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib diisi";
                            }

                            if (!value.contains("@gmail.com")) {
                              return "Format email tidak valid";
                            }

                            return null;
                          },

                          decoration: InputDecoration(
                            hintText: "anda@contoh.com",

                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade400,
                            ),

                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFFB98B9B),
                              size: 20,
                            ),

                            filled: true,

                            fillColor: const Color(0xFFFFF8FA),

                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),

                              borderSide: BorderSide(
                                color: Colors.pink.shade100,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),

                              borderSide: const BorderSide(
                                color: AppColors.primaryPink,
                              ),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),

                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // PASSWORD
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              "Kata Sandi",
                              style: TextStyle(
                                color: Color(0xFF7C6670),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/forgot-password',
                                );
                              },

                              child: const Text(
                                "Lupa Kata Sandi?",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.primaryPink,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          controller: passwordController,

                          obscureText: _isObscure,

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib diisi";
                            }

                            if (value.length < 8) {
                              return "Min. 8 karakter, huruf besar & angka";
                            }

                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return "Min. 8 karakter, huruf besar & angka";
                            }

                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return "Min. 8 karakter, huruf besar & angka";
                            }

                            return null;
                          },

                          decoration: InputDecoration(
                            hintText: "••••••••",

                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade400,
                            ),

                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFFB98B9B),
                              size: 20,
                            ),

                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),

                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),

                            filled: true,

                            fillColor: const Color(0xFFFFF8FA),

                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),

                              borderSide: BorderSide(
                                color: Colors.pink.shade100,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),

                              borderSide: const BorderSide(
                                color: AppColors.primaryPink,
                              ),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),

                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        SizedBox(
                          width: double.infinity,
                          height: 48,

                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var response = await http.post(
                                  Uri.parse(
                                    "http://127.0.0.1/api_flowers/login.php",
                                  ),

                                  body: {
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                  },
                                );

                                var data = jsonDecode(response.body);

                                if (data["success"] == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(data["message"])),
                                  );

                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/home',
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(data["message"])),
                                  );
                                }
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPink,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),

                            child: const Text(
                              "Masuk",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },

                          child: const Text.rich(
                            TextSpan(
                              text: "Belum punya akun? ",

                              style: TextStyle(color: Colors.grey),

                              children: [
                                TextSpan(
                                  text: "Daftar",

                                  style: TextStyle(
                                    color: AppColors.primaryPink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
