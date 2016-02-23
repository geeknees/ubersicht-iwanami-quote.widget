command: 'curl -s "https://www.iwanami.co.jp/meigen/heute.html" -A "Mozilla/5.0" | iconv -f Shift_JIS -t UTF8'

refreshFrequency: 30000

style: """
  top: 200px
  left: 350px
  color: #fff
  font-family: -apple-system, Helvetica Neue


  .output
    padding: 5px 10px
    width: 400px
    font-size: 18px
    font-weight: lighter
	  font-smoothing: antialiased

  .author, .example, .example-meaning
    text-transform: capitalize
    font-size: 14px
  .author
    padding: 5px 10px
    text-align: right
"""

render: (output) -> """
  <div class="output">
    <div class="quote"></div>
    <div class="author"></div>
  </div>
"""

update: (output, domEl) ->
  # Define constants, and extract the juicy html.
  dom = $(domEl)
  html = jQuery.parseHTML(output)
  $html = $(html)

  dom.find('.quote').html $html.find('div#witt_frame > div.witticism')
  dom.find('.author').html $html.find('div#witt_frame > div.source > a').text()
