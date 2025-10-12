import 'package:flutter/material.dart';

class TopThreeBooks extends StatelessWidget {
  const TopThreeBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (context, index) =>
        const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final isFirst = index == 0;
          return Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: [
                  // 🖼️ Top half - image (50%)
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      isFirst
                          ? "assets/images/book_1.png"
                          : "assets/images/book_2.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  // ⚫ Bottom half - black info section (50%)
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Classics',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isFirst
                                ? 'The Picture of Dorian Gray'
                                : 'The Catcher in the Rye',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            isFirst ? 'Oscar Wilde' : 'J.D. Salinger',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            isFirst ? '\$25.00' : '\$30.00',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
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
          );
        },
      ),
    );
  }
}
