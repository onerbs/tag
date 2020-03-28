module tag;

import plu.tint;

/**
 * The main program.
 * Usage: tag [log|err|info|warn] msg
 * Usage:     [log|err|info|warn] msg
 */

int main(string[] argv) {

  if (argv.length == 1) return 1;

  import std.array : join, split;

  const string program = argv[0].split('/')[$-1..$][0];
  string name;
  int offset;
  if (program == "tag") {
    name = argv[1];
    offset = 2;
  } else {
    name = program;
    offset = 1;
  }

  const string message = argv[offset..$].join(" ");
  string separator = ":";
  Tint tinted = Tint(name).bold();

  switch (name) {
    case "err":  tinted.red();     break;
    case "log":  tinted.gray();    break;
    case "info": tinted.yellow();  break;
    case "warn": tinted.magenta(); break;
    case "oops":
      tinted.set("Oops!")
        .black().on_yellow()
        .italic().bold();
      separator = "";
      break;
    default: tinted.random(); break;
  }

  import std.stdio : put = writefln;
  put("  %s%s  %s", tinted, separator, message);

  return 0;

}
