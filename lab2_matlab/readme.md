# Introduction to Images in Matlab

## Setup

1.  Start the virtual machine
2.  Clone the original lab vision repository

    ```bash
    git clone https://github.com/diego0020/lab_vision.git lab_vision_orig
    ```
3.  Clone your fork from the repository

    ```bash
    git clone https://github.com/<USER>/lab_vision.git lab_vision
    ```
4.  Copy the folder lab2_matlab to your repository

    ```bash
    cp -rf lab_vision_orig/lab2_matlab lab_vision
    ```
5.  Delete the original repository from your machine

    ```bash
    rm -rf lab_vision_orig
    ```
6.  Commit changes to your repository

    ```bash
    cd lab_vision
    git status
    git add *
    git commit -m "added matlab lab"
    ```
7.  Push changes

    ```bash
    git push
    ```    
8.  Download and uncompress the sipi_images misc folder in your home folder

    ```bash
    cd ~
    scp -r vision@guitaca.uniandes.edu.co:/home/vision/sipi_images/misc.tar.gz .
    # alternative
    # wget http://sipi.usc.edu/database/misc.tar.gz
    tar -xzf misc.tar.gz
    ```    
9.  Open matlab

    ```bash
    /usr/local/MATLAB/R2014b/bin/matlab
    ```

