;;;; -*- Mode: Lisp; Syntax: ANSI-Common-lisp; Base: 10 -*-
(defpackage #:qxlisp-asd
  (:use :cl :asdf))

(in-package :qxlisp-asd)

(defsystem qxlisp
  :name "qxlisp"
  :version "0.0.1"
  :author "Benjamin Collins"
  :description "A JSON-RPC backend for Qooxdoo"
  :components ((:file "qxlisp")
	       (:file "init"
		      :depends-on ("qxlisp"))
	       (:file "util"
		      :depends-on ("qxlisp")) 
	       (:file "server"
		      :depends-on ("qxlisp" "rpc" "rpc-test" "util"))
	       (:file "rpc"
		      :depends-on ("qxlisp"))
	       (:file "rpc-test"
		      :depends-on ("qxlisp")))
  :depends-on ("cl-json" "cl-who" "hunchentoot"))
