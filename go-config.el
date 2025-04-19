;; ---------------------------------------
;; Go configurations

(defun go-mode-setup ()
  ;; Can use `M-x compile' to compile go code
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  ;; (go-eldoc-setup)
  (setq gofmt-command "goimports")                ; for auto-update imports
  (add-hook 'before-save-hook 'gofmt-before-save) ; for auto-formatting
  ;; godef-jump was originally bound to `M-*', rebound to `M-.'
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-mode-setup)
