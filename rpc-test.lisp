(in-package :qxlisp)

(defun-json-rpc "echo" (param)
  (format nil "Client said: [ ~a ]" param))

(defun-json-rpc "sleep" (arg)
  (sleep (read-from-string arg)))

(defun-json-rpc "sink" ()
  (sleep 240))

(defun-json-rpc "getInteger" ()
  1)

(defun-json-rpc "getFloat" ()
  1/3)

(defun-json-rpc "getString" ()
  "Hello world")

(defun-json-rpc "getArrayInteger" ()
  (vector 1 2 3 4))

(defun-json-rpc "getArrayString" ()
  (vector "one" "two" "three" "four"))

(defun-json-rpc "getObject" ()
  (gensym))

(defun-json-rpc "getTrue" ()
  t)

(defun-json-rpc "getFalse" ()
  "false")

(defun-json-rpc "getNull" ()
  nil)

(defun-json-rpc "isInteger" (num)
  (integerp num))

(defun-json-rpc "isFloat" (num)
  (floatp num))

(defun-json-rpc "isString" (str)
  (stringp str))

(defun-json-rpc "isBoolean" (bool)
  (or (eq nil bool) (eq t bool)))

(defun-json-rpc "isArray" (array)
  (arrayp array))

(defun-json-rpc "isObject" (obj)
  (not (eq nil obj)))

(defun-json-rpc "isNull" (null)
  (eq null nil))

(defun-json-rpc "getParams" (&rest params)
  (params))

(defun-json-rpc "getParam" (&rest params)
  (first params))

(defun-json-rpc "getCurrentTimestamp" ()
  (let* ((utc (get-universal-time)))
    (multiple-value-bind
	  (second minute hour date month year day-of-week dst-p tz)
	(decode-universal-time utc)
      (pairlis '(:now :json) 
	       (list utc
		     (format nil "new Date(Date.UTC(~a,~a,~a,~a,~a,~a,~a))"
			     year month day-of-week hour minute second 0))))))