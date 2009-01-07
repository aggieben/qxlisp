(in-package :qxlisp)

(defmacro with-html (&body body)
  `(with-html-output-to-string (*standard-output* nil :prologue t :indent t)
     ,@body))

(in-package :json-rpc)

(defmacro defun-json-rpc (name lambda-list &body body)
  "Exports a lambda as a json-rpc target.  Name must be a string."
  (when (not (stringp name))
    (error "name must be a string!"))
  (let ((str "(~a"))
    (dolist (var lambda-list) 
      (setf str (concatenate 'string str " ~a")))
    (setf str (concatenate 'string str ")"))
    `(export-as-json-rpc #'(lambda ,lambda-list
			     (hunchentoot:log-message :debug ,str ,name ,@lambda-list)
			     ,@body)
			 ,name)))


(defun show-json-exports ()
  (with-hash-table-iterator (itr *json-rpc-functions*)
    (loop
	 (multiple-value-bind (entry-p key value) (itr)
	   (if entry-p
	       (format t "json-rpc[~a] => ~a~%" key value)
	       (return))))))
(in-package :qxlisp)