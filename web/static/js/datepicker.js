$(document).ready(function(){
  $('.datetime').combodate({
    minYear: 2016,
    maxYear: 2050,
    yearDescending: false,
    format: "X",
    template: "D  MMM YYYY H : mm : ss",
    smartDays: true,
    customClass: "form-control inline-block"
  })
});
