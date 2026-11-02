# Assignment 6: TidyTuesday Ocean Data

### Oscar Schuckel-Bailey. November 1st, 2026

## 

#### Overview:

In this assignment I modeled average temperatures collected across multiple deployments over a time series. It was focused on how to use ggplot2 functions to model the data, and then subsets of that data in different ways. The core goal was to learn how to modify individual elements of a graph (its axes, colours, and how to add additional elements).

### Graph 1.

\![An improved version of the ggplot done in class. Added X and Y axis names, title, and subtitle. Note: The plot is difficult to interpret partially because the Y axis is time, and the units of time are not intuitive to interpret. My output looks like the following because the instructions did not specify which axes variables were supposed to be on, and that is the code that I had written down from class, which I do believe to be correct.](images/assignment_6_plot1.png_)

### Graph 2.

\![A modified version of the previous plot. Core changes include: Only a single deployment is being measured (I chose 7), x and y axes were swapped (now time is on the x axis), colour of the line is now cyan. The biggest difficulty I had was in figuring out how to change the colour of the chart, the fix ended up being moving my colour = "cyan" code outside of the aes parentheses.](images/assignment_6_plot2.png)

### Graph 3.

![For this plot I measured the third deployment (depl_03). The primary differences in this new plot was the easy change of swapping to red rather than cyan, and the (not so easy) addition of standard deviation lines. To accomplish this, after reading the ggplot2 cheat sheet I went with geom_pointrange() which seemed like the best fitting function for this task. Figuring out how to add this feature was one of the best learning tasks I've had so far, particularly how you can explicitly declare the internal variables used in the geom_pointrange() function, you will see this in my code](images/assignment_6_plot3.png)

#### Sources:

[R: ggplot2 pointrange example - Stack Overflow](https://stackoverflow.com/questions/41850568/r-ggplot2-pointrange-example)

[TidyTuesday Data Source Github Repo](https://github.com/rfordatascience/tidytuesday/blob/main/static/tt_logo.png)
