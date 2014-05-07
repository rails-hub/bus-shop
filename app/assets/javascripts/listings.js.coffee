# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
#  $('#lead_state').parent().hide()
#  states = $('#lead_state').html()
#  $('#person_country_id').change ->
#    country = $('#leads_country :selected').text()
#    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
#    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
#    if options
#      $('#leads_state').html(options)
#      $('#leads_state').parent().show()
#    else
#      $('#leads_state').empty()
#      $('#leads_state').parent().hide()

  checkLength_e = (o, n, min, max) ->
    if o.val().length > max or o.val().length < min
      o.addClass "ui-state-error"
      $('#error-form-inquire').html("Length of " + n + " must be between " + min + " and " + max + ".")
      false
    else
      true
  checkRegexp_e = (o, regexp, n) ->
    unless regexp.test(o.val())
      o.addClass "ui-state-error"
      $('#error-form-inquire').html(n)
      false
    else
      true
  $('#inquire_submit').click (event) ->
    name = $("#inquirename")
    email = $("#inquiremail")
    comment = $("#comments")
    tips_e = $(".validateTips")
    bValid = true
    bValid = bValid and checkLength_e(name, "username", 3, 16)
    bValid = bValid and checkLength_e(email, "email", 6, 80)
    bValid = bValid and checkLength_e(comment, "Comments", 3, 80)
    bValid = bValid and checkRegexp_e(email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com")
    if bValid
      event.preventDefault();
      $('#inquire').submit();
  $("#advance_search_submit").click (event) ->
      event.preventDefault()
      $("#bus_search").submit();

  $("#country").live "change" , (event) ->
    $this = $(this)
    if $this.val() == "USA"
      $("#state_usa").show().removeAttr("disabled", "disabled")
      $("#state_canada").hide().attr("disabled", "disabled")
      $("#state_empty").hide()
    else if $this.val() == "Canada"
      $("#state_canada").show().removeAttr("disabled", "disabled")
      $("#state_usa").hide().attr("disabled", "disabled")
      $("#state_empty").hide()
    else
      $("#state_canada").hide().attr("disabled", "disabled")
      $("#state_usa").hide().attr("disabled", "disabled")
      $("#state_empty").show()
  $("#country").change()
  $(".sort_select").change (event) ->
    $("#sort-order").val($(this).val())
    $("#advanced_search_form").find("form").submit()

  $(".display_select").change (event) ->
    $("#display-number").val($(this).val())
    $("#advanced_search_form").find("form").submit()

$ ->
  updateTips = (t) ->
    tips.text(t).addClass "ui-state-highlight"
    setTimeout (-> tips.removeClass "ui-state-highlight", 1500), 500
  checkLength = (o, n, min, max) ->
    if o.val().length > max or o.val().length < min
      o.addClass "ui-state-error"
      updateTips "Length of " + n + " must be between " + min + " and " + max + "."
      false
    else
      true
  checkRegexp = (o, regexp, n) ->
    unless regexp.test(o.val())
      o.addClass "ui-state-error"
      updateTips n
      false
    else
      true
  name = $("#name")
  email = $("#email")
  friend = $("#friends_email")
  allFields = $([]).add(name).add(email).add(friend)
  tips = $(".validateTips")
  $("#dialog-form").dialog
    autoOpen: false
    height: 210
    width: 350
    modal: true
    resizable: false
    buttons:
      "Send Mail": ->
        bValid = true
        allFields.removeClass "ui-state-error"
        bValid = bValid and checkLength(name, "username", 3, 16)
        bValid = bValid and checkLength(email, "email", 6, 80)
        bValid = bValid and checkLength(friend, "Friends email", 6, 80)
        bValid = bValid and checkRegexp(name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter.")

        # From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
        bValid = bValid and checkRegexp(email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com")
        bValid = bValid and checkRegexp(friend, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com")
        if bValid
          $("#users tbody").append "<tr>" + "<td>" + name.val() + "</td>" + "<td>" + email.val() + "</td>" + "<td>" + friend.val() + "</td>" + "</tr>"
          $("#form-mail").submit()

      Cancel: ->
        $(this).dialog "close"

    close: ->
      allFields.val("").removeClass "ui-state-error"

  $("#create-user").click (event)->
    event.preventDefault()
    $("#dialog-form").dialog "open"


  $("#minyear , #maxyear").live "change" , (event) ->
    max = $("#maxyear").val()
    min = $("#minyear").val()
    $("#maxyear").val($("#minyear option:selected").val()) unless max > min