(in-package #:raw-bindings-nuklear.ffi)

(define "NK_IMPLEMENTATION")
(define "NK_INCLUDE_FIXED_TYPES")
(define "NK_INCLUDE_DEFAULT_ALLOCATOR")
(define "NK_INCLUDE_STANDARD_IO")
(define "NK_INCLUDE_VERTEX_BUFFER_OUTPUT")
(define "NK_INCLUDE_FONT_BAKING")
(define "NK_INCLUDE_DEFAULT_FONT")

(include-local (:raw-bindings-nuklear "lib" "nuklear.h"))
