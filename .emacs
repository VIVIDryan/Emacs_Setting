(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type 'box)
 '(custom-enabled-themes '(spacemacs-light))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(org-agenda-files '("c:/workspace/Emacs/one.org"))
 '(package-selected-packages '(counsel use-package ivy command-log-mode))
 '(py-known-shells
   '("ipython" "ipython2.7" "ipython3" "jython" "python" "python2" "python3" "pypy" "D:/Anaconda/python"))
 '(python-shell-buffer-name "Python")
 '(python-shell-exec-path nil)
 '(python-shell-extra-pythonpaths '("D:\\Anaconda"))
 '(python-shell-prompt-detect-enabled t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 200 :width normal)))))
;; Org-mode settingsonone
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)


(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Microsoft YaHei" )))
(set-language-environment 'Chinese-GB)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
;;(prefer-coding-system 'gb18030)
;(prefer-coding-system 'utf-16le-with-signature)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8)
(put 'dired-find-alternate-file 'disabled nil)
