### Visualize package dependencies in your Dart project

*pubviz requires at least Dart v1.6.*

*Make sure you run `pub get` or `pub upgrade` in your target project directory.*

### Example

Here's an [example](http://kevmoo.github.io/pubviz/) of `pubviz` run on itself.

### Installing

Activate `pubviz`.
```
~/anypath/> pub global activate pubviz
```

### Use

If you have installed Dart v1.7+ and [modified your PATH][path], you can
run `pubviz` directly.

```
~/proj_path/> pubviz [arguments]
```

Otherwise you can use the `pub global` command.

```
~/proj_path/> pub global run pubviz [arguments]
```

### Generate and open an html file for the package on the current path.

```
~/http_package/> pubviz open
```

Should open your default browser to something like:

![sample](https://raw.github.com/kevmoo/pubviz/master/doc/sample.png)


### Print GraphViz dot format to command line for a package on a specified path.

```
~/any_path/> pubviz --format=dot print /path/to/http_package
```

You should see output something like:

```
digraph G {
  node [fontname=Helvetica];
  edge [fontname=Helvetica, fontcolor=gray];

  http [label="http
0.9.2+3",fontsize=18,style=bold,shape=box,margin="0.25,0.15"];
  http -> path [label=">=0.9.0 <2.0.0",penwidth=2];
  http -> stack_trace [label=">=0.9.1 <0.10.0",penwidth=2];
  http -> unittest [label=">=0.9.0 <0.10.0",penwidth=2,style=dashed];

  path [label="path
1.0.0",shape=box,margin="0.25,0.15",style=bold];

  stack_trace [label="stack_trace
0.9.1",shape=box,margin="0.25,0.15",style=bold];
  stack_trace -> path [label=">=1.0.0-rc.1 <2.0.0"];

  unittest [label="unittest
0.9.3",style=bold];
  unittest -> stack_trace [label=">=0.9.0 <0.10.0",color=gray];
}
```

### pubviz with no arguments prints help

```
usage: pubviz [--format=<format>] (open | print) [<package path>]

  open   Populate a temporary file with the content and open it.
  print  Print the output to stdout.

-f, --format
          [dot]             Generate a GraphViz dot file
          [html]            Wrap the GraphViz dot format in an HTML template which renders it.

-o, --[no-]flag-outdated    Check pub.dartlang.org for lasted packages and flag those that are outdated.

If <package path> is omitted, the current directory is used.```

[path]: https://www.dartlang.org/tools/pub/cmd/pub-global.html#running-a-script-from-your-path
