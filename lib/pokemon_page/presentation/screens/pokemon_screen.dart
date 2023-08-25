import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososstestapp/pokemon_page/presentation/bloc/pokemon_bloc/bloc.dart';
import 'package:ososstestapp/pokemon_page/presentation/bloc/pokemon_bloc/state.dart';

import '../../../di.dart';
import '../bloc/pokemon_bloc/event.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  PokemonBloc? pokemonBloc;

  @override
  void initState() {
    super.initState();
    pokemonBloc = sl<PokemonBloc>();
    pokemonBloc!.add(GetPokemonEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon page"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => pokemonBloc!,
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonLoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/pokemon_go.jpg",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.pokemonEntity!.results![index].name!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: state.pokemonEntity!.results!.length,
              );
            } else {
              return Container(
                color: Colors.blue,
              );
            }
          },
        ),
      ),
    );
  }
}
