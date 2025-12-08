// import 'dart:async';
// import 'dart:developer';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketService {
//   static final SocketService _instance = SocketService._internal();
//   factory SocketService() => _instance;
//   SocketService._internal();

//   IO.Socket? _socket;
//   String? _lastMessageId;
//   int? chatId;

//   // final _messageResponse = StreamController<Message>.broadcast();
//   // Stream<Message> get messageResponse => _messageResponse.stream;

//   // Function(Message) get addMessageResponse => _messageResponse.sink.add;

//   // final _isTypingResponse = StreamController<bool>.broadcast();
//   // Stream<bool> get isTypingResponse => _isTypingResponse.stream;

//   // Function(bool) get addTypingResponse => _isTypingResponse.sink.add;

//   /// Initialize socket connection
//   void connect({required String token, required int chatId}) {
//     this.chatId = chatId;

//     log("🔌 Attempting connection with token: ${token.substring(0, 10)}...");

//     _socket = IO.io(
//       "http://82.25.101.221:8004",
//       IO.OptionBuilder()
//           .setTransports(['websocket', 'polling'])
//           .enableReconnection()
//           .enableAutoConnect()
//           .setAuth({'token': token})
//           .setExtraHeaders({'token': token})
//           .setTimeout(30000)
//           .setReconnectionDelay(1000)
//           .build(),
//     );

//     _socket?.onConnect((_) {
//       log("✅ Socket connected - ID: ${_socket?.id}");
//       joinChat(chatId);
//       _syncMissedMessages(chatId);
//     });

//     _socket?.onDisconnect((reason) {
//       log("❌ Socket disconnected - Reason: $reason");
//     });

//     _socket?.onConnectError((data) {
//       log("🔴 Connection Error: $data");
//     });

//     _socket?.onError((data) {
//       log("🔴 Socket Error: $data");
//     });

//     // Listen for server errors
//     _socket?.on("error", (data) {
//       log("🔴 Server Error Event: $data");
//     });

//     _socket?.on("unauthorized", (data) {
//       log("🔴 Unauthorized: $data");
//     });

//     _socket?.on("new_message", (data) {
//       log("📩 New message: $data");
//       // addMessageResponse.call(
//       //   Message.fromJson(data["message"] as Map<String, dynamic>),
//       // );

//       _lastMessageId = data['id'].toString();
//     });

//     _socket?.on("message_deleted", (data) {
//       log("🗑️ Message deleted: $data");
//     });

//     _socket?.on("message_updated", (data) {
//       log("✏️ Message updated: $data");
//     });

//     _socket?.on("user_joined", (data) {
//       log("👋 User joined: $data");
//     });

//     _socket?.on("user_left", (data) {
//       log("👋 User left: $data");
//     });

//     _socket?.on("typing_update", (data) {
//       log("⌨️ Typing update: $data");
//     });
//   }

//   /// Join a specific chat room
//   void joinChat(int chatId) {
//     if (_socket?.connected ?? false) {
//       // ✅ FIXED: Use "join_chat" with "thread_id"
//       _socket?.emit("join_chat", {"thread_id": chatId});
//       log("➡️ Joined chat room $chatId");
//     } else {
//       log("⚠️ Cannot join - socket not connected");
//     }
//   }

//   /// Leave a specific chat room
//   void leaveChat(int chatId) {
//     if (_socket?.connected ?? false) {
//       _socket?.emit("leave_chat", {"thread_id": chatId});
//       log("⬅️ Left chat room $chatId");
//     }
//   }

//   bool isConnected() {
//     return _socket?.connected ?? false;
//   }

//   /// Send typing indicator
//   void sendTypingIndicator(int threadId, bool isTyping) {
//     if (_socket?.connected ?? false) {
//       _socket?.emit("typing", {"thread_id": threadId, "is_typing": isTyping});
//     }
//   }

//   Future<void> _syncMissedMessages(int chatId) async {
//     if (_lastMessageId == null) return;

//     try {
//       // Example: GET /chats/:id/messages?after=lastMessageId
//       // Replace with Dio in your project
//       log("🔄 Syncing messages after $_lastMessageId for chat $chatId");

//       // final res = await Dio().get(
//       //   "https://your-backend.com/chats/$chatId/messages",
//       //   queryParameters: {"after": _lastMessageId},
//       // );

//       // TODO: merge res.data['messages'] into your state, avoiding duplicates
//     } catch (e) {
//       log("⚠️ Sync failed: $e");
//     }
//   }

//   /// Disconnect socket
//   void disconnect() {
//     if (chatId != null) {
//       leaveChat(chatId!);
//     }
//     _socket?.disconnect();
//     _socket?.dispose();
//     log("🔌 Socket disconnected manually");
//   }
// }
