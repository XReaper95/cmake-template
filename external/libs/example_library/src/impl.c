#include "hello.h"

#include <stdio.h>

void external_library_function(void) {
    printf("Hello from the example external library!\n");

#if defined(EXTERNAL_LIBRARY_FEATURE)
    printf("External library was compiled with a cool feature!\n");
#endif
}
