(in-package :qxlisp)

(defparameter *qx-server* nil)

(defun init-qx ()
  (when (null *qx-server*)    
    (setf *qx-server* (make-instance 'acceptor :port 4242))
    (setf *message-log-pathname* "/tmp/qx.log")
    (start *qx-server*)))

(defun stop-qx ()
  (when (not (null *qx-server*))
    (stop *qx-server*)
    (setf *qx-server* nil)))