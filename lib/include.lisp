(in-package :raw-bindings-nuklear.ffi)

(cffi:define-foreign-library
    (:libnuklear :search-path (asdf/system:system-relative-pathname
                        :raw-bindings-nuklear
                        #p"lib/"))
  (:darwin (:or "libnuklear.dylib"))
  (:unix (:or #+X86 "libnuklear_x86.so"
              #+X86-64 "libnuklear_x64.so"))
  (:windows (:or "libnuklear.dll"
                 #+X86 "libnuklear_x86.dll"
                 #+X86-64 "libnuklear_x64.dll")))

(cffi:use-foreign-library :libnuklear)
