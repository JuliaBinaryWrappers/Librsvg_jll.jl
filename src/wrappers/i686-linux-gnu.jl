# Autogenerated wrapper script for Librsvg_jll for i686-linux-gnu
export libpixbufloader_svg, librsvg, rsvg_convert

using gdk_pixbuf_jll
using Pango_jll
using Libcroco_jll
JLLWrappers.@generate_wrapper_header("Librsvg")
JLLWrappers.@declare_file_product(libpixbufloader_svg)
JLLWrappers.@declare_library_product(librsvg, "librsvg-2.so.2")
JLLWrappers.@declare_executable_product(rsvg_convert)
function __init__()
    JLLWrappers.@generate_init_header(gdk_pixbuf_jll, Pango_jll, Libcroco_jll)
    JLLWrappers.@init_file_product(
        libpixbufloader_svg,
        "lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so",
    )

    JLLWrappers.@init_library_product(
        librsvg,
        "lib/librsvg-2.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        rsvg_convert,
        "bin/rsvg-convert",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
