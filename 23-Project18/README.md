# Project 18 - Layout and Geometry

https://www.hackingwithswift.com/100/swiftui/92

Includes solutions to the [challenges](https://www.hackingwithswift.com/books/ios-swiftui/layout-and-geometry-wrap-up).

## Topics

Layout, alignment, geometry, positioning

## Challenges
With that done:

>1. Make views near the top of the scroll view fade out to 0 opacity – I would suggest starting at about 200 points from the top.
>2. Make views adjust their scale depending on their vertical position, with views near the bottom being large and views near the top being small. I would suggest going no smaller than 50% of the regular size.
>3. For a real challenge make the views change color as you scroll. For the best effect, you should create colors using the Color(hue:saturation:brightness:) initializer, feeding in varying values for the hue.

>Each of those will require a little trial and error from you to find values that work well. Regardless, you should use max() to handle the scaling so that views don’t go smaller than half their size, and use min() with the hue so that hue values don’t go beyond 1.0.

## Screenshots

<img src="https://github.com/bashubb/100-days-of-swiftUI/blob/main/23-Project18/Layout%26GeometrySnapshot.jpeg" width="40%" ><img src="https://github.com/bashubb/100-days-of-swiftUI/blob/main/23-Project18/Layout%26GeometryGif.gif" width="40%">
