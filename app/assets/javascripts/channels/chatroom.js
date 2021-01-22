// # App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
// #   connected: ->
// #     # Called when the subscription is ready for use on the server

// #   disconnected: ->
// #     # Called when the subscription has been terminated by the server

// #   received: (data) ->
// #     $('#message-container').append data.msg

(function () {
  App.chatroom = App.cable.subscriptions.create('ChatroomChannel', {
    connected: function () {},
    disconnected: function () {},
    received: function (data) {
      const input = document.getElementById('message_body');
      // const html = `
      // <div class="event">
      //   <div class="content">
      //     <div class="summary">
      //       <em>${data.username}</em>: ${data.msg}
      //     </div>
      //   </div>
      // </div>
      // `;
      input.value = '';
      return $('#message-container').append(data.msg);
    },
  });
}.call(this));
