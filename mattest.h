#ifndef MATTEST
#define MATTEST

/// Opaque structure. Contains an integer value that can be accessed with
/// mattest_get_value()
struct mattest_opaque;

typedef struct mattest_opaque* mattest_handle;

/// Allocates `qty` `mattest_opaque` structures, and assigns the addresses of
/// these structures to the elements of the array pointed to by `structs`.
///
/// The structures's internal values are initialized to successive integer
/// values starting at 42.
///
/// If `qty < 0`, returns 1. Else if `structs` is NULL and `qty != 0`, returns 2.
/// Otherwise, returns 0, indicating success.
int mattest_create(struct mattest_opaque** structs, int qty);

/// Deallocates `qty` `mattest_opaque` structures, pointed to by elements of the
/// `structs` array.
///
/// If `qty < 0`, return 1. Else if `structs` is NULL and `qty != 0`, returns 2.
/// Otherwise, returns 0, indicating success.
int mattest_destroy(struct mattest_opaque** structs, int qty);

/// Returns the value contained in a `mattest_opaque` struct.
int mattest_get_value(struct mattest_opaque* opaque);

#endif // MATTEST
