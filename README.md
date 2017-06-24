# elm-present
A simple slideshow presentation app in Elm

## Overview

elm-present is a simplified slideshow app that converts static json and image files into an interactive presentation.

## Usage

Using elm-present locally is pretty simple if you have the elm tools [installed](https://guide.elm-lang.org/install.html):

1. Clone or download the code
1. Add an assets folder
1. Put your images in the assets folder
1. Add a slides/ folder inside the assets folder
1. Add a file called slide1.json in the assets/slides folder
1. Run elm-reactor
1. Open http://localhost:8000/present.elm to see your first slide!

## The Details

elm-present expects slide files to be json in this format:

    {
        "slideTitle":"Elm is Awesome",
        "slideText":"Trust Me",
        "prevSlide":"slide1.json",
        "nextSlide":"types_intro.json",
        "slideImg":"/assets/intro.gif"
    }

As you can see, each slide has a title, some text, an image, and pointers to the next slide to show and the previous slide (so you can navigate forward and back),

The title and image occupy most of the slide. The text will appear just below the image, inbetween the navigation buttons.

Note that the prevSlide and nextslide entries need to match the filenames for the json files containing info for the next slides. When you get to the last slide, just use its own filename for the nextSlide entry.

## Demo

You can view a sample presentation [here](https://dl.dropboxusercontent.com/u/12226543/elm-present/present.html)
