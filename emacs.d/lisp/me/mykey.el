
(defun find-project-root (path root-tag)
  "find the parent directory that include file \"ROOT\" recurly.\nUsage (find-project-root (file-name-directory buffer-file-name))"
  (setq current-dir nil)
  (if (string= path "/") nil
    (progn
      (setq files (directory-files path))
      (setq not-match-p t)
      (while (and files not-match-p)
        (setq na (pop files))
        (if (string= na root-tag)
            (progn
              (setq not-match-p nil)
              (setq current-dir path))))
      (if (not current-dir)
		  
		  (setq current-dir
				(find-project-root
				 (file-name-directory
				  (directory-file-name path)) root-tag)))))
  current-dir)


(global-set-key
 (kbd "<f9>")
 (lambda ()
   (interactive)
   (setq-local compilation-read-command nil)
   (if
	   (equal 'java-mode major-mode)
	   (progn
		 (setq-local default-directory
					 (find-project-root
					  (file-name-directory buffer-file-name) "build.gradle"))
		 (setq-local compile-command "gradle build"))
	 (progn
	   (setq-local default-directory
				   (find-project-root
					(file-name-directory buffer-file-name) "makefile"))
	   (setq-local compile-command "make")))
   (if default-directory
	   (call-interactively 'compile))
   ;; not build file found do nothing
   ))

(global-set-key
 (kbd "<f8>")
 (lambda ()
   (interactive)
   (setq-local compilation-read-command nil)
   (if (equal 'java-mode major-mode)
	   (progn
		 (setq-local default-directory
					 (find-project-root
					  (file-name-directory buffer-file-name) "build.gradle"))
		 (setq-local compile-command "gradle clean"))
	 (progn
	   (setq-local default-directory
				   (find-project-root
					(file-name-directory buffer-file-name) "makefile"))
	   (setq-local compile-command "make clean")))
   (if default-directory
	   (call-interactively 'compile))
   ))


(global-set-key (kbd "C-d") 'kill-whole-line)

