$(document).ready(function(){

  $(".duration").durationEntry();

  var calendarConf = {
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    now: '2017-07-02',
    firstDay: 1,
    nowIndicator: false,
    editable: false,
    aspectRatio: 1.8,
    scrollTime: '08:00',
    height: 450,
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'timelineDay,agendaWeek,month'
    },
    defaultView: 'timelineDay',
    views: {
      timelineDay: {
        slotDuration: '00:5'
      }
    },
    eventOverlap: false,
    resourceAreaWidth: '5%',
    resourceLabelText: 'Title'
  }

  var demandsList = new Vue({
    el: '#planner',
    mounted: function () {
      axios.get('/demands?_format=json').then(response => this.demands = response.data);
      axios.get('/intervals?_format=json').then(response => this.intervals = response.data);
    },
    data: {
      chosenDemands: [],
      demands: [],
      intervals: [],
      available: [],
      required: [],
      proposed: [],
      free: [],
      planned: [],
      skipped: []
    },
    methods: {
      setPlan: function(data) {
        this.planned = data.planned
        this.skipped = data.skipped
        this.required = data.required
        this.available = data.available
        this.proposed = data.proposed
        this.free = data.free
        calendarConf["events"] = data.events
        calendarConf["resources"] = data.resources
        $('#plan-chart').fullCalendar('destroy')
        $('#plan-chart').fullCalendar(calendarConf)
      },
      estimate: function (event) {
        axios.get('/plans/estimate', {
          params: {
            demands_ids: this.chosenDemands
          }
        }).then(response => this.setPlan(response.data));
      },
      onQtyInput: function(demand, attribute, event) {
        var csrfToken = $("meta[name='csrf-token']").attr("content");
        axios.put(
          `/demands/${demand.id}/qty`,
          { demand: { qty: demand.qty } },
          { headers: {"x-csrf-token": csrfToken, "content-type": "application/json"} }
        ).then(response =>
          demand.qty = response.data.qty
        );
        console.log(demand.id, demand.qty, event);
      }
    }
  })

});
