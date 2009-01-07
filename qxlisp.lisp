(declaim (optimize (debug 3)))

(defpackage :qxlisp
  (:use :cl-who :hunchentoot :json :json-rpc :sb-thread :cl)
  (:export :start-server))

