close all;
clear;
clc;

%video initialization
dronevid = "dronevid.mp4";
vidHandle = VideoReader(dronevid);

%figure initialization
figure();
frame = readFrame(vidHandle);
grayFrame = rgb2gray(frame);
outputA = enhanceA(grayFrame);
outputB = enhanceB(grayFrame);
outputC = enhanceC(grayFrame);
outputD = enhanceD(grayFrame);
outputE = enhanceE(grayFrame);

%subplot initialization
imageHandles = gobjects(1, 6);
titles = {"Original", "Method A", "Method B", "Method C", "Method D", "Method E"};
images = {grayFrame, outputA, outputB, outputC, outputD, outputE};
for i = 1:6
    subplot(2, 3, i);
    imageHandles(i) = imshow(images{i});
    title(titles{i});
end

%video playback loop
while hasFrame(vidHandle)
    frame = readFrame(vidHandle);
    grayFrame = rgb2gray(frame);
    %handling all methods processing
    outputA = enhanceA(grayFrame);
    outputB = enhanceB(grayFrame);
    outputC = enhanceC(grayFrame);
    outputD = enhanceD(grayFrame);
    outputE = enhanceE(grayFrame);
    %updating handles
    updatedImages = {grayFrame, outputA, outputB, outputC, outputD, outputE};
    %refreshing frames
    for i = 1:6
        set(imageHandles(i), 'CData', updatedImages{i});
    end
    pause(1);  %limiting to 1 fps
end