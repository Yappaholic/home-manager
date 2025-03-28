# palette
declare-option str type "rgb:A6E22E"
declare-option str keyword "rgb:F92672"
declare-option str regex "rgb:CE9178"
declare-option str special "rgb:C586C0"
declare-option str variable "rgb:F8F8F2"
declare-option str fn_declaration "rgb:A6E22E"
declare-option str background "rgb:272822"
declare-option str text "rgb:F8F8F2"
declare-option str active_text "rgb:FFFFFF"
declare-option str cursor "rgb:A6A6A6"
declare-option str inactive_cursor "rgb:878B91"
declare-option str widget "rgb:1E1F1C"
declare-option str selection "rgb:414339"
declare-option str tag "rgb:F92672"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default "%opt{text},%opt{background}@Default"
set-face global Default "%opt{text}@Default"

# kak-tree-sitter
set-face global ts_attribute "%opt{fn_declaration}"
set-face global ts_comment "rgb:88846F"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{variable}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character "rgb:E6DB74"
set-face global ts_constant_character_escape "rgb:AE81FF"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "rgb:AE81FF"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "%opt{fn_declaration}"
set-face global ts_diff_delta "rgb:FD971F"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "rgb:F92672"
set-face global ts_diff_plus "rgb:A6E22E"
set-face global ts_function "%opt{fn_declaration}"
set-face global ts_function_builtin "%opt{fn_declaration}"
set-face global ts_function_macro "%opt{keyword}"
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword "%opt{keyword}"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control "%opt{keyword}"
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive "%opt{keyword}"
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "%opt{keyword}"
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
set-face global ts_namespace "%opt{type}"
set-face global ts_operator "%opt{text}"
set-face global ts_punctuation "%opt{text}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter "%opt{text}"
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "%opt{keyword}"
set-face global ts_string "rgb:E6DB74"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "%opt{regex}"
set-face global ts_string_special ts_string
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "%opt{tag}"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{type}"
set-face global ts_type_builtin "rgb:66D9EF"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "%opt{text}"
set-face global ts_variable "%opt{variable}"
set-face global ts_variable_builtin "%opt{keyword}"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "%opt{variable}"
set-face global ts_variable_parameter "rgb:FD971F"

# kakoune-lsp
set-face global DiagnosticError "rgb:F48771"
set-face global DiagnosticHint "rgb:EEEEB3"
set-face global DiagnosticInfo "rgb:75BEFF"
set-face global DiagnosticWarning "rgb:CCA700"
set-face global InlayHint "rgb:88846F"
set-face global LineFlagError "rgb:F48771"
set-face global LineFlagHint "rgb:EEEEB3"
set-face global LineFlagInfo "rgb:75BEFF"
set-face global LineFlagWarning "rgb:CCA700"
set-face global Reference "rgb:888888"