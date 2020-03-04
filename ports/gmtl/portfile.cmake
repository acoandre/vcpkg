#header-only library
include(vcpkg_common_functions)

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO psyinf/gmtl
	REF 9af6355bafd50690a4876f139bc6d15cc2786349
	SHA512 4b69628b5b65e4ecb6bb4256ea760c450f898133cde83557736e2be6c781d0a56a74b53081e9c6b7952e6e13cd9ef5f90ccb76910651d3560dbaafb6b4cc9906
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    #PREFER_NINJA # Disable this option if project cannot be built with Ninja
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)
vcpkg_install_cmake()

# Delete redundant directories
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug ${CURRENT_PACKAGES_DIR}/share/doc)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/gmtl RENAME copyright)