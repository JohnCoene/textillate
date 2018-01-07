HTMLWidgets.widget({

  name: 'textillate',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        el.innerText = x.text;
        $(function () {
	        $('#' + el.id).textillate(x.opts);
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
