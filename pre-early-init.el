;;; pre-early-init.el --- Pre Early Initialization -*- lexical-binding: t; -*-

(defvar my-native-comp-reserved-cpus 0
  "Number of CPUs to reserve and not use for `native-compile'.")

(defun my-calculate-native-comp-async-jobs ()
  "Set `native-comp-async-jobs-number' based on the available CPUs."
  ;; The `num-processors' function is only available in Emacs >= 28.1
  (max 1 (- (num-processors) my-native-comp-reserved-cpus)))

(setq native-comp-async-jobs-number (my-calculate-native-comp-async-jobs))

(setq package-enable-at-startup nil)

(setq user-emacs-directory (expand-file-name "var/" minimal-emacs-user-directory))
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
