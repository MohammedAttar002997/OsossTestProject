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
    return BlocProvider(
      create: (context) => pokemonBloc!,
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Pokemon page"),
                centerTitle: true,
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.pokemonEntity!.results![index].name!),
                    style: ListTileStyle.list,
                    contentPadding: const EdgeInsets.all(5.0),
                    leading: Placeholder(
                      child: Image.asset(
                        "images/pokemon.png",
                        fit: BoxFit.cover,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    subtitle: Text(state.pokemonEntity!.results![index].url!),
                  );
                },
                itemCount: state.pokemonEntity!.results!.length,
              ),
            );
          } else {
            return Container(
              color: Colors.blue,
            );
          }
        },
      ),
    );
  }
}
