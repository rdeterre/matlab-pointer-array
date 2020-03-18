#include "stdlib.h"

#include "mattest.h"

struct mattest_opaque {
  int value;
};

int mattest_create(struct mattest_opaque **structs, int qty) {
  if (qty < 0)
    return 1;

  if (structs == NULL && qty != 0)
    return 2;

  for (int i = 0 ; i < qty; i++) {
    structs[i] = malloc(sizeof(struct mattest_opaque));
    structs[i]->value = 42 + i;
  }
  return 0;
}

int mattest_destroy(struct mattest_opaque **structs, int qty) {
  if (qty < 0)
    return 1;

  if (structs == NULL && qty != 0)
    return 2;

  for (int i = 0; i < qty; i++) {
    free(structs[i]);
  }
  return 0;
}

int mattest_get_value(struct mattest_opaque *opaque) {
  return opaque->value;
}
