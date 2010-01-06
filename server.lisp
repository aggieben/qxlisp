(in-package :qxlisp)

(setq *dispatch-table*
      (list #'dispatch-easy-handlers))

(define-easy-handler (qxrpc-about :uri "/qxrpc/about")
    nil ; no parameters
  (with-html
      (:htmlx
       (:body
	(:h1 "JSON-RPC Backend, Written in Common Lisp")
	"by Bit Thicket Software"))))

(define-easy-handler (qxrpc-main :uri "/qxrpc")
  nil
  (let* ((data (raw-post-data :force-text t))
	 (resp (invoke-rpc data)))
    (log-message :debug "post content: ~a" data)
    (log-message :debug "response: ~a~%" resp)
    (format nil "(~a)"  resp)))