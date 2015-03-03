clear all; close all; clc

I = imread('2018.jpg');

I2 = segment_by_clustering(I, 'rgb', 'k-means', 4);