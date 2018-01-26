;; dwin = do what I mean.
(defun czh/occur-dwin ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

(defun czh/company-init ()
  "set my own company-idle-delay and company-minimum-prefix-length"
  (interactive)
  (setq-local company-idle-delay czh/company-idle-delay)
  (set (make-local-variable 'company-minimum-prefix-length) czh/company-minimum-prefix-length))

(defun czh/js-offset ()
  (interactive)
  (setq-default js-switch-indent-offset 2))

(defun czh/pyim-greatdict-enable ()
  (setq dicts (concat configuration-layer-private-layer-directory "czh/pyim-dicts/"))
  (setq greatdict (concat dicts "pyim-greatdict.pyim.gz"))
  (if (featurep 'pyim)
      (pyim-extra-dicts-add-dict
       `(:name "Greatdict-elpa"
               :file ,greatdict
               :coding utf-8-unix
               :dict-type pinyin-dict))
    (message "pyim don't install, can't enable pyim-greatdict.")))

(defun czh/font-setup (fontset)
  "fontset for Emacs GUI Client, the shape of parameter `fontset' like
  '((default-font-family . default-font-size)
    (chinese-font-family . chinese-font-size))"
  (when (not (eq window-system nil))
    (let ((default-font (car fontset))
          (chinese-font (nth 1 fontset)))
      ;; default fontset
      (let ((family (car default-font))
            (size (cdr default-font)))
        (if (member family (font-family-list))
            (if (functionp 'spacemacs/set-default-font)
                (spacemacs/set-default-font (list family
                                                  :size size))
              (set-face-attribute 'default nil
                                  :font (font-spec :family family :size size)))
          (message "Font %s not installed,please install is first." family)))

      ;; fontset for multi-byte code such as Chinese
      (let ((family (if (eq system-type 'gnu/linux)
                        (car chinese-font)
                      "SimSun"))
            (size (cdr chinese-font)))
        (if (member family (font-family-list))
            (dolist (charset '(kana han cjk-misc bopomofo))
              (set-fontset-font (frame-parameter nil 'font) charset
                                (font-spec :family family :size size)))
          (message "Font %s not installed,please install is first." family)
          )))))
