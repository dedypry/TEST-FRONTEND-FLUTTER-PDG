import 'package:flutter/material.dart';
import 'package:prout_digital_labs/app/models/pokemon_detail.dart';
import 'package:prout_digital_labs/utils/global.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.item,
    required this.id,
  });

  final PokemonDetail item;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.forms != null && item.forms!.isNotEmpty)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  capitalizeWords(item.forms![0].name!),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '#' + formatDigit(int.parse(id!)),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              for (var item in item.types ?? [])
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.type.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
