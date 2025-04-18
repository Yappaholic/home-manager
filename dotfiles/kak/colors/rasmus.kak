# palette
declare-option str bg "rgb:1A1A19"
declare-option str fg "rgb:D1D1D1"
declare-option str black "rgb:333332"
declare-option str red "rgb:FF968C"
declare-option str green "rgb:61957F"
declare-option str yellow "rgb:FFC591"
declare-option str blue "rgb:8DB4D4"
declare-option str magenta "rgb:DE9BC8"
declare-option str cyan "rgb:7BB099"
declare-option str white "rgb:D1D1D1"
declare-option str bright_black "rgb:4C4C4B"
declare-option str bright_red "rgb:FFAFA5"
declare-option str bright_green "rgb:7AAE98"
declare-option str bright_yellow "rgb:FFDEAA"
declare-option str bright_blue "rgb:A6CDED"
declare-option str bright_magenta "rgb:F7B4E1"
declare-option str bright_cyan "rgb:94C9B2"
declare-option str bright_white "rgb:EAEAEA"
declare-option str gray01 "rgb:222221"
declare-option str gray02 "rgb:2A2A29"
declare-option str gray03 "rgb:323231"
declare-option str gray04 "rgb:3A3A39"
declare-option str gray05 "rgb:6A6A69"
declare-option str gray06 "rgb:767675"
declare-option str gray07 "rgb:B6B6B5"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default ",%opt{bg}@Default"
set-face global Default "%opt{fg}@Default"

# kak-tree-sitter
set-face global ts_attribute "cyan"
set-face global ts_comment "%opt{gray05}+i"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "bright-white"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character ts_constant
set-face global ts_constant_character_escape "magenta"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric "magenta"
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "yellow"
set-face global ts_diff_delta "%opt{bright_cyan}"
set-face global ts_diff_delta_moved ts_diff_delta
set-face global ts_diff_minus "%opt{bright_red}"
set-face global ts_diff_plus "%opt{bright_green}"
set-face global ts_function "bright-white"
set-face global ts_function_builtin "blue"
set-face global ts_function_macro "blue"
set-face global ts_function_method ts_function
set-face global ts_function_special ts_function
set-face global ts_keyword "blue"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control ts_keyword
set-face global ts_keyword_control_conditional "blue+i"
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
set-face global ts_markup_heading ts_markup
set-face global ts_markup_heading_1 "bright-white+b"
set-face global ts_markup_heading_2 "%opt{gray07}+b"
set-face global ts_markup_heading_3 "%opt{gray07}+b"
set-face global ts_markup_heading_4 "%opt{gray07}+b"
set-face global ts_markup_heading_5 "%opt{gray06}+b"
set-face global ts_markup_heading_6 "%opt{gray06}+b"
set-face global ts_markup_heading_marker "%opt{gray07}"
set-face global ts_markup_italic "+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label ts_markup_link
set-face global ts_markup_link_text "blue"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url "cyan+u"
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote ts_markup
set-face global ts_markup_raw "yellow"
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline ts_markup_raw
set-face global ts_markup_strikethrough "+s"
set-face global ts_namespace "blue+i"
set-face global ts_operator "yellow"
set-face global ts_punctuation "%opt{gray06}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter "%opt{gray06}"
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "yellow"
set-face global ts_string "cyan"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "green"
set-face global ts_string_special "blue"
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "yellow"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{bright_white}"
set-face global ts_type_builtin "magenta"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "magenta"
set-face global ts_variable "bright-white"
set-face global ts_variable_builtin "%opt{bright_blue}"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "bright-white"
set-face global ts_variable_parameter "%opt{bright_white}"

# kakoune-lsp
set-face global DiagnosticError "%opt{bright_red}"
set-face global DiagnosticHint "%opt{bright_cyan}"
set-face global DiagnosticInfo "%opt{bright_blue}"
set-face global DiagnosticWarning "%opt{bright_yellow}"
set-face global InlayHint "%opt{gray05}"
set-face global LineFlagError "%opt{bright_red}"
set-face global LineFlagHint "%opt{bright_cyan}"
set-face global LineFlagInfo "%opt{bright_blue}"
set-face global LineFlagWarning "%opt{bright_yellow}"
set-face global Reference "%opt{bright_yellow}"