module wad.wadloader;
import std.stdio;
import std.exception;
import std.array;
import std.string;

import wad;

class WADLoader {
public:
    this(string wadFilePath) {
        this._wadFilePath = wadFilePath;
    }

    bool loadWad() {
        if (!openAndLoad()) {
            return false;
        }

        return readDirectories();
    }

    ~this() {

    }
    

protected:
    bool openAndLoad() {
        try {
            auto _wadFile = File(_wadFilePath, "rb");
            _wadFile.seek(0, SEEK_END);
            _wadData = new ubyte[_wadFile.tell()];
            

            _wadFile.seek(0);
            _wadFile.rawRead(_wadData);
            _wadFile.close();
        } catch (ErrnoException e) {
            writeln("Error: Failed to open WAD file ", _wadFilePath);
            return false;
        }

        return true;
    }
    bool readDirectories() {
        WADReader reader = new WADReader();

        auto header = reader.readHeaderData(_wadData, 0);

        writeln(header.wadType);
        writeln(header.dirCount);
        writeln(header.dirOffset);
        writeln("");

        for (uint i = 0; i < header.dirCount; ++i) {
            auto dir = reader.readDirectoryData(_wadData, header.dirOffset + i * 16);

            _directories ~= [dir];

            writeln(dir.lumpOffset);
            writeln(dir.lumpSize);
            writeln(dir.lumpName);
            writeln();
            
        }

        return true;
    }

    int findMapIndex(Map map) {
        for (int i = 0; i < _directories.length; ++i) {
            if (_directories[i].lumpName == map.getName()) {
                return i;
            }
        }

        return -1;
    }

    bool readMapVertex(Map map) {
        int iMapIndex = findMapIndex(map);

        if (iMapIndex == -1) return false;

        iMapIndex += EMAPLUMPSINDEX.eVERTEXES;

        if (cmp(_directories[iMapIndex].lumpName, "VERTEXES") != 0) return false;
        
        int iVertexSizeInBytes = sizeof(Vertex);

        return true;
    }

    string _wadFilePath;
    ubyte[] _wadData;
    Directory[] _directories;
}