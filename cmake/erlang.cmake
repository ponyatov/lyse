file(GLOB ERL
    RELATIVE ${CMAKE_SOURCE_DIR}
    src/vm.erl
)

foreach(ERL_FILE ${ERL})
    string(REGEX REPLACE ".+\/(.+)\.erl$" "${CMAKE_SOURCE_DIR}/lib/\\1.beam"
        BEAM_FILE           ${ERL_FILE})
        list(APPEND BEAM    ${BEAM_FILE})
    add_custom_command(
        OUTPUT              ${BEAM_FILE}
        DEPENDS             ${ERL_FILE}
        WORKING_DIRECTORY   ${CMAKE_SOURCE_DIR}
        COMMAND             erlc
        ARGS                -o ${CMAKE_SOURCE_DIR}/lib ${ERL_FILE}
    )
endforeach()
