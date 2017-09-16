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
