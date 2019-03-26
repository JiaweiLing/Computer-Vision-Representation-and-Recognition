function [img1] = myImageFilter(img0, h)
[h_row, h_col] = size(h);
M = floor(h_row / 2);
N = floor(h_col / 2);
h = double(h);

[im_row, im_col] = size(img0);
img0 = double(img0);

im_pad = padarray(img0, [M, N], 'replicate', 'both');

img1 = zeros(im_row, im_col);
for r = M + 1 : M + im_row
    for c = N + 1 : N + im_col
        value = 0;
        for k = -M : M
            for l = -N : N
                value = value + h(k + M + 1, l + N + 1) * im_pad(r - k, c - l);
            end
        end
        img1(r - M, c - N) = value;
    end
end