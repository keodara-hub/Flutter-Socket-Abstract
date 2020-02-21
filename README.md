# SocketAbstract

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
# Flutter-Socket-Abstract
# Installing 
socket_abstract:
    git:
      url: git://github.com/keodara-hub/Flutter-Socket-Abstract.git
      ref: master
# Usage:
    - Need to override init function
    - After override adding listen 
    ```dart
    void init(String token) {
    socket = IO.io(BaseUrl.socketUrl + token, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('connect', (_) {
      this.logger('Connected');
      changedSocketStatus(SocketStatus.Connected);
    });
    socket.on('disconnect', (_) {
      this.logger('Disconnected');
      changedSocketStatus(SocketStatus.Discounted);
    });

    socket.on('error', (data) {
      changedSocketError(data);
      this.logger(data);
    });

    socket.on('reconnecting', (_) {
      this.logger('Reconnecting');
      changedSocketStatus(SocketStatus.Reconnecting);
    });
    socket.on('connect_error', (_) {
      this.logger('ConnectError');
      changedSocketStatus(SocketStatus.ConnectError);
    });
    socket.on('reconnect_failed', (_) {
      this.logger('ReconnectFailed');
      changedSocketStatus(SocketStatus.ReconnectFailed);
    });
  }
    ```

