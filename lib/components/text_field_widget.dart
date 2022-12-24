import 'package:flutter/material.dart';

class FieldTextWidget extends StatelessWidget {
  const FieldTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 0),
                          Row(
                            children: [
                              Text(
                                'Filtrar',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.restart_alt,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Gênero',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(Icons.menu_rounded),
        )
      ],
    );
  }
}
