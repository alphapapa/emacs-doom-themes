;;; doom-solarized-dark-theme.el --- inspired by Atom One Dark
(require 'doom-themes)

;;
(defgroup doom-solarized-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-solarized-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-solarized-dark-theme
  :type 'boolean)

(defcustom doom-solarized-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-solarized-dark-theme
  :type 'boolean)

(defcustom doom-solarized-dark-comment-bg doom-solarized-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-solarized-dark-theme
  :type 'boolean)

(defcustom doom-solarized-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-solarized-dark-theme
  :type '(or integer boolean))

(defcustom doom-solarized-dark-rainbow-delimiters-alpha 0.5
  "Rainbow delimiters are blended with the background with this alpha."
  :group 'doom-solarized-dark-theme
  :type 'integer)

;;
(def-doom-theme doom-solarized-dark
  "A light theme inspired by Solarized light"

  ;; name        default   256       16
  ((bg         '("#002b36" nil       nil            ))
   (bg-alt     '("#073642" nil       nil            ))
   (base0      '("#002b36" "black"   "black"        ))
   (base1      '("#073642" "#1e1e1e" "brightblack"  ))
   (base2      '("#586e75" "#2e2e2e" "brightblack"  ))
   (base3      '("#657b83" "#262626" "brightblack"  ))
   (base4      '("#839496" "#3f3f3f" "brightblack"  ))
   (base5      '("#93a1a1" "#525252" "brightblack"  ))
   (base6      '("#93a1a1" "#6b6b6b" "brightblack"  ))
   (base7      '("#eee8d5" "#979797" "brightblack"  ))
   (base8      '("#fdf6e3" "#dfdfdf" "white"        ))
   (fg         '("#839496" "#2d2d2d" "white"        ))
   (fg-alt     '("#93a1a1" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#dc322f" "#ff6655" "red"          ))
   (orange     '("#cb4b16" "#dd8844" "brightred"    ))
   (green      '("#859900" "#99bb66" "green"        ))
   (teal       '("#35a69c" "#33aa99" "brightgreen"  ))
   (yellow     '("#b58900" "#ECBE7B" "yellow"       ))
   (blue       '("#268bd2" "#51afef" "brightblue"   ))
   (dark-blue  '("#E1E3E5" "#2257A0" "blue"         ))
   (magenta    '("#d33682" "#c678dd" "magenta"      ))
   (violet     '("#6c71c4" "#a9a1e1" "brightmagenta"))
   (cyan       '("#2aa198" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#D7DDD7" "#5699AF" "cyan"         ))

   ;; Official Solarized colors
   (base03 '("#002b36"))
   (base02 '("#073642"))
   (base01 '("#586e75"))
   (base00 '("#657b83"))
   (base0 '("#839496"))
   (base1 '("#93a1a1"))
   (base2 '("#eee8d5"))
   (base3 '("#fdf6e3"))
   (yellow '("#b58900"))
   (orange '("#cb4b16"))
   (red '("#dc322f"))
   (magenta '("#d33682"))
   (violet '("#6c71c4"))
   (blue '("#268bd2"))
   (cyan '("#2aa198"))
   (green '("#859900"))

   ;; Map Solarized colors to dark theme values
   (bg base03)
   (bg-alt base02)
   (fg base0)
   ;; FIXME: Is fg-alt for emphasized, or something else?
   (fg-alt base01)


   ;; face categories -- required for all themes
   (highlight bg-alt)
   (vertical-bar   base4)
   (selection      bg-alt)
   (builtin         green)
   (comments       base01)
   (doc-comments   teal)
   (constants blue)
   (functions      magenta)
   (keywords green)
   (methods        cyan)
   (operators orange)
   (type           yellow)
   (strings        cyan)
   (variables      blue)
   (numbers        violet)
   (region        bg-alt)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-solarized-dark-brighter-modeline)
   (-modeline-pad
    (when doom-solarized-dark-padded-modeline
      (if (integerp doom-solarized-dark-padded-modeline) doom-solarized-dark-padded-modeline 4)))

   (modeline-fg     base03)
   (modeline-fg-alt base02)

   (modeline-bg base01)
   (modeline-bg-l
    (if -modeline-bright
        (doom-lighten bg 0.7)
      (doom-darken bg 0.05)))
   (modeline-bg-inactive   (doom-darken bg 0.02))
   (modeline-bg-inactive-l (doom-darken bg 0.025)))



  ;; --- extra faces ------------------------
  (

   ((mode-line-emphasis &override) :foreground blue)
   (mode-line-buffer-id :foreground blue)

   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (hl-line :background nil)

   (link :foreground blue :weight 'bold :underline t)

   ((highlight-quoted-symbol &override) :slant 'italic)

   ((line-number &override) :foreground base6)
   ((line-number-current-line &override) :foreground fg :background region :weight 'bold)

   (org-block :background (doom-blend yellow bg 0.04))
   (org-block-background :background (doom-blend yellow bg 0.04))
   (org-block-begin-line :background (doom-blend yellow bg 0.08))
   (org-block-end-line :background (doom-blend yellow bg 0.08))
   ((font-lock-comment-face &override)
    :slant 'italic
    :foreground comments
    :background (if doom-solarized-dark-comment-bg (doom-blend teal base0 0.07))
    :weight 'normal)
   ((font-lock-doc-face &override)
    :foreground doc-comments
    :slant 'italic :weight 'normal
    )
   ((font-lock-type-face &override) :weight 'bold)
   ((font-lock-builtin-face &override))
   ((font-lock-function-name-face &override) :foreground type :weight 'bold)
   ((font-lock-keyword-face &override) :weight 'bold)

   ((rainbow-delimiters-depth-1-face &override) :foreground (doom-blend bg green doom-solarized-dark-rainbow-delimiters-alpha))
   ((rainbow-delimiters-depth-2-face &override) :foreground (doom-blend bg orange doom-solarized-dark-rainbow-delimiters-alpha))
   ((rainbow-delimiters-depth-3-face &override) :foreground (doom-blend bg magenta doom-solarized-dark-rainbow-delimiters-alpha))
   ((rainbow-delimiters-depth-4-face &override) :foreground (doom-blend bg cyan doom-solarized-dark-rainbow-delimiters-alpha))
   ((rainbow-delimiters-depth-5-face &override) :foreground (doom-blend bg violet doom-solarized-dark-rainbow-delimiters-alpha))
   ((rainbow-delimiters-depth-6-face &override) :foreground (doom-blend bg yellow doom-solarized-dark-rainbow-delimiters-alpha))
   ((rainbow-delimiters-depth-7-face &override) :foreground (doom-blend bg blue doom-solarized-dark-rainbow-delimiters-alpha))


   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; ivy-mode
   (ivy-current-match :background (doom-lighten yellow 0.65) :distant-foreground fg)
   (ivy-minibuffer-match-face-1
    :foreground comments
    :weight 'light)
   (ivy-minibuffer-match-face-2 :foreground magenta :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground green   :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground yellow  :background base3 :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground violet :weight 'bold)

   ;; posframe
   (ivy-posframe :background modeline-bg-l)
   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-solarized-dark-theme.el ends here
