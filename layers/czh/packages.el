;;; packages.elaphine --- czh layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <czh@localhost.localdomain>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `czh-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `czh/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `czh/pre-init-PACKAGE' and/or
;;   `czh/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst czh-packages
  '(youdao-dictionary
    smartparens
    pyim-basedict
    pyim))

(defun czh/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    ))

(defun czh/init-pyim-basedict ()
  (use-package pyim-basedict
    :defer t
    ))

(defun czh/init-pyim ()
  (use-package pyim
    :ensure nil
    :config
    (setq default-input-method "pyim")
    (setq pyim-page-style 'one-line)
    (if (<= emacs-major-version 26)
        (setq pyim-page-tooltip 'popup)
      (setq pyim-page-tooltip 'child-frame))
    (setq-default pyim-english-input-switch-functions
                  '(pyim-probe-program-mode))
    (setq-default pyim-punctuation-half-width-functions
                  '(pyim-probe-punctuation-line-beginning
                    pyim-probe-punctuation-after-punctuation))
    (pyim-basedict-enable)
    (setq dicts (concat configuration-layer-private-layer-directory "czh/pyim-dicts/"))
    (setq greatdict (concat dicts "pyim-greatdict.pyim.gz"))
    (pyim-extra-dicts-add-dict
     `(:name "Greatdict-elpa"
             :file ,greatdict
             :coding utf-8-unix
             :dict-type pinyin-dict))
    ))

(defun czh/post-init-smartparens ()
  (use-package smartparens
    :defer t
    :init
    (smartparens-global-strict-mode)))

;;; packages.el ends here
