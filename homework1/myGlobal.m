clear;
close all;
Image = imread('Lenna.png');
imshow(Image);
figure;
gray = rgb2gray(Image);%以灰度图的形式载入图像

[m, n] = size(gray);

table = zeros(1, 256);
for i = 0 : 255
    table(i + 1) = length(find(gray == i)) / (m * n);%计算各灰度出现的概率
end

cdf_table = zeros(1, 256);
cdf_table(1) = table(1);

for i = 2 : 256
    cdf_table(i) = cdf_table(i - 1) + table(i);%计算累积分布函数
end

imshow(gray);
figure;
bar(0 : 255, table);
figure;
bar(0 : 255, cdf_table);
%-------------计算R分量灰度出现的概率,并将新的灰度值进行填充--------------
origin = Image(:, :, 1);
p_gray = zeros(1, 256);
for i = 0 : 255
    p_gray(i + 1) = length(find(origin == i)) / (m * n);
end

p_newGray = zeros(1, 256);
s1 = zeros(1, 256);
s2 = zeros(1, 256);
temp = 0;

for i = 1 : 256
    temp = temp + p_gray(i);
    s1(i) = temp;
    s2(i) = round(s1(i) * 255);
end
for i = 1 : 256
    p_newGray(i) = sum(p_gray(find(s2 == i)));
end
newPic = origin;
for i = 0 : 255
    newPic(find(origin == i)) = s2(i + 1);
end
newRed = newPic;
%-------------计算G分量灰度出现的概率,并将新的灰度值进行填充--------------
origin = Image(:, :, 2);
p_gray = zeros(1, 256);
for i = 0 : 255
    p_gray(i + 1) = length(find(origin == i)) / (m * n);
end

p_newGray = zeros(1, 256);
s1 = zeros(1, 256);
s2 = zeros(1, 256);
temp = 0;

for i = 1 : 256
    temp = temp + p_gray(i);
    s1(i) = temp;
    s2(i) = round(s1(i) * 255);
end
for i = 1 : 256
    p_newGray(i) = sum(p_gray(find(s2 == i)));
end
newPic = origin;
for i = 0 : 255
    newPic(find(origin == i)) = s2(i + 1);
end
newGreen = newPic;
%-------------计算B分量灰度出现的概率,并将新的灰度值进行填充--------------
origin = Image(:, :, 3);
p_gray = zeros(1, 256);
for i = 0 : 255
    p_gray(i + 1) = length(find(origin == i)) / (m * n);
end

p_newGray = zeros(1, 256);
s1 = zeros(1, 256);
s2 = zeros(1, 256);
temp = 0;

for i = 1 : 256
    temp = temp + p_gray(i);
    s1(i) = temp;
    s2(i) = round(s1(i) * 255);
end
for i = 1 : 256
    p_newGray(i) = sum(p_gray(find(s2 == i)));
end
newPic = origin;
for i = 0 : 255
    newPic(find(origin == i)) = s2(i + 1);
end
newBlue = newPic;

reg = cat(3, newRed, newGreen, newBlue);
figure;
imshow(reg);
