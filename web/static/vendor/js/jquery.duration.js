(function($){

  $.fn.durationEntry = function(options){

    return this.each(function(){

      var $el = $(this);
      var $hours = $($el.data("duration-hours"));
      var $minutes = $($el.data("duration-minutes"));
      var $seconds = $($el.data("duration-seconds"));

      var calculator = {

        init: function(){
          this.events(calculator);
          this.updateFromTotalSeconds();
        },

        events: function(calculator){

          $el.on('change', function(e){
            calculator.updateFromTotalSeconds();
          });

          $hours.add($minutes).add($seconds).on('change', function(e){
            calculator.updateFromFields();
          });

        },

        updateFromTotalSeconds: function(){
          var duration = moment.duration(parseInt($el.val()), 'seconds');

          var hours_duration = (parseInt(duration.asHours()) > 0) ? parseInt(duration.asHours()) : "";
          $hours.val(hours_duration);

          var minutes_duration = (duration.minutes() > 0) ? duration.minutes() : "";
          $minutes.val(minutes_duration);

          var seconds_duration = (duration.seconds() > 0) ? duration.seconds() : "";
          $seconds.val(seconds_duration);
        },

        updateFromFields: function(){
          var duration = moment.duration({
            hours: $hours.val(),
            minutes: $minutes.val(),
            seconds: $seconds.val()
          })

          $el.val(duration.asSeconds());
        }

      }

      calculator.init();

    });
  };

}(jQuery));