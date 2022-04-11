module wad;

public import wad.wadloader;
public import wad.wadreader;
public import wad.map;

struct Header {
    char[5] wadType;
    uint dirCount;
    uint dirOffset;
}

struct Directory {
    uint lumpOffset;
    uint lumpSize;
    char[9] lumpName;
}