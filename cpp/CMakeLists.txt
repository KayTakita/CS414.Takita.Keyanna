# Name: Keyanna Takita
# project Transactoinal Store

cmake_minimum_required(VERSION 3.16)

project(TransactionalStore)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ----- Main Program -----
add_executable(store
    src/main.cpp
    src/Store.cpp
    src/Transaction.cpp
)

target_include_directories(store PRIVATE include)

# ----- Tests -----
add_executable(store_tests
    src/test.cpp
    src/Store.cpp
    src/Transaction.cpp
)

target_include_directories(store_tests PRIVATE include)
