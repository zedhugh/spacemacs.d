;;; config.el --- Chinese Layer configuration File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar czh/company-minimum-prefix-length 1
  "my own variable for company-minimum-prefix-length")

(defvar czh/company-idle-delay 0
  "my own variable for company-idle-delay")

;; config for flyspell delay
(setq-default flyspell-delay 0.5)
(setq-default flyspell-correct-auto-delay 0.5)

(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; config for dired mode
(setq dired-recusive-deletes 'always)
(setq dired-recusive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)

;; set the default evil state for some major-mode
(with-eval-after-load 'evil
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'messages-buffer-mode 'emacs)
  (evil-set-initial-state 'youdao-dictionary-mode 'emacs))

;; source code to exec
(with-eval-after-load 'org
  (progn
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (C      . t)
       (sh     . t)
       (js     . t)
       (latex  . t)
       (python . t)
       ))
    ;; (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
    ))

;; set my own company-minimum-prefix-length and company-idle-delay
(add-hook 'company-mode-hook #'czh/company-init)

;; config for flycheck front face
(with-eval-after-load 'flycheck
  (progn
    (setq flycheck-idle-change-delay    0.05)
    (setq flycheck-display-errors-delay 0.05)
    (setq flycheck-display-errors-function
          (quote flycheck-display-error-messages))
    ))

(with-eval-after-load 'flyspell
  (setq flyspell-correct-auto-delay 0.05))

;; chinese font set
(when (not (eq window-system nil))
  (progn
    (setq czh-han-font "SimSun")
    (setq czh-han-font-size 16)

    (when (eq system-type 'gnu/linux)
      (setq czh-han-font "Emacs SimSun"))

    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family czh-han-font :size czh-han-font-size)))))

;; 2 spaces indenting both on =js= and =jsx= :
(setq-default
 ;; standard indent
 standard-indent 2
 ;; js2-mode
 js2-basic-offset 2
 js-indent-level 2
 ;; web-mode
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)

;; 2 space indent for element's attributes
(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

(setq x-gtk-use-system-tooltips nil);

(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-identifiers-mode)
