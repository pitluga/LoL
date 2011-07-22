(defparameter *max-label-length* 30)

(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))

(defun dot-label (exp)
  (if exp
    (let ((s (write-to-string exp :pretty nil)))
      (if (> (length s) *max-label-length*)
        (concatenate 'string (subseq s 0 (- *max-label-length* 3)) "...")
        s))
    ""))

(defun nodes->dot (nodes)
  (mapc (lambda (node)
          (fresh-line)
          (princ (dot-name (car node)))
          (princ "[label=\"")
          (princ (dot-label (cdr node)))
          (princ "\"];"))
        nodes))

