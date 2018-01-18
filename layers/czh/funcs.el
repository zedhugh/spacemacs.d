(defun czh/my-mc-mark-next-like-this()
  (interactive)
  (if (region-active-p)
      (mc/mark-next-like-this 1)
    (er/expand-region 1)))

(defun czh/indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun czh/indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (czh/indent-buffer)
        (message "Indented buffer.")))))

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
