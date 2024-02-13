// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:cached_network_image/cached_network_image.dart';

class ProductGridItemWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final TicketStruct? product;

  const ProductGridItemWidget({
    super.key,
    this.width,
    this.height,
    this.product,
  });

  @override
  State<ProductGridItemWidget> createState() => _ProductGridItemWidgetState();
}

class _ProductGridItemWidgetState extends State<ProductGridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Hero(
                transitionOnUserGestures: true,
                tag: widget.product?.id ?? 0,
                child: CachedNetworkImage(
                  imageUrl: "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.product?.name ?? "Sem nome",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium),
          Row(
            children: [
              Text("R\$ 500,00",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              Expanded(
                child: Container(),
              ),
              IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.black,
                  iconSize: 25,
                  onPressed: () {
                    // TODO: add product to cart
                  }),
            ],
          )
        ],
      ),
    );
  }
}
