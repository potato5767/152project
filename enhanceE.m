function out = enhanceE(gray)
    %median filtering
    denoised = medfilt2(gray, [3 3]);
    %sharpening
    out = imsharpen(denoised, 'Radius', 1, 'Amount', 1.5);
end