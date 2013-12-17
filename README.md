# HangmanStrategy

Guessing strategy for Hangman game.

## Requirements

* MacOS X or Linux
* JRuby

### JRuby

A simple way to install JRuby is through [rbenv](http://rbenv.org) or [rvm](http://rvm.io)

## Installation

Install Bundler gem

    $ gem install bundler

And then execute:

    $ bundle

## Usage

Simply run `bin/strategy` for further instructions.

## Tests

To run tests execute:

    $ rake

## Sample results


    ---------------------------------|---------|--------------------------------------------------------
                         Secret Word |   Score |   Time:       user     system      total       real
    ---------------------------------|---------|--------------------------------------------------------
                             COMAKER |       8 |            1.470000   0.010000   1.480000 (    0.7200)
                            CUMULATE |       7 |            0.370000   0.010000   0.380000 (    0.2850)
                            ERUPTIVE |       5 |            0.470000   0.020000   0.490000 (    0.2420)
                             FACTUAL |       8 |            0.320000   0.010000   0.330000 (    0.2750)
                            MONADISM |       6 |            0.370000   0.010000   0.380000 (    0.3260)
                                 MUS |      25 |            0.040000   0.000000   0.040000 (    0.0170)
                             NAGGING |       4 |            0.290000   0.000000   0.290000 (    0.2520)
                                OSES |       3 |            0.100000   0.000000   0.100000 (    0.0560)
                          REMEMBERED |       4 |            0.290000   0.000000   0.290000 (    0.1980)
                          SPODUMENES |       5 |            0.230000   0.010000   0.240000 (    0.1950)
                       STEREOISOMERS |       2 |            0.100000   0.000000   0.100000 (    0.0920)
                              TOXICS |       9 |            0.190000   0.000000   0.190000 (    0.1660)
                         TRICHROMATS |       4 |            0.210000   0.010000   0.220000 (    0.1880)
                              TRIOSE |       8 |            0.130000   0.000000   0.130000 (    0.1110)
                           UNIFORMED |       8 |            0.290000   0.010000   0.300000 (    0.2650)
    ---------------------------------|---------|--------------------------------------------------------
                             Average |    7.07 |                                                 0.2259
                               Total |     106 |                                                 3.3880
    ---------------------------------|---------|--------------------------------------------------------

### Random 1000 words

    $ bin/strategy -r 1000

                                     |   Score |
    ---------------------------------|---------|
                             Average |    6.40 |
                               Total |    6401 |
    ---------------------------------|---------|

