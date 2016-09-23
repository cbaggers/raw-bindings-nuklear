(in-package #:raw-bindings-nuklear.ffi)

(defvar *name-mappings* nil)

(defun ffi-name-transformer (name kind &key &allow-other-keys)
  (unless *name-mappings*
    (setf *name-mappings* (make-hash-table :test #'equal)))
  (check-type name string)
  (let* ((l-name (map 'string
                      (lambda (_) (if (char= _ #\_) #\- _))
                      (string-upcase name))))
    (destructuring-bind (&optional maps-to-kind maps-to)
        (gethash l-name *name-mappings*)
      (if (and maps-to (eq kind maps-to-kind))
          (assert (equal maps-to name))
          (setf (gethash (list kind l-name) *name-mappings*) name)))
    l-name))

(defun ffi-type-transformer (type context &rest args &key &allow-other-keys)
  (declare (ignore context args))
  type)

(defun ffi-export-predicate (symbol)
  (not (find-symbol (symbol-name symbol) :cl-user)))
