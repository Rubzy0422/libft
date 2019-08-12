import argparse
import math
import sys

def main():
  parser = argparse.ArgumentParser(description=__doc__)
  parser.add_argument("--stepno", type=int, required=True)
  parser.add_argument("--nsteps", type=int, required=True)
  parser.add_argument("remainder", nargs=argparse.REMAINDER)
  args = parser.parse_args()

  nchars = int(math.log(args.nsteps, 10)) + 1
  fmt_str = '\x1b[6;30;32m' +"[{:6.2f}%]".replace("X", str(nchars)) + '\x1b[0m'
  progress = 100 * args.stepno / args.nsteps
  sys.stdout.write(fmt_str.format(args.stepno, args.nsteps, progress))
  for item in args.remainder:
    sys.stdout.write("\t")
    sys.stdout.write(item)
  sys.stdout.write("\n")

if __name__ == "__main__":
  main()