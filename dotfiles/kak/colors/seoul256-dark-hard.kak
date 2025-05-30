# palette
declare-option str black "rgb:000000"
declare-option str black1 "rgb:14161B"
declare-option str red "rgb:D70000"
declare-option str green "rgb:AFD75F"
declare-option str green1 "rgb:5F875F"
declare-option str green2 "rgb:5F8700"
declare-option str green3 "rgb:87AF87"
declare-option str green4 "rgb:5F5F00"
declare-option str yellow "rgb:D8AF5F"
declare-option str yellow1 "rgb:FFD787"
declare-option str yellow2 "rgb:D7D7AF"
declare-option str yellow3 "rgb:D7D787"
declare-option str yellow4 "rgb:87875F"
declare-option str yellow5 "rgb:6B5300"
declare-option str blue "rgb:87AFAF"
declare-option str blue1 "rgb:5F87D7"
declare-option str blue2 "rgb:5F5F87"
declare-option str blue3 "rgb:A6DBFF"
declare-option str blue4 "rgb:005F5F"
declare-option str blue5 "rgb:5FAFAF"
declare-option str blue6 "rgb:008787"
declare-option str magenta "rgb:AF5F5F"
declare-option str magenta1 "rgb:AF5F87"
declare-option str magenta2 "rgb:875F5F"
declare-option str magenta3 "rgb:D7005F"
declare-option str cyan "rgb:87D7D7"
declare-option str cyan1 "rgb:AFD7D7"
declare-option str white "rgb:D0D0D0"
declare-option str white1 "rgb:DADADA"
declare-option str purple "rgb:8787AF"
declare-option str brown "rgb:AF875F"
declare-option str brown1 "rgb:875F00"
declare-option str orange "rgb:FF5F00"
declare-option str salmon "rgb:FFAF87"
declare-option str salmon1 "rgb:D78787"
declare-option str salmon2 "rgb:D7AFAF"
declare-option str salmon3 "rgb:D7875F"
declare-option str mauve "rgb:D75F87"
declare-option str gray "rgb:121212"
declare-option str gray1 "rgb:1C1C1C"
declare-option str gray2 "rgb:262626"
declare-option str gray3 "rgb:303030"
declare-option str gray4 "rgb:3A3A3A"
declare-option str gray5 "rgb:444444"
declare-option str gray6 "rgb:585858"
declare-option str gray7 "rgb:626262"
declare-option str gray8 "rgb:4E4E4E"
declare-option str gray9 "rgb:5F5F5F"
declare-option str gray10 "rgb:C6C6C6"
declare-option str gray11 "rgb:EEEEEE"
declare-option str gray12 "rgb:E4E4E4"
declare-option str gray13 "rgb:BCBCBC"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default ",%opt{gray1}@Default"
set-face global Default "bright-white@Default"

# kak-tree-sitter
set-face global ts_attribute "yellow"
set-face global ts_comment "%opt{green1}"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{blue5}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean "%opt{purple}"
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape "%opt{salmon}"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "%opt{yellow1}"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "yellow"
set-face global ts_diff_delta "%opt{blue1}"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "%opt{magenta3}"
set-face global ts_diff_plus "%opt{green3}"
set-face global ts_function "%opt{yellow2}"
set-face global ts_function_builtin "%opt{blue1}"
set-face global ts_function_macro "%opt{yellow2}"
set-face global ts_function_method "%opt{salmon}"
set-face global ts_function_special ts_function
set-face global ts_keyword "%opt{mauve}"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive ts_keyword
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "magenta"
set-face global ts_markup_bold "%opt{yellow1}+b"
set-face global ts_markup_heading "%opt{salmon2}+b"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "%opt{magenta1}+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text "%opt{salmon2}"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "cyan+u"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote "yellow"
set-face global ts_markup_raw ts_markup
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline "green"
set-face global ts_markup_strikethrough "+s"
set-face global ts_namespace "cyan"
set-face global ts_operator "%opt{yellow3}"
set-face global ts_punctuation "%opt{brown}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "%opt{yellow2}"
set-face global ts_string "blue"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp ts_string
set-face global ts_string_special ts_string
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "yellow"
set-face global ts_type_builtin "%opt{salmon}"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable "bright-white"
set-face global ts_variable_builtin "%opt{salmon}"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "bright-white"
set-face global ts_variable_parameter "bright-white"

# kakoune-lsp
set-face global DiagnosticError "red"
set-face global DiagnosticHint "%opt{green1}"
set-face global DiagnosticInfo "cyan"
set-face global DiagnosticWarning "%opt{yellow1}"
set-face global InlayHint "%opt{gray4}+b"
set-face global LineFlagError "red+b"
set-face global LineFlagHint "%opt{blue3}+b"
set-face global LineFlagInfo "%opt{blue2}+b"
set-face global LineFlagWarning "yellow+b"
set-face global Reference ",%opt{gray4}+u"