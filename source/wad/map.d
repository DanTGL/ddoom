module wad.map;

enum EMAPLUMPSINDEX
{
    eTHINGS = 1,
    eLINEDEFS,
    eSIDEDDEFS,
    eVERTEXES,
    eSEAGS,
    eSSECTORS,
    eNODES,
    eSECTORS,
    eREJECT,
    eBLOCKMAP,
    eCOUNT
}

enum ELINEDEFFLAGS
{
    eBLOCKING      = 0,
    eBLOCKMONSTERS = 1,
    eTWOSIDED      = 2,
    eDONTPEGTOP    = 4,
    eDONTPEGBOTTOM = 8,
    eSECRET        = 16,
    eSOUNDBLOCK    = 32,
    eDONTDRAW      = 64,
    eDRAW          = 128
}

struct Vertex {
    short xPos;
    short yPos;
}

struct Linedef {
    ushort startVertex;
    ushort endVertex;
    ushort flags;
    ushort lineType;
    ushort sectorTag;
    ushort rightSidedef;
    ushort leftSidedef;
}

class Map {
public:
    this(string name) {

    }

    ~this() {

    }

    string getName() {
        return _name;
    }

    void addVertex(Vertex v) {
        _vertexes ~= [v];
    }

    void addLinedef(Linedef l) {
        _linedefs ~= [l];
    }

protected:
    string _name;
    Vertex[] _vertexes;
    Linedef[] _linedefs;
}
