import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jump_cardo/game/juan_run.dart';
import '/widgets/hud.dart';
import '/widgets/settings_menu.dart';

// This represents the main menu overlay.
class MainMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'MainMenu';

  // Reference to parent game.
  final JuanRun game;

  const MainMenu(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black.withAlpha(100),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  const Text(
                    'Juan Run',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      game.startGamePlay();
                      game.overlays.remove(MainMenu.id);
                      game.overlays.add(Hud.id);
                    },
                    child: const Text(
                      'Play',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      game.overlays.remove(MainMenu.id);
                      game.overlays.add(SettingsMenu.id);
                    },
                    child: const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
