(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))

;; Package Initialize
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))
(require 'use-package)

;; Uncomment this to get a reading on packages that get loaded at startup
;;(setq use-package-verbose t)

;; On non-Guix systems, "ensure" packages by default
(setq use-package-always-ensure t)

;; Personal Information
(setq user-full-name "Travis Chen"
      user-mail-address "cxqlove1999@outlook.com"
      calendar-latitude 39.85
      calendar-longitude 116.48
      calendar-location-name "Beijing, CN")
;;theme
(load-theme 'spacemacs-dark)


;; Set Font
;; need to install font Inconsolata
(setq trvs/default-fixed-font "Inconsolata")
(setq trvs/default-fixed-font-size 140)
(setq trvs/current-fixed-font-size trvs/default-fixed-font-size)
;;(setq trvs/han-font-size (apply '+ '(trvs/current-fixed-font-size 10)))
(set-face-attribute 'default nil
		    :family trvs/default-fixed-font
		    :height trvs/current-fixed-font-size
		    )
(set-fontset-font "fontset-default" 'han (font-spec :family "KaiTi" :height trvs/current-fixed-font-size))
(set-face-attribute 'fixed-pitch nil
		    :family trvs/default-fixed-font
		    :height trvs/current-fixed-font-size
		    )

(setq trvs/default-variable-font "Libre Baskerville")
(setq trvs/default-variable-font-size 130)
(setq trvs/current-variable-font-size trvs/default-variable-font-size)
(set-face-attribute 'variable-pitch nil
                    :family trvs/default-variable-font
                    :height trvs/current-variable-font-size
		    )
(setq trvs/font-change-increment 1.1)
(defun trvs/set-font-size ()
;;"Change default, fixed-pitch, and variable-pitch font sizes to match respective variables."
  (set-face-attribute 'default nil
                      :height trvs/current-fixed-font-size)
  (set-face-attribute 'fixed-pitch nil
                      :height trvs/current-fixed-font-size)
  (set-face-attribute 'variable-pitch nil
                      :height trvs/current-variable-font-size))
  (set-fontset-font "fontset-default" 'han (font-spec :family "KaiTi" :height trvs/current-fixed-font-size))
  

(defun trvs/reset-font-size ()
;;  "Revert font sizes back to defaults."
  (interactive)
  (setq trvs/current-fixed-font-size trvs/default-fixed-font-size)
  (setq trvs/current-variable-font-size trvs/default-variable-font-size)
  (trvs/set-font-size))

(defun trvs/increase-font-size ()
;;  "Increase current font sizes by a factor of `hrs/font-change-increment'."
  (interactive)
  (setq trvs/current-fixed-font-size
        (ceiling (* trvs/current-fixed-font-size trvs/font-change-increment)))
  (setq trvs/current-variable-font-size
        (ceiling (* trvs/current-variable-font-size trvs/font-change-increment)))
  (trvs/set-font-size))

(defun trv/decrease-font-size ()
;;  "Decrease current font sizes by a factor of `hrs/font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq trvs/current-fixed-font-size
        (max 1
             (floor (/ trvs/current-fixed-font-size trvs/font-change-increment))))
  (setq trvs/current-variable-font-size
        (max 1
             (floor (/ trvs/current-variable-font-size trvs/font-change-increment))))
  (trvs/set-font-size))

(define-key global-map (kbd "C-)") 'trvs/reset-font-size)
(define-key global-map (kbd "C-+") 'trvs/increase-font-size)
(define-key global-map (kbd "C-=") 'trvs/increase-font-size)
(define-key global-map (kbd "C-_") 'trvs/decrease-font-size)
(define-key global-map (kbd "C--") 'trvs/decrease-font-size)

(trvs/reset-font-size)


;;(load-theme 'spacemacs t)
(setq backup-directory-alist
`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))

(setq delete-by-moving-to-trash t)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 ;; ("C-M-j" . counsel-switch-buffer)
	 ("C-M-l" . counsel-imenu)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config  (setq ivy-initial-inputs-alist nil))
;; Don't start searches with ^
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type 'box)
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '(org-superstar org-plus-contrib org-faces spacemacs-theme counsel use-package ivy command-log-mode))
 '(py-shell-virtualenv-root "D:/Anaconda/envs")
 '(python-shell-virtualenv-root "D:/Anaconda/envs"))



;; (require 'org-tempo)

;; set the fonts of emacs

;; set the cursor

;; org mode
(use-package org
  :config
  (require 'org-tempo))
;; org-bullets
(use-package org-superstar
  :config
  (setq org-superstar-special-todo-items t)
  (add-hook 'org-mode-hook (lambda ()
                             (org-superstar-mode 1))))
(setq org-hide-leading-stars nil)
(setq org-superstar-leading-bullet ?\s)
;; Visibly render mathematical symbols.
(setq org-pretty-entities t)
;; Use syntax highlighting in source blocks while editing.
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)



(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'org-mode-hook
(lambda ()
  (set (make-local-variable 'system-time-locale) "C")))
;; pdf latex
(add-hook 'LaTeX-mode-hook
              #'(lambda ()
                  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))))

(setq TeX-command-default "XeLaTeX")

(setq org-latex-pdf-process
      '(
	"xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"rm -fr %b.out %b.log %b.tex auto"
	))
;; 设置默认后端为 `xelatex'
(setq org-latex-compiler "xelatex")

(use-package org-alert
  :defer t
  :config
  (progn
    (setq alert-default-style 'libnotify)
    ))
;; org images
(setq org-image-actual-width '(350))

;; org drawing
(setq org-ditaa-jar-path "~/.emacs.d/drawing/ditaa/ditaa.jar")
(setq org-plantuml-jar-path "~/java/plantuml.jar")
(defun trvs/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(add-hook 'org-babel-after-execute-hook 'trvs/display-inline-images 'append)
(setq org-babel-results-keyword "results")

(require 'ob-shell)
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
	 (C . t)
	 (java . t)
	 (shell . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (shell . t)
         (ledger . t)
         (org . t)
	(css . t)
         (plantuml . t)
         (latex . t))))
; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;; org mode 里源代码块的缩进设置
(setq org-src-tab-acts-natively t)
(setq auto-fill-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:family "Sarasa Nerd")))))












;; 配置anaconda

;; Performance
(if (not (display-graphic-p))
    (progn
      ;; 增大垃圾回收的阈值，提高整体性能（内存换效率）
      (setq gc-cons-threshold (* 8192 8192))
      ;; 增大同LSP服务器交互时的读取文件的大小
      (setq read-process-output-max (* 1024 1024 128)) ;; 128MB
      ))
;; useful tools

;; git
(use-package magit)

(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))


;; (use-package all-the-icons
;;   :after memoize
;;   :load-path "site-lisp/all-the-icons")

;; Programming Env
(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))
(use-package lsp-treemacs
  :after lsp)
(use-package lsp-ivy)
;; Python
(use-package dap-mode
  ;; Uncomment the config below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-configure nil)
  ;; :config
  ;; (dap-ui-mode 1)

  :config
  ;; Set up Node debugging
  (require 'dap-node)
  (dap-node-setup)) ;; Automatically installs Node debug adapter if needed

  ;; Bind `C-c l d` to `dap-hydra` for easy access
  ;; (general-define-key
  ;;   :keymaps 'lsp-mode-map
  ;;   :prefix lsp-keymap-prefix
  ;;   "d" '(dap-hydra t :wk "debugger")))

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

;(use-package pyvenv
;  :config
;  (pyvenv-mode 1))

(when (eq system-type 'windows-nt)
  (setq explicit-shell-file-name "powershell.exe")
  (setq explicit-powershell.exe-args '()))

;(setenv "WORKON_HOME" "D:/Anaconda/envs")
(pyvenv-mode 1)

(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "D:/Anaconda"))
  (setq conda-env-home-directory (expand-file-name "D:/Anaconda/envs")))

;; Productivity
(use-package flycheck
  :defer t
  :hook (lsp-mode . flycheck-mode))

;;Rainbow Mode
(use-package rainbow-mode
  :defer t
  :hook (org-mode
         emacs-lisp-mode
         web-mode
         typescript-mode
         js2-mode))




;;language
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
