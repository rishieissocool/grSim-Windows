# Install script for directory: D:/grSim-master/windows/deps/vartypes-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/grSim-master/windows/deps/vartypes-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vartypes" TYPE FILE FILES
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarType.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarBlob.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarBool.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarDouble.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarExternal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarInt.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarList.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarQWidget.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarSelection.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarString.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarStringEnum.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarTrigger.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/gui/VarItem.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/gui/VarItemDelegate.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/gui/VarTreeModel.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/gui/VarTreeView.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/VarNotifier.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/VarTypes.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/VarTypesFactory.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/gui/VarTreeViewOptions.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/xml/xmlParser.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarVal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarStringVal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarIntVal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarDoubleVal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarBoolVal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/VarXML.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/VarTypesInstance.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/VarBase64.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarProtoBufferVal.h"
    "D:/grSim-master/windows/deps/vartypes-src/./vartypes/primitives/VarProtoBuffer.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/vartypes" TYPE FILE FILES
    "D:/grSim-master/windows/deps/vartypes-src/./README"
    "D:/grSim-master/windows/deps/vartypes-src/./COPYING"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/grSim-master/windows/deps/vartypes-build/Debug/vartypes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/grSim-master/windows/deps/vartypes-build/Release/vartypes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/grSim-master/windows/deps/vartypes-build/MinSizeRel/vartypes.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/grSim-master/windows/deps/vartypes-build/RelWithDebInfo/vartypes.lib")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/grSim-master/windows/deps/vartypes-build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/grSim-master/windows/deps/vartypes-build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
