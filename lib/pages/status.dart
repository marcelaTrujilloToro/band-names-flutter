import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ServerStatus: ${socketService.serverStatus}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          //  TAREA
          // emitir: emitir-mensaje
          // { nombre: 'Flutter', mensaje: 'Hola desde Flutter' }
          socketService.socket.emit(
            'emit-message',
            {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'},
          );
        },
      ),
    );
  }
}
