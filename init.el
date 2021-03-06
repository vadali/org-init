(setq warning-minimum-level :emergency)

(add-to-list 'load-path "~/org-mode/org-mode/lisp")
(add-to-list 'load-path "~/org-mode/org-mode/contrib/lisp" )

;; init.el for this setup. Must use Emacs 24
;;(org-babel-load-file
;; (expand-file-name "emacs-init.org" (file-name-directory load-file-name)))


(defvar init-source-org-file (expand-file-name "emacs-init.org" (file-name-directory load-file-name))
  "The file that our emacs initialization comes form")

(defvar init-source-el-file (expand-file-name "emacs-init.el" (file-name-directory load-file-name))
  "The file that our emacs initialization is generated into")

(if (file-exists-p init-source-org-file)
  (if (and (file-exists-p init-source-el-file)
           (time-less-p (nth 5 (file-attributes init-source-org-file)) (nth 5 (file-attributes init-source-el-file))))
      (load-file init-source-el-file)
    (if (fboundp 'org-babel-load-file) ; ' disqus syntax highlighting is lame
        (org-babel-load-file init-source-org-file)
      (message "Function not found: org-babel-load-file")
      (load-file init-source-el-file)))
  (error "Init org file '%s' missing." init-source-org-file))
