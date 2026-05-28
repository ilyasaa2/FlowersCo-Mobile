import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3F5),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),

              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 360,
                ),

                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    const Text(
                      "Flowers.co",
                      style: TextStyle(
                        color: AppColors.primaryPink,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(
                      height: 28,
                    ),

                    Container(
                      width: double.infinity,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 28,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(
                          22,
                        ),

                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],

                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/images/bungabclogin.jpg',
                          ),

                          fit: BoxFit.cover,

                          colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.88),
                            BlendMode.lighten,
                          ),
                        ),
                      ),

                      child: Column(
                        children: [

                          const SizedBox(
                            height: 10,
                          ),

                          const Text(
                            "Lupa Kata Sandi",
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 76, 4, 47),
                            ),
                          ),

                          const SizedBox(
                            height: 14,
                          ),

                          const Text(
                            "Masukkan alamat email Anda di bawah ini dan kami akan mengirimkan instruksi untuk mengatur ulang kata sandi Anda.",
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 13,
                              height: 1.6,
                              color:Color.fromARGB(255, 178, 132, 150),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Alamat Email",
                              hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade400,
                              ),

                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFFC89AA8),
                              ),

                              filled: true,
                              fillColor: const Color(
                                0xFFFFF7F9,
                              ),

                              contentPadding:
                                  const EdgeInsets.symmetric(
                                vertical: 16,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),

                                borderSide: BorderSide(
                                  color: Colors.pink.shade100,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),

                                borderSide: BorderSide(
                                  color: Colors.pink.shade100,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),

                                borderSide:
                                    const BorderSide(
                                  color: AppColors.primaryPink,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 28,
                          ),

                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryPink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                              ),

                              child: const Text(
                                "Kirim Tautan Atur Ulang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 26,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        "← Kembali ke Masuk",

                        style: TextStyle(
                          color: AppColors.primaryPink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}