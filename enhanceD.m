function out = enhanceD(gray)
    %histogram stretching
    stretched = imadjust(gray);
    %sharpening after
    out = imsharpen(stretched, 'Radius', 1, 'Amount', 1.5);
end