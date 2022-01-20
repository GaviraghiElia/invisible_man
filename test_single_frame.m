clear;
close all;
load("Data\classifier_arcobaleno.mat");
%background = im2double(imread("Frame\3_sfondo.jpg"));
tic;
frame = imread("Frame\5_frame_redmi.png");    
gt = imread("Frame\5_frame_redmi_gt.png") > 0;

% resize
[r, c, ch] = size(frame);
r = floor(r/2);
c = floor(c/2);

frame = imresize(frame, [r, c]);
gt = imresize(gt, [r,c]);
%background = imresize(background, [r, c]);
gt = gt(:, :, 1);

predicted = processFrame(frame, r, c, "awb", "contrast", "hard", bayes_AV, bayes_YCr);

show_result(frame, predicted, "Finale");
toc;
%se c'è la groundtruth
cm = confmat(gt, predicted)
cm.cm

