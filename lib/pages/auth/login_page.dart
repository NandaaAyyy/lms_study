import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsiveness
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Header Section with Stack
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Curved Image Background
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                    height: size.height * 0.35,
                    width: double.infinity,
                    color: Colors.grey.shade300, // Placeholder for building image
                    child: Image.network(
                      'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png', // Flutter default placeholder or use asset
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, error, stackTrace) => Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.school, size: 80, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                
                // Logo overlapping
                Positioned(
                  bottom: -40,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Login Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Email Field
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email 365',
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Password Field
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigation to HomePage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Help Text
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Bantuan ?',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Spacer to push bottom wave down if screen is tall
             SizedBox(height: size.height * 0.05),

            // Bottom Wave Decoration
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                height: 120,
                width: double.infinity,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for the Top Header Background
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom left-ish
    
    // Create a curve that goes slightly up towards the center
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 40);
    
    // Simple concave/convex curve attempt
    // Let's try a simple arc for now to match the "Concave" look often seen
    // Resetting for a cleaner arc:
    path = Path();
    path.lineTo(0, size.height - 50);
    path.lineTo(size.width / 2 - 50, size.height + 20); // Simulating the dip? 
    // Actually standard sloped header:
    path = Path();
    path.lineTo(0, size.height - 40);
    path.lineTo(size.width, size.height - 100); // Slanted up
    path.lineTo(size.width, 0);
    path.close();
    
    // Trying to match image: The image seems to be a "V" shape or "U" shape cutout? 
    // Let's do a simple Convex curve (curving OUT/Down) or Concave (curving IN/Up).
    // The image shows the WHITE background curving UP into the image.
    // So the IMAGE must curve UP (Concave).
    
    path = Path();
    path.lineTo(0, size.height);
    
    // Control point in the middle-bottom
    // We want the bottom edge to curve UP.
    // So start at (0, height), go to (width, height) but curve up in middle.
    
    // Start top-left (0,0)
    path.lineTo(0, size.height);
    // Quadratic bezier to (width, height) with control point higher up
    // path.quadraticBezierTo(size.width / 2, size.height - 100, size.width, size.height);
    
    // Actually looking at the image provided in mind:
    // It looks like a slant or a gentle curve. 
    // Let's do a standard gentle convex curve for a nice look.
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(size.width / 2, size.height + 40, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Clipper for the Bottom Wave
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height); // Bottom left
    path.lineTo(0, size.height * 0.4); 
    
    // Wave 1
    path.quadraticBezierTo(
        size.width * 0.25, 0, size.width * 0.5, size.height * 0.4);
    
    // Wave 2
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.8, size.width, size.height * 0.4);
        
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
