# palette
declare-option str background "rgb:0E1419"
declare-option str background_dark "rgb:21222C"
declare-option str foreground "rgb:F8F8F2"
declare-option str comment "rgb:6272A4"
declare-option str red "rgb:FF5555"
declare-option str orange "rgb:FFB86C"
declare-option str yellow "rgb:F1FA8C"
declare-option str green "rgb:50FA7B"
declare-option str purple "rgb:BD93F9"
declare-option str cyan "rgb:8BE9FD"
declare-option str pink "rgb:FF79C6"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default "%opt{foreground},%opt{background}@Default"
set-face global Default "%opt{foreground}@Default"

# kak-tree-sitter
set-face global ts_comment "%opt{comment}"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{purple}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape "%opt{pink}"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric ts_constant
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_diff_delta "%opt{orange}"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "red"
set-face global ts_diff_plus "green"
set-face global ts_function "green"
set-face global ts_function_builtin ts_function
set-face global ts_function_macro ts_function
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword "%opt{pink}"
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
set-face global ts_markup_bold "%opt{orange}+b"
set-face global ts_markup_heading "%opt{purple}+b"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "yellow+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text "%opt{pink}"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "cyan"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote "yellow+i"
set-face global ts_markup_raw "%opt{foreground}"
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough "+s"
set-face global ts_operator "%opt{pink}"
set-face global ts_punctuation "%opt{foreground}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special ts_punctuation
set-face global ts_string "yellow"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "red"
set-face global ts_string_special ts_string
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "%opt{pink}"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "cyan+i"
set-face global ts_type_builtin ts_type
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "%opt{foreground}+i"
set-face global ts_variable "%opt{foreground}"
set-face global ts_variable_builtin "cyan+i"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member ts_variable_other
set-face global ts_variable_parameter "%opt{orange}+i"

# kakoune-lsp
set-face global LineFlagError "red"
set-face global LineFlagWarning "cyan"
set-face global Reference "green+u"