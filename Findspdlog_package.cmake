##
#
# Download and initialize variable spdlog_ROOT
#

IF(NOT CMAKE_BUILD_TYPE)
	MESSAGE(FATAL_ERROR "SPDLog package does not provide multi-conf support!")
ENDIF()

FIND_PACKAGE(CMLIB REQUIRED)
CMLIB_DEPENDENCY(
	URI "https://github.com/bringauto/cmake-package-tools.git"
	URI_TYPE GIT
	TYPE MODULE
)
FIND_PACKAGE(CMAKE_PACKAGE_TOOLS REQUIRED)

SET(platform_string)
CMAKE_PACKAGE_TOOLS_PLATFORM_STRING(platform_string)

SET(spdlog_url)
IF(CMAKE_BUILD_TYPE STREQUAL "Debug")
	SET(spdlog_url
		"https://github.com/bringauto/spdlog-package/releases/download/v1.8.5/libspdlogd-dev_v1.8.5_${platform_string}.zip"
	)
ELSE()
	SET(spdlog_url
		"https://github.com/bringauto/spdlog-package/releases/download/v1.8.5/libspdlog-dev_v1.8.5_${platform_string}.zip"
	)
ENDIF()

MESSAGE(STATUS "SPDLOGURL: ${spdlog_url}")
CMLIB_DEPENDENCY(
	URI "${spdlog_url}"
	TYPE ARCHIVE
	OUTPUT_PATH_VAR _spdlog_ROOT
)

SET(spdlog_ROOT "${_spdlog_ROOT}"
	CACHE STRING
	"cxxopts root directory"
	FORCE
)

UNSET(_spdlog_ROOT)
UNSET(spdlog_url)
UNSET(platform_string)
