import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bottom Booking Bar Widget
class BottomBookingBar extends StatefulWidget {
  final String originalPrice;
  final String discountedPrice;
  final String duration;
  final String dateRange;
  final String guests;

  const BottomBookingBar({
    super.key,
    this.originalPrice = '₹19,500',
    this.discountedPrice = '₹16,000',
    this.duration = 'for 2 nights',
    this.dateRange = '24 Apr - 26 Apr',
    this.guests = '8 guests',
  });

  @override
  State<BottomBookingBar> createState() => _BottomBookingBarState();
}

class _BottomBookingBarState extends State<BottomBookingBar> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 11),
            decoration: BoxDecoration(color: Color(0xFF2D5016)),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.card_giftcard, color: Colors.white, size: 17),
                const SizedBox(width: 8),
                Text(
                  'Book now & Unlock exclusive rewards!',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${widget.originalPrice} ',
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                              decorationThickness: 1.5,
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            widget.discountedPrice,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            ' ${widget.duration}',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            '${widget.dateRange} | ${widget.guests} ',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline
                            ),
                            
                          ),
                          Icon(
                            Icons.edit_outlined,
                            size: 13,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTapDown: (_) => setState(() => _isButtonPressed = true),
                  onTapUp: (_) => setState(() => _isButtonPressed = false),
                  onTapCancel: () => setState(() => _isButtonPressed = false),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Reservation Successful!'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: _isButtonPressed
                          ? const Color(0xFF7D4F2E)
                          : const Color(0xFF9C663E),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: _isButtonPressed
                          ? []
                          : [
                              BoxShadow(
                                color: Color(0xFF9C663E).withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: Text(
                      'Reserve',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
