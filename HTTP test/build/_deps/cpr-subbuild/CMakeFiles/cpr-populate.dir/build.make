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
CMAKE_SOURCE_DIR = "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild"

# Utility rule file for cpr-populate.

# Include the progress variables for this target.
include CMakeFiles/cpr-populate.dir/progress.make

CMakeFiles/cpr-populate: CMakeFiles/cpr-populate-complete


CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-install
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-mkdir
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-update
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-patch
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-build
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-install
CMakeFiles/cpr-populate-complete: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Completed 'cpr-populate'"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles"
	/usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles/cpr-populate-complete"
	/usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-done"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-install: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'cpr-populate'"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E echo_append
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-install"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'cpr-populate'"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-src"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/tmp"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src"
	/usr/bin/cmake -E make_directory "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp"
	/usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-mkdir"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-gitinfo.txt
cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'cpr-populate'"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps" && /usr/bin/cmake -P "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/tmp/cpr-populate-gitclone.cmake"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps" && /usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-update: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Performing update step for 'cpr-populate'"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-src" && /usr/bin/cmake -P "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/tmp/cpr-populate-gitupdate.cmake"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-patch: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'cpr-populate'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-patch"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure: cpr-populate-prefix/tmp/cpr-populate-cfgcmd.txt
cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-update
cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "No configure step for 'cpr-populate'"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E echo_append
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-build: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "No build step for 'cpr-populate'"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E echo_append
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-build"

cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-test: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir="/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "No test step for 'cpr-populate'"
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E echo_append
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-build" && /usr/bin/cmake -E touch "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-test"

cpr-populate: CMakeFiles/cpr-populate
cpr-populate: CMakeFiles/cpr-populate-complete
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-install
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-mkdir
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-download
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-update
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-patch
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-configure
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-build
cpr-populate: cpr-populate-prefix/src/cpr-populate-stamp/cpr-populate-test
cpr-populate: CMakeFiles/cpr-populate.dir/build.make

.PHONY : cpr-populate

# Rule to build all files generated by this target.
CMakeFiles/cpr-populate.dir/build: cpr-populate

.PHONY : CMakeFiles/cpr-populate.dir/build

CMakeFiles/cpr-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cpr-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cpr-populate.dir/clean

CMakeFiles/cpr-populate.dir/depend:
	cd "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild" "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/cpr-subbuild/CMakeFiles/cpr-populate.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/cpr-populate.dir/depend

