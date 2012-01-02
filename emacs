(autoload 'forward-whitespace "thingatpt" nil t)

(defun kill-forward-whitespace ()
  "Kill all the whitespace to the right of point"
  (interactive)
  (require 'thingatpt)  ;; defines forward-whitespace
  (let ((beg (point)))
    (forward-whitespace 1)
    (kill-region beg (point))))

;; Bind RET to py-newline-and-indent in python-mode
(add-hook 'python-mode-hook '(lambda ()
			       (define-key python-mode-map "\C-m" 'newline-and-indent)))

(setq read-file-name-completion-ignore-case t)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indicate-empty-lines t)
(setq-default indicate-unused-lines t)

(setq-default transient-mark-mode t)

(setq auto-save-default t)
(setq make-backup-files t)
(setq version-control t)
(setq delete-old-versions t)
;; Make backups no matter what!
(setq vc-make-backup-files t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(python-python-command "/usr/local/bin/python"))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#EEE")

;; Always insert spaces for tabs
(setq-default indent-tabs-mode nil)

;; Display line and column number
(line-number-mode 1)
(column-number-mode 1)

;; Fold text on the 80-column boundary when calling fill- commands
(setq-default fill-column 80)

;; Append a new line (if there isn't one) when saving a file
(setq require-final-newline t)

;; Display matching parentheses
(show-paren-mode t)

;; Redefine default behavior of DEL key
;; (fix the key on Mac keyboards)
(global-set-key (kbd "<kp-delete>") 'delete-char)

;; Disable VC
(setq vc-handled-backends nil)


;; *** Handy function definitions ***
(defun insert-pymacs-eval (arg)
  "Evalutate python expression and insert its result at the"
  "current location of the point"
  (interactive "sPython expression: ")
  (print (pymacs-eval arg) (current-buffer)))

;;(global-set-key "\C-x\C-e" 'insert-pymacs-eval)


;; *** Prepare enviroment for easy plugin loading ***
(setq my-plugins-dir "~/.emacs.d/plugins/")
(add-to-list 'load-path my-plugins-dir)

(defun make-plugin-path (plugin)
  (concat my-plugins-dir plugin "/"))


;; All of the functions which invoke autoload will be evaluated
;; immediately.  All other functions are called explicitly at the end of
;; the file.

;; *** MAJOR MODES ***

(defun load-javascript-mode ()
  (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . javascript-mode))
  (add-to-list 'auto-mode-alist '("\\.json\\'" . javascript-mode))
  (autoload 'javascript-mode "javascript" nil t))
(load-javascript-mode)

(defun load-js2-mode ()
  (autoload 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js.?$" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.json$" . js2-mode)))
;(load-js2-mode)

(defun load-markdown-mode ()
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist
               '("\\.\\(md\\|markdown\\)" . markdown-mode)))
(load-markdown-mode)

(defun load-haskell-mode ()
  (autoload 'haskell-mode "~/.emacs.d/plugins/haskell-mode-2.8.0/haskell-site-file" "" t)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'haskell-font-lock-symbols t)
  (put 'downcase-region 'disabled nil))
(load-haskell-mode)

(defun load-erlang-mode ()
  (setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.4/emacs"
                         load-path))
  (setq erlang-root-dir "/usr/local/lib/erlang")
  (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
  (require 'erlang-start))
;(load-erlang-mode)

(defun load-nxhtml ()
  (load (concat (make-plugin-path "nxhtml") "autostart.el")))
;(load-nxhtml)
;; *** VALIDATORS etc. ***

;; This requires pep8 to be installed.
;;   easy_install pep8"
(autoload 'python-pep8 "python-pep8" nil t)

(autoload 'python-pylint "python-pylint" nil t)


;; *** COMMON LISP via SLIME w/ Swank using Clozure ***

(defun slime-mode ()
  (interactive)
  (let ((lispbox-path "~/.emacs.d/plugins/lispbox"))
    (setenv "LISPBOX_HOME" lispbox-path)
    (add-to-list 'load-path lispbox-path)
    (load "lispbox")
    (funcall (indirect-function 'slime-mode))))


;; *** SNIPPETS & AUTOCOMPLETION ***

(defun load-yasnippet ()
  "Load YASnippet-0.6.1c plugin with some code snippets."
  (let ((yas-path (make-plugin-path "yasnippet-0.6.1c")))
    (add-to-list 'load-path yas-path)
    (require 'yasnippet)

    (setq yas/root-directory (concat yas-path "snippets"))
    (yas/load-directory yas/root-directory)

    (yas/global-mode 1)))

(defun load-auto-complete ()
  "A general-purpose auto-completeion."
  (let ((auto-complete-path (make-plugin-path "auto-complete")))
    (add-to-list 'load-path auto-complete-path)

    (require 'auto-complete-config)
    (add-to-list 'ac-dictionary-directories (concat auto-complete-path "ac-dict"))
    (ac-config-default)

    ;; fix auto-complete for objc-mode
    (add-to-list 'ac-modes 'objc-mode)
    (add-to-list 'ac-modes 'js2-mode)))

(defun load-company ()
  "This is another auto-completion mode."
  (let ((company-path (make-plugin-path "company-0.5")))
    (add-to-list 'load-path company-path)
    (autoload 'company-mode "company" nil t)
    (setq company-idle-delay 0.1)))


;; *** AUGMENTING EMACS INTERPRETER ***

(defun load-pymacs ()
  "Self-explanatory."
  (add-to-list 'load-path (make-plugin-path "Pymacs"))
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-load "pymacs" nil t))


;; *** Load the plugins ***
(load-yasnippet)
(load-auto-complete)
;(load-company)
;(load-pymacs)


;; Make SLIME connect to your lisp whenever you open a lisp file
(add-hook 'slime-mode-hook
	  (lambda ()
	    (unless (slime-connected-p)
	      (save-excursion (slime)))))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-hook 'python-mode-hook '(lambda () (highlight-80+-mode t)))
(add-hook 'lisp-mode-hook '(lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook '(lambda () (paredit-mode +1)))


(global-set-key (read-kbd-macro "M-n") 'forward-whitespace)
(global-set-key (read-kbd-macro "M-p") 'kill-forward-whitespace)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
