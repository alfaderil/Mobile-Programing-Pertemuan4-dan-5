import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPage();
}

class _BerandaPage extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9), // Latar belakang abu-abu terang yang bersih
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Pertemuan 4",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon Header (Kotak Biru)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.edit_note,
                    color: Colors.blueAccent,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Judul Form
                const Text(
                  "Form Input Profil",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Subjudul Form
                const Text(
                  "Silakan isi data profil untuk ditampilkan pada halaman detail profil.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                
                // Form Fields
                _buildTextField("Nama Lengkap", Icons.badge_outlined),
                _buildTextField("Lokasi", Icons.location_on_outlined),
                _buildTextField("Jabatan", Icons.work_outline),
                _buildTextField("Profesi", Icons.people_outline),
                _buildTextField("Email", Icons.email_outlined),
                _buildTextField("No. HP", Icons.phone_outlined),
                _buildTextField(
                  "Tentang Saya",
                  Icons.info_outline,
                  maxLines: 4, 
                ),
                const SizedBox(height: 10),
                
                // Tombol Simpan Data (Menampilkan fungsi Submit Alert/Toast lama)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      SimpleAlertDialog.show(
                        context,
                        assetImagepath: AnimatedImage.confirm,
                        buttonsColor: Colors.green,
                        title: AlertTitleText("Apakah kamu yakin?"),
                        content: AlertContentText(
                          "Apakah kamu ingin menambahkan data",
                        ),
                        onConfirmButtonPressed: (ctx) {
                          CherryToast.success(
                            inheritThemeColors: true,
                            title: const Text("Berhasil menambahkan data!"),
                            borderRadius: 0,
                          ).show(context);
                          Navigator.pop(context);
                        },
                      );
                    },
                    icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                    label: const Text(
                      "Simpan Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                
                // Tombol Hapus Data (Menampilkan fungsi Delete Alert/Toast lama)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      SimpleAlertDialog.show(
                        context,
                        assetImagepath: AnimatedImage.warning,
                        buttonsColor: Colors.green,
                        title: AlertTitleText("Apakah kamu yakin?"),
                        content: AlertContentText("Apakah kamu ingin menghapus data"),
                        onConfirmButtonPressed: (ctx) {
                          CherryToast.success(
                            inheritThemeColors: true,
                            title: const Text("Berhasil menghapus data!"),
                            borderRadius: 0,
                          ).show(context);
                          Navigator.pop(context);
                        },
                      );
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.white),
                    label: const Text(
                      "Hapus Data",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget Bantuan untuk membuat input box lebih rapi
  Widget _buildTextField(String hintText, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              bottom: maxLines > 1 ? 60.0 : 0, 
            ),
            child: Icon(icon, color: Colors.blueAccent),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}