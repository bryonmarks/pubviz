library pubviz.html_template;

const String TEMPLATE = r'''
<!DOCTYPE html>
<html>
  <head>
    <title>pubviz - PACKAGE_TITLE</title>
    <style type='text/css'>
      *, *:before, *:after {
        -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;
      }
      button {
        position: fixed;
        padding: 10px;
        top: 5px;
        left: 5px;
        opacity: 0.8;
      }
      html, body { margin:10px; padding:0; }
      svg {  height:100%; width:100%; }
      svg.zoom {height: inherit; width: inherit;}
    </style>
  </head>
  <body>
    <button onclick='zoomClick();'>Zoom</button>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script>
    <script src="http://kevmoo.github.io/pubviz/viz.js"></script>
    <script type="text/vnd.graphviz" id="dot">
DOT_HERE
    </script>
    <script>

      function zoomClick() {
        var attr = $('svg').attr('class');
        var attr = (attr == 'zoom') ? '' : 'zoom';
        $('svg').attr('class', attr);
      };

      function inspect(s) {
        return "<pre>" + s.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\"/g, "&quot;") + "</pre>"
      }

      function src(id) {
        return document.getElementById(id).innerHTML;
      }

      function example(id) {
        var result;
        try {
          return Viz(src(id), 'svg');
        } catch(e) {
          return inspect(e.toString());
        }
      }

      document.body.innerHTML += example("dot");
    </script>
  </body>
</html>
''';
