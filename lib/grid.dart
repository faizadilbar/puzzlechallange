import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Grid extends StatelessWidget {
  Grid(this.number, this.onClick, {Key? key}) : super(key: key);
  final List<int> number;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.3,
            child: GridView.builder(
              itemCount: number.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return number[index] != 0
                    ? GestureDetector(
                        onTap: () {
                          onClick(index);
                        },
                        child: Card(
                          elevation: 10,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                number[index].toString(),
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
          const SizedBox(height: 20),
          // Add bottom text safely
          Text(
            "0 moves | 15 Tiles",
            style: GoogleFonts.roboto(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
