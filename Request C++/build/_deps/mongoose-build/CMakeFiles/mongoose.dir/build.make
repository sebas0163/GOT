# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build"

# Include any dependencies generated for this target.
include _deps/mongoose-build/CMakeFiles/mongoose.dir/depend.make

# Include the progress variables for this target.
include _deps/mongoose-build/CMakeFiles/mongoose.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/mongoose-build/CMakeFiles/mongoose.dir/flags.make

_deps/mongoose-build/CMakeFiles/mongoose.dir/mongoose.c.o: _deps/mongoose-build/CMakeFiles/mongoose.dir/flags.make
_deps/mongoose-build/CMakeFiles/mongoose.dir/mongoose.c.o: _deps/mongoose-src/mongoose.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object _deps/mongoose-build/CMakeFiles/mongoose.dir/mongoose.c.o"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" && /bin/gcc-9 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mongoose.dir/mongoose.c.o   -c "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-src/mongoose.c"

_deps/mongoose-build/CMakeFiles/mongoose.dir/mongoose.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mongoose.dir/mongoose.c.i"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" && /bin/gcc-9 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-src/mongoose.c" > CMakeFiles/mongoose.dir/mongoose.c.i

_deps/mongoose-build/CMakeFiles/mongoose.dir/mongoose.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mongoose.dir/mongoose.c.s"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" && /bin/gcc-9 $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-src/mongoose.c" -o CMakeFiles/mongoose.dir/mongoose.c.s

# Object files for target mongoose
mongoose_OBJECTS = \
"CMakeFiles/mongoose.dir/mongoose.c.o"

# External object files for target mongoose
mongoose_EXTERNAL_OBJECTS =

lib/libmongoose.a: _deps/mongoose-build/CMakeFiles/mongoose.dir/mongoose.c.o
lib/libmongoose.a: _deps/mongoose-build/CMakeFiles/mongoose.dir/build.make
lib/libmongoose.a: _deps/mongoose-build/CMakeFiles/mongoose.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../lib/libmongoose.a"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" && $(CMAKE_COMMAND) -P CMakeFiles/mongoose.dir/cmake_clean_target.cmake
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mongoose.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
_deps/mongoose-build/CMakeFiles/mongoose.dir/build: lib/libmongoose.a

.PHONY : _deps/mongoose-build/CMakeFiles/mongoose.dir/build

_deps/mongoose-build/CMakeFiles/mongoose.dir/clean:
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" && $(CMAKE_COMMAND) -P CMakeFiles/mongoose.dir/cmake_clean.cmake
.PHONY : _deps/mongoose-build/CMakeFiles/mongoose.dir/clean

_deps/mongoose-build/CMakeFiles/mongoose.dir/depend:
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-src" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/Request C++/build/_deps/mongoose-build/CMakeFiles/mongoose.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : _deps/mongoose-build/CMakeFiles/mongoose.dir/depend

