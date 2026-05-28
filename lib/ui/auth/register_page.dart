import 'package:flutter/material.dart';
import '../../core/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F2F5),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),

            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 360,
              ),

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 26,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "Flowers.co",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: AppColors.primaryPink,
                            ),
                          ),

                          const SizedBox(
                            height: 6,
                          ),

                          const Text(
                            "Buat akun Anda",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFA98A97),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 28,
                    ),

                    const Text(
                      "Daftar Akun",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 76, 4, 47),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    const Text(
                      "Bergabunglah untuk pengalaman belanja yang lebih personal.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 178, 132, 150),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(
                      height: 26,
                    ),

                    _buildTextField(
                      "NAMA LENGKAP",
                      "Masukkan nama lengkap Anda",
                      icon: Icons.person_outline,
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    _buildTextField(
                      "EMAIL",
                      "Masukkan email Anda",
                      icon: Icons.email_outlined,
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    const Text(
                      "KATA SANDI",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7C6670),
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    TextField(
                      obscureText: _isObscure,

                      decoration: InputDecoration(
                        hintText: "Buat kata sandi",

                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade400,
                        ),

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFFC89AA8),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xFF8D6E7B),
                          ),

                          onPressed: () {
                            setState(() {
                              _isObscure =
                                  !_isObscure;
                            });
                          },
                        ),

                        filled: true,
                        fillColor: const Color(0xFFFFF7F9),

                        contentPadding:
                            const EdgeInsets.symmetric(
                          vertical: 16,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide: BorderSide(
                            color: Colors.pink.shade100,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide: BorderSide(
                            color: Colors.pink.shade100,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide: const BorderSide(
                            color: AppColors.primaryPink,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    const Text(
                      "KONFIRMASI KATA SANDI",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7C6670),
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    TextField(
                      obscureText: _isObscureConfirm,

                      decoration: InputDecoration(
                        hintText: "Konfirmasi kata sandi Anda",

                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade400,
                        ),

                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFFC89AA8),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscureConfirm
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xFF8D6E7B),
                          ),

                          onPressed: () {
                            setState(() {
                              _isObscureConfirm =
                                  !_isObscureConfirm;
                            });
                          },
                        ),

                        filled: true,
                        fillColor: const Color(0xFFFFF7F9),

                        contentPadding:
                            const EdgeInsets.symmetric(
                          vertical: 16,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide: BorderSide(
                            color: Colors.pink.shade100,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide: BorderSide(
                            color: Colors.pink.shade100,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide: const BorderSide(
                            color: AppColors.primaryPink,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 54,

                      child: ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primaryPink,

                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),

                        child: const Text(
                          "DAFTAR SEKARANG",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text.rich(
                          TextSpan(
                            text: "Sudah punya akun? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),

                            children: [
                              TextSpan(
                                text: "Masuk",

                                style: TextStyle(
                                  color: AppColors.primaryPink,
                                  fontWeight: FontWeight.bold,
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
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    IconData? icon,
  }) {

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C6670),
          ),
        ),

        const SizedBox(
          height: 8,
        ),

        TextField(
          decoration: InputDecoration(
            hintText: hint,

            hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade400,
            ),

            prefixIcon:
                icon != null
                    ? Icon(
                        icon,
                        color: const Color(0xFFC89AA8),
                      )
                    : null,

            filled: true,
            fillColor: const Color(0xFFFFF7F9),

            contentPadding:
                const EdgeInsets.symmetric(
              vertical: 16,
            ),

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),

              borderSide: BorderSide(
                color: Colors.pink.shade100,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),

              borderSide: BorderSide(
                color: Colors.pink.shade100,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),

              borderSide: const BorderSide(
                color: AppColors.primaryPink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}