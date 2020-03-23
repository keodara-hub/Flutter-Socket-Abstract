library socket_abstract;

import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum SocketStatus {
  Connected,
  Discounted,
  Reconnecting,
  ConnectError,
  ReconnectFailed,
  AlreadyLogin,
  SessionError
}

abstract class SocketAbstract {
  IO.Socket socket;

  void init(String token);

  // Connection status of socket
  BehaviorSubject<SocketStatus> _statusSubject =
      BehaviorSubject<SocketStatus>();

  // Socket on error connection
  final _errorSocketSubject = PublishSubject();

  /// Connection status of socket
  BehaviorSubject<SocketStatus> get onConnectStatus => _statusSubject.stream;

  /// Change connection status stream
  Function(SocketStatus) get changedSocketStatus => _statusSubject.sink.add;

  /// Connection of status
  bool get isConnected => _statusSubject.value == SocketStatus.Connected;

  // Stream for recieve error
  Function(SocketStatus) get changedSocketError => _errorSocketSubject.sink.add;

  /// Message status code
  PublishSubject get onSocketErrorMessage => _errorSocketSubject.stream;

  close() {
    _statusSubject?.close();
    _errorSocketSubject.close();
  }

  void disconnect() {
    socket.disconnect();
  }

  void connect() {
    socket.connect();
  }

  void destroy() {
    socket.destroy();
  }

  void dispose();
}
