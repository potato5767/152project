function out = enhanceB(gray)
    %sharpening first
    sharpened = imsharpen(gray, 'Radius', 1, 'Amount', 1.5);
    %adaptive histogram equalization
    histadapted = adapthisteq(sharpened, 'ClipLimit', 0.02, 'NumTiles', [8 8]);
    %denoise
    out = imgaussfilt(histadapted, 1);  %sigma = 1
end