import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class AdvancedSearchField extends StatefulWidget {
  final TextEditingController textCt;
  final Function() onEditingComplete;
  final Function(String) onChanged;
  final Function() onPressedSuffix;
  final int maxHistoryQty;
  final List<String> list;
  const AdvancedSearchField({
    Key? key,
    required this.textCt,
    this.maxHistoryQty = 7,
    required this.list,
    required this.onEditingComplete,
    required this.onChanged,
    required this.onPressedSuffix,
  }) : super(key: key);

  @override
  State<AdvancedSearchField> createState() => _AdvancedSearchFieldState();
}

class _AdvancedSearchFieldState extends State<AdvancedSearchField> {
  bool tappad = false;
  String advancedHintText = 'Pesquise seus mangás favoritos';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeService.of.selectColor,
        borderRadius: ThemeService.of.borderRadius,
      ),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            NewCoffeeSearchField(
              hintText: advancedHintText,
              // TODO: QUANDO PESQUISAR, TAPPAD = FALSE

              onEditingComplete: widget.onEditingComplete,
              onTap: () {
                setState(() {
                  tappad = true;
                });
              },
              onChanged: widget.onChanged,
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: widget.onPressedSuffix,
                  )),
              controller: widget.textCt,
            ),
            Visibility(
              visible: tappad && widget.list.isNotEmpty,
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.list.length <= widget.maxHistoryQty
                        ? widget.list.length
                        : widget.maxHistoryQty,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.textCt.text = widget.list[index];
                              widget.onEditingComplete();
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.refresh,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CoffeeText(
                                  text: widget.list[index],
                                ),
                              ],
                            ),
                          ),
                          CoffeeIconButton(
                            // TODO: REMOVER TAMBÉM NO BANCO
                            onTap: () {
                              setState(() {
                                widget.list.removeAt(index);
                              });
                            },
                            size: 24,
                            icon: Icons.delete,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 80,
                      child: CoffeeButtonText(
                        text: 'Limpar',
                        color: ThemeService.of.backgroundIcon,
                        onPressed: () {
                          advancedHintText = 'Pesquise seus mangás favoritos';
                          // TODO: REMOVER TAMBÉM NO BANCO

                          setState(() {
                            widget.list.removeWhere((element) => true);
                            tappad = false;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
