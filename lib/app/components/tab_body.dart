import 'package:flutter/material.dart';
import 'package:prout_digital_labs/app/models/pokemon_detail.dart';
import 'package:prout_digital_labs/utils/global.dart';

class TabBody extends StatelessWidget {
  final PokemonDetail data;
  const TabBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const TabBar(
            tabs: [
              Tab(
                text: 'About',
              ),
              Tab(
                text: 'Base Stats',
              ),
              Tab(
                text: 'Evolution',
              ),
              Tab(
                text: 'Moves',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Your content for the 'Art' tab goes here
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Row(children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(
                          title: 'Species',
                        ),
                        TextTitle(
                          title: 'Height',
                        ),
                        TextTitle(
                          title: 'Weight',
                        ),
                        TextTitle(
                          title: 'Abilities',
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(
                          title: data.species != null
                              ? capitalizeWords(data.species!.name!)
                              : '',
                          bold: true,
                        ),
                        TextTitle(
                          title: '${data.height! / 10} cm',
                          bold: true,
                        ),
                        TextTitle(
                          title: '${data.weight! / 10} kg',
                          bold: true,
                        ),
                        Row(
                          children: [
                            for (var item in data.abilities ?? [])
                              TextTitle(
                                title:
                                    capitalizeWords(item.ability.name) + ', ',
                                bold: true,
                              )
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),

                Container(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: SingleChildScrollView(
                      child: Table(
                        children: [
                          for (var item in data.stats ?? [])
                            TableRow(
                              children: [
                                TableCell(
                                  child: TextTitle(
                                    title: capitalizeWords(item.stat.name),
                                  ),
                                ),
                                TableCell(
                                  child: TextTitle(
                                      title: item.baseStat.toString()),
                                ),
                                TableCell(
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    borderRadius: BorderRadius.circular(10),
                                    color: getColorByNumber(item.baseStat),
                                    value: item.baseStat.toDouble() / 100,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: data.sprites != null
                      ? Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Image.network(
                              data.sprites!.backDefault!,
                              width: 80,
                            ),
                            Image.network(
                              data.sprites!.frontDefault!,
                              width: 80,
                            ),
                            Image.network(
                              data.sprites!.frontShiny!,
                              width: 80,
                            ),
                            Image.network(
                              data.sprites!.versions!.generationI!.redBlue!
                                  .frontDefault!,
                              width: 80,
                            ),
                          ],
                        )
                      : Container(),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: SingleChildScrollView(
                    child:
                        Wrap(alignment: WrapAlignment.spaceBetween, children: [
                      for (var item in data.moves ?? [])
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.only(right: 5, bottom: 10),
                          decoration: BoxDecoration(
                            color: getColor(item.move.url),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(4, 4),
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Text(
                            item.move.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ]),
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

class TextTitle extends StatelessWidget {
  final String title;
  final bool bold;
  const TextTitle({
    super.key,
    required this.title,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
