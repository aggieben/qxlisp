(in-package :qxlisp)

(defparameter *qx-server* nil)

(defun init-qx ()
  (when (eq nil *qx-server*)  
    (setf *qx-server* (start-server :port 4242))))

(defun stop-qx ()
  (stop-server *qx-server*)
  (setf *qx-server* nil))