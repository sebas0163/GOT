# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.16.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(mongoose-populate NONE)

include(ExternalProject)
ExternalProject_Add(mongoose-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/cesanta/mongoose.git" "GIT_TAG" "6.18"
                    SOURCE_DIR          "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/mongoose-src"
                    BINARY_DIR          "/home/jachm/Documents/TEC/Datos-II/Proyecto III/GOT/HTTP test/build/_deps/mongoose-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
