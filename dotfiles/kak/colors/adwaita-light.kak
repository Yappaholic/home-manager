# palette
declare-option str blue_0 "rgb:D3E4F9"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default "%opt{dark_4},%opt{light_1}@Default"
set-face global Default "%opt{dark_4}@Default"

# kak-tree-sitter
set-face global ts_attribute "%opt{orange_5}"
set-face global ts_comment "%opt{light_6}"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{violet_4}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character "%opt{teal_5}"
set-face global ts_constant_character_escape "%opt{violet_4}"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "%opt{teal_5}+b"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "%opt{blue_4}"
set-face global ts_diff_delta "%opt{orange_5}"
set-face global ts_diff_delta_moved "%opt{orange_4}"
set-face global ts_diff_minus "%opt{red_3}"
set-face global ts_diff_plus "%opt{teal_5}"
set-face global ts_function "%opt{blue_4}"
set-face global ts_function_builtin "%opt{blue_4}"
set-face global ts_function_macro "%opt{blue_4}+b"
set-face global ts_function_method ts_function
set-face global ts_function_special "%opt{blue_4}+b"
set-face global ts_keyword "%opt{orange_4}+b"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control "%opt{orange_4}+b"
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive "%opt{orange_4}+b"
set-face global ts_keyword_function "%opt{orange_4}"
set-face global ts_keyword_operator "%opt{purple_4}"
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage "%opt{orange_4}+b"
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "%opt{purple_4}"
set-face global ts_markup_bold "%opt{dark_4}+b"
set-face global ts_markup_heading "%opt{teal_4}+b"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "%opt{dark_4}+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text ts_markup_link
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url ts_markup_link
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote "%opt{dark_3}+i"
set-face global ts_markup_raw ts_markup
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough ts_markup
set-face global ts_namespace "%opt{orange_4}"
set-face global ts_operator "%opt{purple_4}"
set-face global ts_punctuation "%opt{dark_4}"
set-face global ts_punctuation_bracket "%opt{dark_4}"
set-face global ts_punctuation_delimiter "%opt{dark_4}"
set-face global ts_punctuation_special "%opt{red_5}"
set-face global ts_string "%opt{teal_3}"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "%opt{purple_4}"
set-face global ts_string_special "%opt{blue_4}"
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "%opt{teal_4}"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{teal_4}"
set-face global ts_type_builtin "%opt{teal_4}"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant ts_type_enum
set-face global ts_variable "%opt{dark_5}"
set-face global ts_variable_builtin "%opt{orange_4}"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "%opt{teal_5}"
set-face global ts_variable_parameter "%opt{orange_4}"

# kakoune-lsp
set-face global DiagnosticError "%opt{red_5}+u"
set-face global DiagnosticHint "%opt{blue_4}+d"
set-face global DiagnosticInfo "%opt{purple_4}+d"
set-face global DiagnosticWarning "%opt{yellow_4}+u"
set-face global LineFlagError "%opt{red_5}"
set-face global LineFlagHint "%opt{blue_3}"
set-face global LineFlagInfo "%opt{purple_3}"
set-face global LineFlagWarning "%opt{yellow_4}"
set-face global Reference "%opt{light_2},%opt{blue_1}"