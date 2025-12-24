import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tugas 01 - UID Android Mobile Game',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Instructions Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.blue.shade300, width: 4),
                ),
                color: Colors.white,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n\n'
                    '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.\n\n'
                    '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.\n\n'
                    '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.\n\n'
                    '5. File dikumpulkan dalam format PDF dengan size maksimal 5MB.\n\n'
                    '6. Tugas dikumpulkan paling lambat hari Jum\'at, 31 Desember 2025 Jam 23.59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
                    style: TextStyle(fontSize: 13, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // Status Section
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                   // Header
                   Container(
                     width: double.infinity,
                     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                     decoration: const BoxDecoration(
                       color: AppColors.secondary, 
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(12),
                         topRight: Radius.circular(12),
                       ),
                     ),
                     child: const Text(
                       'Status Tugas',
                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                     ),
                   ),
                   
                   // Rows
                   _buildStatusRow('Status', 'Sudah Mengirim untuk dinilai'),
                   _buildStatusRow('Status Nilai', 'Belum ada nilai'),
                   _buildStatusRow('Batas tanggal', 'Jumat, 31 Desember 2025, 23:59 WIB'),
                   _buildStatusRow('Sisa Waktu', 'Tugas sudah di kirim 4 Hari 5 Jam sebelum nya'), 
                   
                   Container(
                     padding: const EdgeInsets.all(16),
                     decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const SizedBox(
                           width: 100,
                           child: Text('File Tugas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                         ),
                         Expanded(
                           child: Row(
                             children: [
                               const Icon(Icons.picture_as_pdf, color: Colors.grey, size: 20),
                               const SizedBox(width: 8),
                               Expanded(
                                 child: Text(
                                   'Randy Candra Pratama_714....pdf',
                                   style: TextStyle(color: Colors.blue.shade700, decoration: TextDecoration.underline),
                                   overflow: TextOverflow.ellipsis,
                                 ),
                               ),
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                   
                   const SizedBox(height: 20),
                   
                   // Button
                   Padding(
                     padding: const EdgeInsets.only(bottom: 24.0),
                     child: ElevatedButton(
                       onPressed: () => _showUploadSheet(context),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.grey.shade200,
                         foregroundColor: Colors.black,
                         elevation: 0,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                       ),
                       child: const Text('Tambahkan Tugas'),
                     ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value) {
    return Container(
       padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(
          color: label == 'Status' || label == 'Status tanggal' ? Colors.grey.shade50 : Colors.white,
          border: const Border(bottom: BorderSide(color: Colors.grey, width: 0.2))
       ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             width: 100,
             child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
           ),
           Expanded(
             child: Text(value, style: const TextStyle(fontSize: 13)),
           )
         ],
       ),
    );
  }

  void _showUploadSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const Text(
                      'Upload File',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Maksimum File 5MB, Maksimum Jumlah File 20',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    
                    // Upload Area (Dotted Border Simulation)
                    CustomPaint(
                      painter: DottedBorderPainter(),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          children: [
                            Icon(Icons.cloud_upload_outlined, size: 80, color: Colors.blue.shade400),
                            const SizedBox(height: 16),
                            const Text(
                              'File yang akan di upload akan tampil di sini',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Buttons
                    Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              foregroundColor: Colors.black87,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Pilih File'),
                          ),
                        ),
                        const SizedBox(height: 12),
                         SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                             style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              foregroundColor: Colors.black87,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Simpan'),
                          ),
                        ),
                      ],
                    ),
                     const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    
    // Function to draw dashed line
    void drawDashedLine(Offset start, Offset end) {
      double distance = (end - start).distance;
      double currentDistance = 0.0;
      while (currentDistance < distance) {
        double len = dashWidth;
        if (currentDistance + dashWidth > distance) {
          len = distance - currentDistance;
        }
        canvas.drawLine(
          start + (end - start) * (currentDistance / distance),
          start + (end - start) * ((currentDistance + len) / distance),
          paint,
        );
        currentDistance += dashWidth + dashSpace;
      }
    }

    // Top
    drawDashedLine(const Offset(0, 0), Offset(size.width, 0));
    // Right
    drawDashedLine(Offset(size.width, 0), Offset(size.width, size.height));
    // Bottom
    drawDashedLine(Offset(size.width, size.height), Offset(0, size.height));
    // Left
    drawDashedLine(Offset(0, size.height), const Offset(0, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
