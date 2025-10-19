import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String originalTitle;
  final String releaseDate;
  final int pages;
  final String description;
  final String cover;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.pages,
    required this.description,
    required this.cover,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Classics"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.originalTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.cover,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 20),
                // Book Details
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Author : ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: "J.K Rowling"),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Category : ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: "Children's"),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Pages : ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              TextSpan(text: '${widget.pages}'),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Release Date: ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: widget.releaseDate,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 18),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(widget.description),
          ],
        ),
      ),
    );
  }
}
