# palette
declare-option str red "rgb:DC322F"
declare-option str green "rgb:859900"
declare-option str yellow "rgb:B58900"
declare-option str blue "rgb:268BD2"
declare-option str magenta "rgb:D33682"
declare-option str cyan "rgb:2AA198"
declare-option str orange "rgb:CB4B16"
declare-option str violet "rgb:6C71C4"
declare-option str base0 "rgb:657B83"
declare-option str base1 "rgb:586E75"
declare-option str base2 "rgb:073642"
declare-option str base3 "rgb:002B36"
declare-option str base00 "rgb:839496"
declare-option str base01 "rgb:93A1A1"
declare-option str base015 "rgb:C5C8BD"
declare-option str base0175 "rgb:DDDBCC"
declare-option str base02 "rgb:EEE8D5"
declare-option str base025 "rgb:F5EEDB"
declare-option str base03 "rgb:FDF6E3"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default ",%opt{base03}@Default"
set-face global Default "%opt{base1}@Default"

# kak-tree-sitter
set-face global ts_attribute "%opt{violet}"
set-face global ts_comment "%opt{base01}"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "cyan"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape "red+b"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric ts_constant
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "blue"
set-face global ts_diff_delta "yellow"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "red"
set-face global ts_diff_plus "green"
set-face global ts_function "blue"
set-face global ts_function_builtin "blue+b"
set-face global ts_function_macro "magenta"
set-face global ts_function_method ts_function
set-face global ts_function_special "magenta"
set-face global ts_keyword "green"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive "%opt{orange}"
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "green"
set-face global ts_markup_bold "yellow+b"
set-face global ts_markup_heading "blue"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "magenta+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text "red"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "yellow+u"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote "cyan"
set-face global ts_markup_raw "green"
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough "+s"
set-face global ts_namespace "%opt{violet}"
set-face global ts_operator "green"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "%opt{orange}"
set-face global ts_string "cyan"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp ts_string
set-face global ts_string_special ts_string
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "magenta"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "yellow"
set-face global ts_type_builtin "yellow+b"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable_builtin "cyan+b"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member ts_variable_other
set-face global ts_variable_parameter ts_variable

# kakoune-lsp
set-face global DiagnosticError "red"
set-face global DiagnosticHint "%opt{base01}"
set-face global DiagnosticInfo "blue"
set-face global DiagnosticWarning "%opt{orange}"
set-face global InlayHint "%opt{base01}+i"
set-face global LineFlagError "red+bu"
set-face global LineFlagHint "%opt{base01}+bu"
set-face global LineFlagInfo "blue+bu"
set-face global LineFlagWarning "%opt{orange}+bu"
set-face global Reference "%opt{base02},%opt{base015}"