;;;; raw-bindings-nuklear.ffi.asd

(asdf:defsystem #:raw-bindings-nuklear
  :description "Absolute minimal bindings of Nuklear"
  :author "Chris Bagley (Baggers) <techsnuffle@gmail.com>"
  :license "BSD 2 Clause"
  :defsystem-depends-on (:cffi/c2ffi)
  :depends-on (#:cffi #:cffi/c2ffi #:cffi-libffi)
  :serial t
  :components
  ((:file "package")
   (:file "c2ffi-transforms")
   (:module "spec"
            :components
            ((:cffi/c2ffi-file
              "nuklear-with-options.h"
              :package #:raw-bindings-nuklear
              :foreign-library-name "raw-bindings-nuklear::libnuklear"
              ;;:include-sources ("/usr/include/stdint.h")
              :exclude-sources ("/usr/local/lib/clang/([^/]*)/include/(?!stddef.h)"
                                ;;"/usr/include/"
                                "/usr/include/arm-linux-gnueabihf"
                                "/usr/include/X11/")
              :ffi-name-transformer "raw-bindings-nuklear.ffi::ffi-name-transformer"
              :ffi-type-transformer "raw-bindings-nuklear.ffi::ffi-type-transformer"
              :ffi-export-predicate "raw-bindings-nuklear.ffi::ffi-export-predicate"
              :foreign-library-spec ((:unix (:or "/home/baggers/Code/lisp/raw-bindings-nuklear/libnuklear.so" "libnuklear.so" "lib/libnuklear.so"))
                                     (:windows "libnuklear.dll")
                                     (t (:default "libnuklear.so"))))))))
