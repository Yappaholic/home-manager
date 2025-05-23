# palette
declare-option str error "rgb:FCA5A5"
declare-option str bg "rgb:0F1014"
declare-option str fg "rgb:C9C7CD"
declare-option str green "rgb:90B99F"
declare-option str bright_green "rgb:9DC6AC"
declare-option str yellow "rgb:E5C890"
declare-option str blue "rgb:ACA1CF"
declare-option str bright_blue "rgb:B9AEDA"
declare-option str magenta "rgb:E29ECA"
declare-option str cyan "rgb:EA83A5"
declare-option str bright_cyan "rgb:F591B2"
declare-option str white "rgb:C1C0D4"
declare-option str bright_white "rgb:CAC9DD"
declare-option str gray01 "rgb:1B1B1D"
declare-option str gray02 "rgb:2A2A2D"
declare-option str gray03 "rgb:3E3E43"
declare-option str gray04 "rgb:57575F"
declare-option str gray06 "rgb:9998A8"
declare-option str gray07 "rgb:C1C0D4"
declare-option str comment "rgb:808080"
declare-option str red "rgb:E78284"
declare-option str function "rgb:E5C890"
declare-option str support_function "rgb:9898A6"
declare-option str constant "rgb:8EB6F5"
declare-option str string "rgb:9898A6"
declare-option str tag "rgb:9898A6"
declare-option str keyword "rgb:8EB6F5"
declare-option str namespace "rgb:C58FFF"
declare-option str numeric "rgb:E9C46A"
declare-option str status_line_fg "rgb:E5C890"
declare-option str operator "rgb:8EB6F5"
declare-option str softwrap "rgb:808080"
declare-option str conditional "rgb:A8A29E"
declare-option str cursor "rgb:E5C890"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default ",%opt{bg}@Default"
set-face global Default "%opt{fg}@Default"

# kak-tree-sitter
set-face global ts_attribute "blue+i"
set-face global ts_comment "%opt{comment}+i"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{constant}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape "cyan"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "%opt{numeric}"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "yellow"
set-face global ts_diff_delta "%opt{bright_blue}"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "red"
set-face global ts_diff_plus "%opt{bright_green}"
set-face global ts_function "%opt{function}+i"
set-face global ts_function_builtin "%opt{support_function}"
set-face global ts_function_macro "%opt{bright_cyan}"
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword "%opt{keyword}"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional "%opt{conditional}+i"
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import ts_keyword_control
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return ts_keyword_control
set-face global ts_keyword_directive "magenta"
set-face global ts_keyword_function ts_keyword
set-face global ts_keyword_operator ts_keyword
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "yellow"
set-face global ts_markup_bold "+b"
set-face global ts_markup_heading "%opt{bright_blue}+b"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker "%opt{gray06}"
set-face global ts_markup_italic "+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text "blue+i"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "green+u"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote ts_markup
set-face global ts_markup_raw "yellow"
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough ts_markup
set-face global ts_namespace "%opt{namespace}+i"
set-face global ts_operator "%opt{operator}"
set-face global ts_punctuation "%opt{gray06}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter "%opt{gray06}"
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "yellow"
set-face global ts_string "%opt{string}"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "green"
set-face global ts_string_special "yellow"
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "%opt{tag}"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{bright_blue}"
set-face global ts_type_builtin "magenta"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "magenta"
set-face global ts_variable "%opt{fg}"
set-face global ts_variable_builtin "%opt{bright_blue}"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "bright-white"
set-face global ts_variable_parameter "bright-white+i"

# kakoune-lsp
set-face global InlayHint "%opt{gray03}"
set-face global LineFlagError "%opt{error}"
set-face global LineFlagHint "%opt{bright_cyan}"
set-face global LineFlagInfo "%opt{bright_blue}"
set-face global LineFlagWarning "yellow"
set-face global Reference "yellow+bu"