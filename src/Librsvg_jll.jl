# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Librsvg_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Librsvg")
JLLWrappers.@generate_main_file("Librsvg", UUID("925c91fb-5dd6-59dd-8e8c-345e74382d89"))
end  # module Librsvg_jll
