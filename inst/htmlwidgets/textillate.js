HTMLWidgets.widget({

  name: 'textillate',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        el.innerText = x.text;
        $('#' + el.id).textillate(x.opts);
      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});

if (HTMLWidgets.shinyMode) {

  // data = load
  Shiny.addCustomMessageHandler('txt_start',
    function(data) {
      $('#' + data.id).textillate("start");
  });

  Shiny.addCustomMessageHandler('txt_stop',
    function(data) {
      $('#' + data.id).textillate("stop");
  });

  Shiny.addCustomMessageHandler('txt_in_proxy',
    function(data) {
      $('#' + data.id).textillate("in");
  });

  Shiny.addCustomMessageHandler('txt_out_proxy',
    function(data) {
      $('#' + data.id).textillate("out");
  });

}
