# palette
declare-option str red "rgb:FF757F"
declare-option str orange "rgb:FF966C"
declare-option str yellow "rgb:FFC777"
declare-option str light_green "rgb:C3E88D"
declare-option str green "rgb:4FD6BE"
declare-option str aqua "rgb:65BCFF"
declare-option str teal "rgb:4FD6BE"
declare-option str turquoise "rgb:89DDFF"
declare-option str light_cyan "rgb:B4F9F8"
declare-option str cyan "rgb:86E1FC"
declare-option str blue "rgb:82AAFF"
declare-option str purple "rgb:FCA7EA"
declare-option str magenta "rgb:C099FF"
declare-option str comment "rgb:636DA6"
declare-option str black "rgb:444A73"
declare-option str add "rgb:B8DB87"
declare-option str change "rgb:7CA1F2"
declare-option str delete "rgb:E26A75"
declare-option str error "rgb:C53B53"
declare-option str hint "rgb:4FD6BE"
declare-option str info "rgb:0DB9D7"
declare-option str fg "rgb:C8D3F5"
declare-option str fg_dark "rgb:828BB8"
declare-option str fg_gutter "rgb:3B4261"
declare-option str fg_linenr "rgb:737AA2"
declare-option str fg_selected "rgb:363C58"
declare-option str border "rgb:1B1D2B"
declare-option str border_highlight "rgb:589ED7"
declare-option str bg "rgb:222436"
declare-option str bg_inlay "rgb:273644"
declare-option str bg_highlight "rgb:2F334D"
declare-option str bg_menu "rgb:1E2030"
declare-option str bg_visual "rgb:2D3F76"

# Standard Kakoune
set-face global Default default,default,default
set-face global Default "%opt{fg},%opt{bg}@Default"
set-face global Default "%opt{fg},%opt{bg}@Default"

# kak-tree-sitter
set-face global ts_attribute "cyan"
set-face global ts_comment "%opt{comment}+i"
set-face global ts_comment_block ts_comment
set-face global ts_comment_line ts_comment
set-face global ts_constant "%opt{orange}"
set-face global ts_constant_builtin ts_constant
set-face global ts_constant_builtin_boolean ts_constant_builtin
set-face global ts_constant_character "bright-green"
set-face global ts_constant_character_escape "magenta"
set-face global ts_constant_macro ts_constant
set-face global ts_constant_numeric ts_constant
set-face global ts_constant_numeric_float ts_constant_numeric
set-face global ts_constant_numeric_integer ts_constant_numeric
set-face global ts_constructor "%opt{aqua}"
set-face global ts_diff_delta "%opt{change}"
set-face global ts_diff_delta_moved "blue"
set-face global ts_diff_minus "%opt{delete}"
set-face global ts_diff_plus "%opt{add}"
set-face global ts_function "blue+i"
set-face global ts_function_builtin "%opt{aqua}"
set-face global ts_function_macro "cyan"
set-face global ts_function_method ts_function
set-face global ts_function_special "cyan"
set-face global ts_keyword "%opt{purple}+i"
set-face global ts_keyword_conditional ts_keyword
set-face global ts_keyword_control "magenta"
set-face global ts_keyword_control_conditional ts_keyword_control
set-face global ts_keyword_control_directive ts_keyword_control
set-face global ts_keyword_control_except ts_keyword_control
set-face global ts_keyword_control_exception ts_keyword_control
set-face global ts_keyword_control_import "cyan"
set-face global ts_keyword_control_repeat ts_keyword_control
set-face global ts_keyword_control_return "%opt{purple}+i"
set-face global ts_keyword_directive "cyan"
set-face global ts_keyword_function "magenta"
set-face global ts_keyword_operator "magenta"
set-face global ts_keyword_special ts_keyword
set-face global ts_keyword_storage ts_keyword
set-face global ts_keyword_storage_modifier ts_keyword_storage
set-face global ts_keyword_storage_modifier_mut ts_keyword_storage_modifier
set-face global ts_keyword_storage_modifier_ref ts_keyword_storage_modifier
set-face global ts_keyword_storage_type ts_keyword_storage
set-face global ts_label "blue"
set-face global ts_markup_bold "+b"
set-face global ts_markup_heading "blue+b"
set-face global ts_markup_heading_1 ts_markup_heading
set-face global ts_markup_heading_2 ts_markup_heading
set-face global ts_markup_heading_3 ts_markup_heading
set-face global ts_markup_heading_4 ts_markup_heading
set-face global ts_markup_heading_5 ts_markup_heading
set-face global ts_markup_heading_6 ts_markup_heading
set-face global ts_markup_heading_marker ts_markup_heading
set-face global ts_markup_italic "+i"
set-face global ts_markup_link ts_markup
set-face global ts_markup_link_label "%opt{teal}"
set-face global ts_markup_link_text "%opt{teal}"
set-face global ts_markup_link_uri ts_markup_link
set-face global ts_markup_link_url ""
set-face global ts_markup_list ts_markup
set-face global ts_markup_list_checked ts_markup_list
set-face global ts_markup_list_numbered ts_markup_list
set-face global ts_markup_list_unchecked ts_markup_list
set-face global ts_markup_list_unnumbered ts_markup_list
set-face global ts_markup_quote ts_markup
set-face global ts_markup_raw "%opt{teal}"
set-face global ts_markup_raw_block ts_markup_raw
set-face global ts_markup_raw_inline "blue,black"
set-face global ts_markup_strikethrough "+s"
set-face global ts_namespace "cyan"
set-face global ts_operator "%opt{turquoise}"
set-face global ts_punctuation "%opt{turquoise}"
set-face global ts_punctuation_bracket ts_punctuation
set-face global ts_punctuation_delimiter ts_punctuation
set-face global ts_punctuation_special ts_punctuation
set-face global ts_special "%opt{aqua}"
set-face global ts_string "bright-green"
set-face global ts_string_escape ts_string
set-face global ts_string_regex ts_string
set-face global ts_string_regexp "bright-cyan"
set-face global ts_string_special "%opt{aqua}"
set-face global ts_string_special_path ts_string_special
set-face global ts_string_special_symbol ts_string_special
set-face global ts_string_symbol ts_string
set-face global ts_tag "magenta"
set-face global ts_tag_error ts_tag
set-face global ts_text_title ts_text
set-face global ts_type "%opt{aqua}"
set-face global ts_type_builtin "%opt{aqua}"
set-face global ts_type_enum ts_type
set-face global ts_type_enum_variant "%opt{orange}"
set-face global ts_variable "%opt{fg}"
set-face global ts_variable_builtin "red"
set-face global ts_variable_other ts_variable
set-face global ts_variable_other_member "green"
set-face global ts_variable_parameter "yellow+i"

# kakoune-lsp
set-face global DiagnosticError "%opt{error}"
set-face global DiagnosticHint "%opt{hint}"
set-face global DiagnosticInfo "%opt{info}"
set-face global DiagnosticWarning "yellow"
set-face global InlayHint "%opt{teal},%opt{bg_inlay}"
set-face global LineFlagError "%opt{error}"
set-face global LineFlagHint "%opt{hint}"
set-face global LineFlagInfo "%opt{info}"
set-face global LineFlagWarning "yellow"
set-face global Reference "%opt{orange}+b"