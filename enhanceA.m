function out = enhanceA(gray)
    denoised = imgaussfilt(gray, 1); %sigma = 1
    %adaptive histogram equalization
    histadapted = adapthisteq(denoised, 'ClipLimit', 0.02, 'NumTiles', [8 8]);
    %sharpening
    sharpened = imsharpen(histadapted, 'Radius', 1, 'Amount', 1.7);
    out = sharpened;
end