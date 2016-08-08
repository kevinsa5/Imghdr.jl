push!(LOAD_PATH, "/home/kevin/Imghdr")
using Imghdr.what
using Base.Test

@test Imghdr.what("test_images/test.bmp") == "bmp"
@test Imghdr.what("test_images/test.gif") == "gif"
@test Imghdr.what("test_images/test.im32") == "rast"
@test Imghdr.what("test_images/test.jpg") == "jpg"
@test Imghdr.what("test_images/test.pgm") == "pgm"
@test Imghdr.what("test_images/test.png") == "png"
@test Imghdr.what("test_images/test.ppm") == "ppm"
@test Imghdr.what("test_images/test.rgb") == "rgb"
@test Imghdr.what("test_images/test.tiff") == "tiff"

# still need xbm, pbm

println("All tests passed!")