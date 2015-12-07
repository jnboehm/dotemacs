(package-initialize)
(require 'bytecomp)
;; for customized vars, mostly done by some of Emacs' modes
(setq custom-file "~/.emacs.d/custom.el")
(if (file-newer-than-file-p
     custom-file
     (expand-file-name (byte-compile-dest-file custom-file)))
    (byte-compile-file custom-file t)
  (load-file (expand-file-name (byte-compile-dest-file custom-file))))
(require 'ob-tangle)

;; check if the current .elc file is still the most recent one, if
;; that's not the case compile the config file and load it (and thus
;; bring it up to date).
(if (file-newer-than-file-p (concat user-emacs-directory "config.org")
                            (concat user-emacs-directory "config.elc"))
    (org-babel-load-file (concat user-emacs-directory "config.org") t)
  (load-file (concat user-emacs-directory "config.elc")))
