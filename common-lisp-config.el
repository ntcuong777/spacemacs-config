;; ---------------------------------------
;; Common Lisp configurations

(setq inferior-lisp-program "sbcl")

(let* ((abcl-bin (getenv "ABCL_BIN"))
       (abcl-jar (when abcl-bin (expand-file-name "abcl.jar" abcl-bin))))
  (defvar +all-lisp-implementations+
    `((sbcl ("/opt/homebrew/bin/sbcl") :coding-system utf-8-unix)
      (qlot-sbcl ("qlot" "exec" "/opt/homebrew/bin/sbcl") :coding-system utf-8-unix)
      ;; (clisp ("/opt/homebrew/bin/clisp") :coding-system utf-8-unix)
      ;; (qlot-clisp ("qlot" "exec" "/opt/homebrew/bin/clisp") :coding-system utf-8-unix)
      (ecl ("/opt/homebrew/bin/ecl") :coding-system utf-8-unix)
      (qlot-ecl ("qlot" "exec" "/opt/homebrew/bin/ecl") :coding-system utf-8-unix)
      ;; (clasp ("/opt/homebrew/bin/clasp") :coding-system utf-8-unix)
      ;; (qlot-clasp ("qlot" "exec" "/opt/homebrew/bin/clasp") :coding-system utf-8-unix)
      ;; (ccl ("/usr/bin/arch" "-x86_64" "/usr/local/bin/ccl64") :coding-system utf-8-unix)
      ;; (qlot-ccl ("qlot" "exec" "/usr/bin/arch" "-x86_64" "/usr/local/bin/ccl64") :coding-system utf-8-unix)
      ,@(when abcl-jar
          `((abcl ("java" "-jar" ,abcl-jar) :coding-system utf-8-unix)
            (qlot-abcl ("qlot" "exec" "java" "-jar" ,abcl-jar) :coding-system utf-8-unix))))))

;; Set slime-lisp-implementations
(setq slime-lisp-implementations +all-lisp-implementations+)
