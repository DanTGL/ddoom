module wad.wadreader;

import wad;

class WADReader {
public:

    Header readHeaderData(const ubyte[] wadData, int offset) {
        Header header;
        header.wadType = readString(wadData, 0, 4);

        header.dirCount = read4Bytes(wadData, offset + 4);
        header.dirOffset = read4Bytes(wadData, offset + 8);

        return header;
    }

    Directory readDirectoryData(const ubyte[] wadData, int offset) {
        Directory dir;
        dir.lumpOffset = read4Bytes(wadData, offset);
        dir.lumpSize = read4Bytes(wadData, offset + 4);
        dir.lumpName = readString(wadData, offset + 8, 8);

        return dir;
    }

    Vertex readVertexData(const ubyte[] wadData, int offset) {
        Vertex vertex;
        vertex.xPos = read2Bytes(wadData, offset);
        vertex.yPos = read2Bytes(wadData, offset + 2);
        return vertex;
    }

    Linedef readLinedefData(const ubyte[] wadData, int offset) {
        Linedef linedef;
        linedef.startVertex = read2Bytes(wadData, offset); 
        linedef.endVertex = read2Bytes(wadData, offset + 2);
        linedef.flags = read2Bytes(wadData, offset + 4);
        linedef.lineType = read2Bytes(wadData, offset + 6);
        linedef.sectorTag = read2Bytes(wadData, offset + 8);
        linedef.rightSidedef = read2Bytes(wadData, offset + 10);
        linedef.leftSidedef = read2Bytes(wadData, offset + 12);
        return linedef;
    }
    
    ushort read2Bytes(const ubyte[] wadData, int offset) {
        return *cast(ushort*)(wadData.ptr + offset);
    }

    uint read4Bytes(const ubyte[] wadData, int offset) {
        return *cast(uint*)(wadData.ptr + offset);
    }

    char[] readString(const ubyte[] wadData, int offset, int length) {
        char[] str = new char[length + 1];

        for (int i = 0; i < length; ++i) {
            str[i] = wadData[offset + i];
        }

        str[length] = '\0';

        return str;
    }
}