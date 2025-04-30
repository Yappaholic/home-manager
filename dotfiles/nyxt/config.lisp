;; Disable compositing
(setf (uiop/os:getenv "WEBKIT_DISABLE_COMPOSITING_MODE") "1")
(setf (uiop/os:getenv "ELECTRON_OZON_PLATFORM_HINT") "x11")

;; Adblock
(define-configuration web-buffer
    ((default-modes
         (pushnew 'nyxt/mode/blocker:blocker-mode %slot-value%))))
;; Emacs mode
(define-configuration web-buffer
    ((default-modes
         (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))
;; Reduce tracking
(define-configuration web-buffer
    ((default-modes
         (pushnew 'nyxt/mode/reduce-tracking:reduce-tracking-mode %slot-value%))))

;; Password mode
(define-configuration web-buffer
    ((default-modes
         (pushnew 'nyxt/mode/password:password-mode %slot-value%))))
;; Certificates
(setf nyxt/mode/certificate-exception:*default-certificate-exceptions*
      '("sdo.rgsu.net"))
(defvar *my-search-engines*
  (list
   '("google" "https://google.com/search?q=~a" "https://google.com")
   '("duckgo" "https://duckduckgo.com/?q=~a" "https://duckduckgo.com"))
  "List of search engines")

(define-configuration context-buffer
    "Go through the search engines"
  (( search-engines
     (append %slot-default%
             (mapcar
              (lambda (engine) (apply 'make-search-engine engine))
              *my-search-engines*)))))

;; MPV
;; Create a function to launch mpv with given url
(defun mpv (url)
  "MPV launches with given url using the fast profile."
  (uiop:run-program 
                    (list "bash" "-c" (format nil "yt-dlp -o - ~A | mpv -" url))))

;; Create a function to download videos with youtube-dl in alacritty
(defun youtube-dl (url)
  "Download videos and audio with youtube-dl in alacritty for feedback"
  (uiop:run-program
   (list "kitty" "yt-dlp" "-o ~/Videos/%(title)s.%(ext)s" url)))

;; Let's create a function to hint videos, convert the url to a sting, and play them in MPV
(define-command-global hint-mpv nil
  "Show a set of element hints, and copy the URL of the user inputted one."
  (nyxt/mode/hint:query-hints "Copy element URL"
                              (lambda (nyxt/mode/hint::results)
                                ;; this converts the url to a string to be used in mpv
                                (let*
                                    ((url
                                      (format nil "~a"
                                              (url (first nyxt/mode/hint::results)))))
                                  ;; here we take that string and pipe it into mpv
                                  (mpv url)))
                              ))

;; Let's create a function to hint videos, convert the url to a sting, and download with ytdl
(define-command hint-ytdl nil
  "Show a set of element hints, and copy the URL of the user inputted one."
  (nyxt/mode/hint:query-hints "Copy element URL"
                              (lambda (nyxt/mode/hint::results)
                                ;; this converts the url to a string to be used in mpv
                                (let*
                                    ((url
                                      (format nil "~a"
                                              (url (first nyxt/mode/hint::results)))))
                                  ;; here we take that string and pipe it into mpv
                                  (youtube-dl url)))
                              ))

;;(define-key 'nyxt/mode/emacs:emacs-mode "C-x y" 'hint-mpv)
