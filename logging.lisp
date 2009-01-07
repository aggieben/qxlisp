(in-package :qxlisp)

(defparameter *log-file* (open "/tmp/qxlisp.log" 
			       :direction :output 
			       :if-exists :append
			       :if-does-not-exist :create))
(defcategory application)
(defcategory transport)
(defcategory json)

(defmacro current-function-name-log5 ()
  `(caaddr (sb-debug::backtrace-as-list)))

(defoutput function-name 
    (format nil "[~A]" (current-function-name-log5)))
(defoutput newline
    (format nil "~%"))