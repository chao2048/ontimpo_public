
$(function () {
  $(document).on('turbolinks:load', function () {
    function eventCalendar() {
        return $('#calendar').fullCalendar({});
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
    $(document).on('turbolinks:load', function () {
      eventCalendar();
    });
    $(document).on('turbolinks:before-cache', clearCalendar);
  });
  $('#calendar').fullCalendar({ 
    header: {
      left: 'prev,next today',
      right: 'title',
      center: 'month,agendaWeek,agendaDay'
    },buttonIcons: {
      prev: 'chevron-left',
      next: 'chevron-right'
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    events: '/events.json',
    eventClick: function(event, jsEvent, view) {
      $.getScript(event.edit_url, function() {});
    }
 });
});