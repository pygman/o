(set-fontset-font "fontset-default"'gb18030' ("Microsoft YaHei" . "unicode-bmp"))
(setq scroll-step 1
scroll-margin 3
scroll-conservatively 10000)

(global-set-key [f11] 'my-fullscreen) 
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

(global-linum-mode 1)
(tool-bar-mode 0)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-c") 'previous-line)
(global-set-key (kbd "C-t") 'next-line)
(global-set-key (kbd "C-h") 'backward-word)
(global-set-key (kbd "C-n") 'forward-word)
(global-set-key (kbd "C-g") 'move-beginning-of-line)
(global-set-key (kbd "C-r") 'move-end-of-line)
(global-set-key (kbd "C-S-v") 'kill-ring-save)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'execute-extended-command)
(global-set-key (kbd "C-M-h") 'backward-char)
(global-set-key (kbd "C-M-n") 'forward-char)
(global-set-key (kbd "C-M-d") 'kill-whole-line)
(global-set-key (kbd "C-d") 'kill-word)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-q") 'keyboard-quit)
(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-M-.") 'other-window)

 ;;
(defun dvorak-mode-keymap()
  (local-set-key (kbd "<f5>") 'shell)
  (local-set-key (kbd "C-c") 'previous-line)
  (local-set-key (kbd "C-t") 'next-line)
  (local-set-key (kbd "C-h") 'backward-word)
  (local-set-key (kbd "C-n") 'forward-word)
  (local-set-key (kbd "C-g") 'move-beginning-of-line)
  (local-set-key (kbd "C-r") 'move-end-of-line)
  (local-set-key (kbd "C-S-v") 'kill-ring-save)
  (local-set-key (kbd "C-v") 'yank)
  (local-set-key (kbd "C-z") 'execute-extended-command)
  (local-set-key (kbd "C-M-h") 'backward-char)
  (local-set-key (kbd "C-M-n") 'forward-char)
  (local-set-key (kbd "C-M-d") 'kill-whole-line)
  (local-set-key (kbd "C-d") 'kill-word)
  (local-set-key (kbd "C-a") 'mark-whole-buffer)
  (local-set-key (kbd "C-z") 'undo)
  (local-set-key (kbd "C-q") 'keyboard-quit)
)

 ;;
(add-hook 'c-mode-hook 'dvorak-mode-keymap)
(add-hook 'java-mode-hook 'dvorak-mode-keymap)
(add-hook 'html-mode-hook 'dvorak-mode-keymap)
(add-hook 'javascript-mode-hook 'dvorak-mode-keymap)
(add-hook 'help-mode-hook 'dvorak-mode-keymap)
(add-hook 'shell-mode-hook 'dvorak-mode-keymap)
(add-hook 'hexl-mode-hook 'dvorak-mode-keymap)
(add-hook 'image-mode-hook 'dvorak-mode-keymap)
(add-hook 'image-mode-hook 'dvorak-mode-keymap)
(add-hook 'view-mode-hook 'dvorak-mode-keymap)
(add-hook 'normal-mode-hook 'dvorak-mode-keymap)
(add-hook 'fundamental-mode-hook 'dvorak-mode-keymap)
(add-hook 'xml-mode-hook 'dvorak-mode-keymap)
(add-hook 'python-mode-hook 'dvorak-mode-keymap)
(add-hook 'text-mode-hook 'dvorak-mode-keymap)
(add-hook 'org-mode-hook 'dvorak-mode-keymap)
(add-hook 'sh-mode-hook 'dvorak-mode-keymap)
(add-hook 'sh-mode-hook 'dvorak-mode-keymap)
(add-hook 'dired-mode-hook 'dvorak-mode-keymap)
(add-hook 'sql-mode-hook 'dvorak-mode-keymap)
