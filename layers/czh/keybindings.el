;;; keybindings.el --- Better Emacs Defaults Layer key bindings File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(global-set-key (kbd "M-s o") 'czh/occur-dwin)

(global-set-key (kbd "C-M-\\") 'czh/indent-region-or-buffer)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(global-set-key (kbd "s-v") 'clipboard-yank)

(global-set-key (kbd "s-d") 'czh/my-mc-mark-next-like-this)

(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "op" 'youdao-dictionary-play-voice-at-point)

(evil-define-key 'visual evil-surround-mode-map "c" 'evil-surround-change)
(evil-define-key 'visual evil-surround-mode-map "d" 'evil-surround-delete)
