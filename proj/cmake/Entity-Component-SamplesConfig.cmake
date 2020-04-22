if(NOT TARGET Entity-Component-Samples)
    get_filename_component(Entity-Component-Samples_PROJECT_ROOT "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE)
    get_filename_component(CINDER_PATH "${Entity-Component-Samples_PROJECT_ROOT}/../.." ABSOLUTE)

    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
        "${Entity-Component-Samples_PROJECT_ROOT}/src/entityx/entityx/Entity.cc"
        "${Entity-Component-Samples_PROJECT_ROOT}/src/entityx/entityx/Event.cc"
        "${Entity-Component-Samples_PROJECT_ROOT}/src/entityx/entityx/System.cc"
        "${Entity-Component-Samples_PROJECT_ROOT}/src/soso/BehaviorSystem.cpp"
        "${Entity-Component-Samples_PROJECT_ROOT}/src/soso/ExpiresSystem.cpp"
        "${Entity-Component-Samples_PROJECT_ROOT}/src/soso/TransformSystem.cpp"
        "${Entity-Component-Samples_PROJECT_ROOT}/src/soso/VerietPhysicsSystem.cpp"
    )

    add_library(Entity-Component-Samples ${SOURCE_LIST})

    target_include_directories(Entity-Component-Samples PUBLIC "${Entity-Component-Samples_PROJECT_ROOT}/src")
    target_include_directories(Entity-Component-Samples PUBLIC "${CINDER_PATH}/include")

    if(NOT TARGET cinder)
        include("${CINDER_PATH}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
            "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
            "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(Entity-Component-Samples PRIVATE cinder)
    
endif()