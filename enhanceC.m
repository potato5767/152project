function out = enhanceC(gray)
    %adaptive hist equalization
    contrast = adapthisteq(gray, 'ClipLimit', 0.02, 'NumTiles', [8 8]);
    %skip sharpning and only denoise
    out = imgaussfilt(contrast, 1);  %sigma = 1
end