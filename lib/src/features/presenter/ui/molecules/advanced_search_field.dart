import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class AdvancedSearchField extends StatefulWidget {
  final TextEditingController textCt;
  final Function() onEditingComplete;
  final Function(String) onChanged;
  final Function() onPressedSuffix;
  final Function(String) removeHistory;
  final Function() removeAllHistory;
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
    required this.removeHistory,
    required this.removeAllHistory,
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
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CoffeeSearchField(
              hintText: advancedHintText,
              onEditingComplete: () {
                widget.onEditingComplete();
                tappad = false;
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              onTap: () {
                setState(() {
                  tappad = true;
                });
              },
              onChanged: (value) {
                widget.onChanged(value);
                tappad = true;
                setState(() {});
              },
              prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () => Navigator.pop(context),
                  )),
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () {
                      widget.onPressedSuffix();
                      tappad = false;
                    },
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
                              tappad = false;
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.refresh_rounded,
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
                            onTap: () {
                              var history = widget.list[index];
                              widget.removeHistory(history);
                              widget.list
                                  .removeWhere((element) => element == history);
                              setState(() {});
                            },
                            size: 24,
                            icon: Icons.delete_forever_outlined,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 100,
                      child: CoffeeButtonText(
                        text: 'Limpar tudo',
                        color: ThemeService.of.backgroundIcon,
                        onPressed: () {
                          advancedHintText = 'Pesquise seus mangás favoritos';
                          widget.removeAllHistory();
                          widget.list.removeWhere((element) => true);
                          tappad = false;
                          setState(() {});
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
