# abap-advent-2019
[Advent of Code](https://adventofcode.com) 2019 - Testing

Lets do it the difficult way! In ABAP running on [NodeJS](https://nodejs.org)

## Prerequsites

NodeJS 12 installed

No ABAP system required, but a lot of patience is a prerequsite

## Commands

`npm install` to install dependencies, make sure to keep file `package.json` up to date with latest dependencies

`npm run lint` to run linter

`npm run downport` will downport the code to 702, into directory "downport"

`npm run unit` takes downported code, transpiles it, and runs unit tests

`npm test` does linting, downporting and unit testing in that sequence

`npm run input -- 01` to run day 01 with input from `/input/day01.txt`
