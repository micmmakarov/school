window.School ||= {}

School.handlePushStateResponse = (url, html) ->
  $(".yield").html("<div class=old-div>" + $(".yield").html() + "</div>" + html)

  history.pushState(null,"123", url)

  $(".old-div").delay(50).animate height: "0px", -> $(".old-div").remove()
  $(".old-div").fadeOut()
  School.tabFix()




School.tabFix = ->
  $(".yield dl.tabs").each ->

    #alert($('.yield dl.tabs').length);
    #Get all tabs
    tabs = $(this).children("dd").children("a")
    tabs.click (e) ->
      School.activateTab $(this)

School.activateTab = ($tab) ->
  $activeTab = $tab.closest("dl").find("a.active")
  contentLocation = $tab.attr("href") + "Tab"

  # Strip off the current url that IE adds
  contentLocation = contentLocation.replace(/^.+#/, "#")

  #Make Tab Active
  $activeTab.removeClass "active"
  $tab.addClass "active"

  #Show Tab Content
  $(contentLocation).closest(".tabs-content").children("li").hide()
  $(contentLocation).css "display", "block"

window.onpopstate = (event) ->
  loc = window.location
  #window.location.replace loc  unless window.location.hash != "" unless window.location = document.URL


  #window.location.back()
#  console.log event.target
