# logic taken from https://github.com/python-git/python/blob/master/Lib/imghdr.py

module Imghdr

    export what

    function what(filename::AbstractString)
        f = open(filename)
        header = readbytes(f, 32)
        close(f)
        return identify(header) 
    end

    function identify(header::Vector{UInt8})
        # JPEG data in JFIF format
        if header[7:10] == b"JFIF"
           return "jpg"
        end
    
        # JPEG data in Exif format
        if header[7:10] == b"Exif"
            return "jpg"
        end
    
        if header[1:8] == b"\x89PNG\r\n\x1a\n"
            return "png"
        end
    
        # GIF ('87 and '89 variants)
        if header[1:6] in (b"GIF87a", b"GIF89a")
            return "gif"
        end
    
        # TIFF (can be in Motorola or Intel byte order)
        if header[1:2] in (b"MM", b"II")
            return "tiff"
        end
    
        # SGI image library
        if header[1:2] == b"\x01\xda"
            return "rgb"
        end
    
        # PBM (portable bitmap)
        if header[1] == UInt8('P') && header[2] in b"14" && header[3] in b" \t\n\r"
            return "pbm"
        end
    
        # PGM (portable graymap)
        if header[1] == UInt8('P') && header[2] in b"25" && header[3] in b" \t\n\r"
            return "pgm"
        end
    
        # PPM (portable pixmap)
        if header[1] == UInt8('P') && header[2] in b"36" && header[3] in b" \t\n\r"
            return "ppm"
        end
    
        # Sun raster file
        if header[1:4] == b"\x59\xA6\x6A\x95"
            return "rast"
        end
    
        # X bitmap (X10 or X11)
        if header[1:8] == b"#define "
            return "xbm"
        end
    
        if header[1:2] == b"BM"
            return "bmp"
        end
    
        return ""
    end
end