#[========================================[.rst:
# FontAwesome5Download
# --------------------
#]========================================]

cmake_minimum_required(VERSION 3.4.0)

include(ExternalProject)

#[========================================[.rst:
.. command:: font_awesome5_web_download

  Download Font Awesome Free 5.x for the WEB from GitHub release.

    font_awesome5_web_download(<target_name>
      DOWNLOAD_VERSION <version>
      DOWNLOAD_SHA256 <sha256sum>
      [OUTPUT_SOURCE_DIR <out-var>]
    )

``<target_name>``
  Target name for `ExternalProject_Add` used internal.

``DOWNLOAD_VERSION <version>``
  Font Awesome version.

``DOWNLOAD_SHA256 <sha256sum>``
  Hash of the ``fontawesome-free-<version>-web.zip``.

``OUTPUT_SOURCE_DIR <out-var>``
  Store directory path of extracted Font Awesome source.

Example
^^^^^^^

    font_awesome5_web_download(
      FontAwesome5Download
      OUTPUT_SOURCE_DIR FontAwesome5_SOURCE_DIR
      DOWNLOAD_VERSION 5.8.1
      DOWNLOAD_SHA256 7fbecc677a00d7dec4b99b9d213438a1e1034a73017c933af50471b6b79446a0
    )

    add_custom_target(CopyFontAwesome
      COMMAND "${CMAKE_COMMAND}" -E copy_directory "${FontAwesome5_SOURCE_DIR}" "${CMAKE_BINARY_DIR}/fontawesome"
      DEPENDS FontAwesome5Download
      WORKING_DIRECTORY "${FontAwesome5_SOURCE_DIR}"
      COMMENT "Copy Font-Awesome resources"
      VERBATIM
      COMMAND_EXPAND_LISTS
    )

#]========================================]
function(font_awesome5_web_download target_name)
  set(options
  )

  set(oneValueArgs
    DOWNLOAD_VERSION
    DOWNLOAD_SHA256
    OUTPUT_SOURCE_DIR
  )

  set(multiValueArgs
  )

  cmake_parse_arguments(
    FontAwesome5DownloadArgs
    "${options}"
    "${oneValueArgs}"
    "${multiValueArgs}"
    ${ARGN}
  )

  if(NOT DEFINED FontAwesome5DownloadArgs_DOWNLOAD_VERSION)
    message(FATAL_ERROR "DOWNLOAD_VERSION not defined")
  endif()

  if(("${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}" VERSION_LESS "5.0.0")
    OR ("${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}" VERSION_GREATER_EQUAL "6.0.0"))
    message(FATAL_ERROR "Unsupport DOWNLOAD_VERSION: ${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}")
  endif()

  if(NOT DEFINED FontAwesome5DownloadArgs_DOWNLOAD_SHA256)
    message(FATAL_ERROR "DOWNLOAD_SHA256 not defined")
  endif()

  set(FontAwesome5_DOWNLOAD_URL_
    "https://github.com/FortAwesome/Font-Awesome/releases/download/${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}/fontawesome-free-${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}-web.zip")

  ExternalProject_Add(
    "${target_name}"
    PREFIX "${target_name}"
    URL "${FontAwesome5_DOWNLOAD_URL_}"
    URL_HASH SHA256=${FontAwesome5DownloadArgs_DOWNLOAD_SHA256}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
  )

  if(DEFINED FontAwesome5DownloadArgs_OUTPUT_SOURCE_DIR)
    ExternalProject_Get_property("${target_name}" SOURCE_DIR)
    set(${FontAwesome5DownloadArgs_OUTPUT_SOURCE_DIR} "${SOURCE_DIR}" PARENT_SCOPE)
  endif()
endfunction()


#[========================================[.rst:
.. command:: font_awesome5_desktop_download

  Download Font Awesome Free 5.x for the Desktop from GitHub release.

    font_awesome5_desktop_download(<target_name>
      DOWNLOAD_VERSION <version>
      DOWNLOAD_SHA256 <sha256sum>
      [OUTPUT_SOURCE_DIR <out-var>]
    )

``<target_name>``
  Target name for `ExternalProject_Add` used internal.

``DOWNLOAD_VERSION <version>``
  Font Awesome version.

``DOWNLOAD_SHA256 <sha256sum>``
  Hash of the ``fontawesome-free-<version>-desktop.zip``.

``OUTPUT_SOURCE_DIR <out-var>``
  Store directory path of extracted Font Awesome source.

Example
^^^^^^^

    font_awesome5_desktop_download(
      FontAwesome5Download
      OUTPUT_SOURCE_DIR FontAwesome5_SOURCE_DIR
      DOWNLOAD_VERSION 5.8.1
      DOWNLOAD_SHA256 888f7ff14cfbd31d4ae1e59a65f1037ed0c5460ba2a9480cda1d7d454ed31e16
    )

    add_custom_target(CopyFontAwesome
      COMMAND "${CMAKE_COMMAND}" -E make_directory "${CMAKE_BINARY_DIR}/fontawesome/svgs"
      COMMAND "${CMAKE_COMMAND}" -E copy "${FontAwesome5_SOURCE_DIR}/LICENSE.txt" "${CMAKE_BINARY_DIR}/fontawesome"
      COMMAND "${CMAKE_COMMAND}" -E copy "${FontAwesome5_SOURCE_DIR}/svgs/brands/500px.svg" "${CMAKE_BINARY_DIR}/fontawesome/svgs"
      DEPENDS FontAwesome5Download
      WORKING_DIRECTORY "${FontAwesome5_SOURCE_DIR}"
      COMMENT "Copy Font-Awesome resources"
      VERBATIM
      COMMAND_EXPAND_LISTS
    )

#]========================================]
function(font_awesome5_desktop_download target_name)
  set(options
  )

  set(oneValueArgs
    DOWNLOAD_VERSION
    DOWNLOAD_SHA256
    OUTPUT_SOURCE_DIR
  )

  set(multiValueArgs
  )

  cmake_parse_arguments(
    FontAwesome5DownloadArgs
    "${options}"
    "${oneValueArgs}"
    "${multiValueArgs}"
    ${ARGN}
  )

  if(NOT DEFINED FontAwesome5DownloadArgs_DOWNLOAD_VERSION)
    message(FATAL_ERROR "DOWNLOAD_VERSION not defined")
  endif()

  if(("${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}" VERSION_LESS "5.0.0")
    OR ("${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}" VERSION_GREATER_EQUAL "6.0.0"))
    message(FATAL_ERROR "Unsupport DOWNLOAD_VERSION: ${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}")
  endif()

  if(NOT DEFINED FontAwesome5DownloadArgs_DOWNLOAD_SHA256)
    message(FATAL_ERROR "DOWNLOAD_SHA256 not defined")
  endif()

  set(FontAwesome5_DOWNLOAD_URL_
    "https://github.com/FortAwesome/Font-Awesome/releases/download/${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}/fontawesome-free-${FontAwesome5DownloadArgs_DOWNLOAD_VERSION}-desktop.zip")

  ExternalProject_Add(
    "${target_name}"
    PREFIX "${target_name}"
    URL "${FontAwesome5_DOWNLOAD_URL_}"
    URL_HASH SHA256=${FontAwesome5DownloadArgs_DOWNLOAD_SHA256}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
  )

  if(DEFINED FontAwesome5DownloadArgs_OUTPUT_SOURCE_DIR)
    ExternalProject_Get_property("${target_name}" SOURCE_DIR)
    set(${FontAwesome5DownloadArgs_OUTPUT_SOURCE_DIR} "${SOURCE_DIR}" PARENT_SCOPE)
  endif()
endfunction()
