# Autogenerated wrapper script for Librsvg_jll for i686-linux-musl
export librsvg, libpixbufloader_svg, rsvg_convert

using gdk_pixbuf_jll
using Pango_jll
using Libcroco_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `librsvg`
const librsvg_splitpath = ["lib", "librsvg-2.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
librsvg_path = ""

# librsvg-specific global declaration
# This will be filled out by __init__()
librsvg_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const librsvg = "librsvg-2.so.2"


# Relative path to `libpixbufloader_svg`
const libpixbufloader_svg_splitpath = ["lib", "gdk-pixbuf-2.0", "2.10.0", "loaders", "libpixbufloader-svg.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpixbufloader_svg_path = ""

# libpixbufloader_svg-specific global declaration
# This will be filled out by __init__()
libpixbufloader_svg = ""


# Relative path to `rsvg_convert`
const rsvg_convert_splitpath = ["bin", "rsvg-convert"]

# This will be filled out by __init__() for all products, as it must be done at runtime
rsvg_convert_path = ""

# rsvg_convert-specific global declaration
function rsvg_convert(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(rsvg_convert_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Librsvg")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (gdk_pixbuf_jll.PATH_list, Pango_jll.PATH_list, Libcroco_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (gdk_pixbuf_jll.LIBPATH_list, Pango_jll.LIBPATH_list, Libcroco_jll.LIBPATH_list,))

    global librsvg_path = normpath(joinpath(artifact_dir, librsvg_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global librsvg_handle = dlopen(librsvg_path)
    push!(LIBPATH_list, dirname(librsvg_path))

    global libpixbufloader_svg_path = normpath(joinpath(artifact_dir, libpixbufloader_svg_splitpath...))

    global libpixbufloader_svg = libpixbufloader_svg_path
    global rsvg_convert_path = normpath(joinpath(artifact_dir, rsvg_convert_splitpath...))

    push!(PATH_list, dirname(rsvg_convert_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

