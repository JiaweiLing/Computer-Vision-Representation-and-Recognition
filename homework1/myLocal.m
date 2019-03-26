clear;
close all;

Image = imread('Lenna.png');
gray = rgb2gray(Image);
imshow(gray);
figure;
origin = gray;
M = 128;

blockRow = ceil(size(origin, 1) / M) + 1;
blockCol = ceil(size(origin, 2) / M) + 1;

hist = zeros(blockRow, blockCol, 256);

for i = 1 : size(origin, 1)
    for j = 1 : size(origin, 2)
        blockR = floor((i - 1) / M) + 1;
        blockC = floor((j - 1) / M) + 1;
        row = i - (blockR - 1) * M - 1;
        col = j - (blockC - 1) * M - 1;
        hist(blockR, blockC, origin(i, j)) =  hist(blockR, blockC, origin(i, j)) + (1 - row / M) * (1 - col / M);
        hist(blockR, blockC + 1, origin(i, j)) = hist(blockR, blockC + 1, origin(i, j)) + (1 - row / M) * (col / M);
        hist(blockR + 1, blockC + 1, origin(i, j)) = hist(blockR + 1, blockC + 1, origin(i, j)) + (row / M) * (col / M);
        hist(blockR + 1, blockC, origin(i, j)) = hist(blockR + 1, blockC, origin(i, j)) + (row / M) * (1 - col / M);
    end
end

cdf = hist;
for i = 2 : 256
    cdf(:, :, i) = cdf(:, :, i - 1) + cdf(:, :, i);
end

cdf = cdf / M;
for i = 1 : size(origin, 1)
    for j = 1 : size(origin, 2)
        blockR = floor((i - 1) / M) + 1;
        blockC = floor((j - 1) / M) + 1;
        row = i - (blockR - 1) * M - 1;
        col = j - (blockC - 1) * M - 1;
        f00 = cdf(blockR, blockC, origin(i, j));
        f01 = cdf(blockR, blockC + 1, origin(i, j));
        f10 = cdf(blockR + 1, blockC, origin(i, j));
        f11 = cdf(blockR + 1, blockC + 1, origin(i, j));
        origin(i, j) = f00 * (1 - row / M) * (1 - col / M) + f01 * (1 - row / M) * (col / M) + f10 * (row / M) * (1 - col / M) + f11 * (row / M) * (col / M);
    end
end

gray(:, :, 1) = origin;
imshow(gray);