Note: On windows you can use [github for windows](https://windows.github.com/) or [git-scm](http://git-scm.com/)

**IMPORTANT**
This file contains questions, you should write your answers here and don't forget to **commit** and **push** to
your github account.

## Working directory

The following commands can be used inside matlab, just like in bash

    -   pwd
    -   ls
    -   cd

For more file system see http://www.mathworks.com/help/matlab/file-operations.html

Note the current directory is also shown at the top of the graphical interface

1.  Change to the *misc* directory, which contains the uncompressed sipi_images
2.  List the contents of the directory

## Reading Images

The [imread](http://www.mathworks.com/help/matlab/ref/imread.html) command is used in matlab to read images. 

1.  Look at the manual page for the command
2.  Read the ``5.1.12`` image
    
    What is the dimension of the output?

    >   256x256

3.  Read the ``4.2.03`` image
    What is the dimension of the output?

    >   512x512x3

## Displaying Images

The following commands can be used for displaying images

-   [image](http://www.mathworks.com/help/matlab/ref/image.html)
-   [imshow](http://www.mathworks.com/help/images/ref/imshow.html)

1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
3.  What are the differences?

    >   Imshow displays the image in a figure window with no modification, while image displays the image with an axis on the outer border that indicates the pixel matrix

## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg
3.  Write a matlab function that takes the path of an image and converts it to jpg
	> path2JPEG

## Matlab and the shell

### Shell from Matlab

It is possible to execute bash commands from matlab by using the [system](http://www.mathworks.com/help/matlab/ref/system.html) command
or by using a [bang](http://www.mathworks.com/help/matlab/matlab_env/run-external-commands-scripts-and-programs.html)

1.  Look at the manual pages
2.  Try it (for example ``!ps``)

### Matlab from the shell

It is also possible to invoke matlab in a non interactive mode to run a script from the terminal. If the matlab
binary is on the system PATH you can do something like this

```bash
matlab -nodisplay -nosplash -r "write_jpg('boat.512.tiff'); exit"
# or
matlab -nodisplay -nosplash script.m"
```
If the command or script doesn't end in ``exit`` the matlab shell will stay open, and will block the bash script.

### Exercise

1.  Create a script for converting all tiff images to jpeg
    -   You may create a bash script that calls matlab
    -   Or a matlab script that calls bash 
    -   Or both
2.  Save this script in the matlab lab folder of your git repository
	> pathAll2JPEG.m

## Filters

### Adding noise

The [imnoise](http://www.mathworks.com/help/images/ref/imnoise.html) command can be used to add noise to images.
We can do this to simulate difficult capture conditions, and evaluate the algorithms over difficult situations.

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)
3.  Try saving noisy images as jpg, what happens?

    > The image will be saved but the resolution is much lower, compared to the .tiff image. This will make the image seem noisier, for its pixels seem to be bigger (and so it looses information).

### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html)
    and apply it with [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) 
-   To apply a median filter use the function [medfilt2](http://www.mathworks.com/help/images/ref/medfilt2.html)

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > The median filter, because it takes the median, not any extremes, and it doesn’t create new data points, it uses the existing ones.

For more on noise removal read http://www.mathworks.com/help/images/noise-removal.html

### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html).

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > As the filter gets bigger in size, there is more smoothing. When sigma is 0.5, the mean filter smoothes more than the gaussian filter, however, by making sigma larger, the smoothing done by the gaussian filter can be greater than that done by the mean filter. The mean filter blurs more the image because it places the average of all the pixels in the image to the center pixel, whilst the gaussian filter makes a weighed average, in which closer pixels weight more than pixels further away.  

### Sharpen

The [imsharpen](http://www.mathworks.com/help/images/ref/imsharpen.html) function lets us sharpen an image. 

1.  Sharp the ``5.1.12`` image. What do you notice?

    > things that were dark are now darker, and the numbers in the clock seem to be clearer, more in focus. Also, the edges are now well defined

2.  Sharp a blurred image. What do you notice?

    > The image appears less blurry, however it has less resolution than the original image. 

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Prewitt and Sobel filters are very good at detecting the objects edges in the image, however, sobel filter gives more weight to the pixels closer to the center pixel, making the edges found by the type of filter be clearer. Prewitt’s filter has the same weight on all the pixels of the border, either all are -1 or +1, even the center pixels in the top and bottom row have the same value, this will make for more fuzzy borders. In a Prewitt filter it is the same to have a border touching a corner pixel as it is to have a border right down the middle. A Sobel filter enhances those borders that go right through the middle.
Prewitt filter:
     1     1     1
     0     0     0
    -1    -1    -1

Sobel filter:
     1     2     1
     0     0     0
    -1    -2    -1

More sophisticated methods for finding edges can be found in the following pages
    -   http://www.mathworks.com/discovery/edge-detection.html
    -   http://www.mathworks.com/help/images/ref/edge.html

### More

For more filtering operations look at http://www.mathworks.com/help/images/linear-filtering.html

## Color Spaces

As seen on the section on reading image, color images are represented by matrices with 4 dimensios.
The [color](http://www.mathworks.com/help/images/color.html) matlab module contains functions for moving between
color spaces.

1.  Load the ``4.2.03.tiff`` image (Mandril).
2.  Split it into the three color channels
    
    ```matlab
    img=imread('4.2.03.tiff');
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    ```
3.  Look at the three channels simultaneusly

    ```matlab
    figure;
    subplot(2,2,1), subimage(img);
    subplot(2,2,2), subimage(r);
    subplot(2,2,3), subimage(g);
    subplot(2,2,4), subimage(b);
    ```
    
4.  Save the mosaic as a png file
    
    ```matlab
    print ('-dpng','rgb_mosaic.png');
    ```
5.  Transform the image to the following color spaces and repeat the exercise
    -   ycbcr
    -   lab
    -   hsv (use [rgb2hsv](http://www.mathworks.com/help/matlab/ref/rgb2hsv.html))

6.  Save all the mosaics in your github repository

## Pyramids

The [impyramid](http://www.mathworks.com/help/images/ref/impyramid.html) function creates gaussian pyramids from an image.

1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image
3.  At what level does the people in the picture dissappear?

    >   The people present on the picture on the left are present only in the first level of the pyramid, whilst the man on the right picture is present up to the second level. So in total they disappear at the second and third level, for the left and right picture respectively. 
    
4.  At what level does the numbers in the clock disappear?

    >   The numbers in the clock disappear at the third level. 

## Template Matching

The [norm2corrx](http://www.mathworks.com/help/images/ref/normxcorr2.htm) can be used to look for patterns in an image.

1.  Download the ``sequences.tar.gz`` file (from guitaca or sipi) and decompress it
2.  Go to the sequences directory
3.  Read the ``motion04.512.tiff`` image
4.  Use the ``imcrop`` comand to crop the train at the right side of the figure
    
    ```matlab
    [train,square] = imcrop(image);
    ```
5.  Now use [normxcorr2](http://www.mathworks.com/help/images/ref/normxcorr2.htm) to locate the train back in the image

    ```matlab
    c=normxcorr2(train,image);
    % c is correlation from -1 to 1
    [sx,sy] = size(image);
    d=floor(size(train)/2);
    dx=d(1);
    dy=d(2);
    %Remove borders from c2 to make it the same size as image
    c2=c(dx+1:sx+dx,dy+1:sy+dy);
    %lets accentuate it more
    c3=c2.^3;
    %convert it into an image from 0 to 1
    cr=0.5+0.5*c3;
    %leave the original image as the luminance channel
    y=mat2gray(image);
    %empty cb channel
    cb=0.5*ones(size(image));
    %join the three channels
    ycbcr=cat(3,y,cb,cr);
    rgb=ycbcr2rgb(ycbcr);
    imshow(rgb);
    ```
6.  Explain what the above code does

    > the first line of code corresponds to the normalised cross correlation, this will find the train in the image, the anything similar to the train would be closer to 1, center pixel most similar would be the most close to 1. In the second line of code, the size of the image ‘image’ is determined, and in the third line of code, the size of the cropped train image is divided by two and rounded down. These two last variables are used to remove the excess borders on the image (for the image generated is larger than the original image. So, this way, c2 will make the image obtained by the normalised cross correlation smaller, in order for it to be the same size as the original. c3 will make the  differences even larger, making it more noticeable where the train is located in the cross correlation map. The cr channel will then make the cross correlation map take values between 0 and 1, instead of the original -1 to 1. Y, that corresponds to the luminance, will be equal to the grayscale of the image, so that is why the Y equation is just taking the grayscale of the image ‘image’. And, the cb channel is just an image with the middle value of the cross correlation, 0.5, in every pixel. Afterwards, the three channels are joined in the YCbCr color space and transformed to the rgb color space, and it is viewed by using the imshow command.  
    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?

    > The limitations to this method are that it is bound to the size of the template, and the angulation, so it will only be a perfect match if the template is taken from the exact image.this is because only then will the cross correlation map have a value equal to one. Otherwise, there will only be numbers near 1, if the image is very much alike. 

See [here](http://www.mathworks.com/help/images/examples/registering-an-image-using-normalized-cross-correlation.html)
another example.

## End

Don't forget to commit and push your answers and images to github
