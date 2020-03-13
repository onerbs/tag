module tag;

import plu.tint;

/**
 * The main program.
 * Usage: tag [log|err|info|warn] msg
 * Usage:     [log|err|info|warn] msg
 */

int main(string[] argv) {

  if (argv.length == 1) return 1;

  import std.stdio : put = writefln;
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

  const string msg = argv[offset..$].join(" ");
  Tint tint = Tint(name).bold();
  int rv = 0;

  switch (name) {
    case "err":  tint.red();     rv = 1; break;
    case "log":  tint.gray();            break;
    case "info": tint.yellow();          break;
    case "warn": tint.magenta(); rv = 1; break;
    default: break;
  }
  put("  %s: %s", tint, msg);

  return rv;

}
