﻿var _0x3bc196 = _0x1d94; (function (_0x3cd0e2, _0x5df775) { var _0x5e7b95 = _0x1d94, _0x8b89c3 = _0x3cd0e2(); while (!![]) { try { var _0x53f2ea = -parseInt(_0x5e7b95(0x1b2)) / 0x1 * (-parseInt(_0x5e7b95(0x184)) / 0x2) + parseInt(_0x5e7b95(0x17e)) / 0x3 + parseInt(_0x5e7b95(0x185)) / 0x4 + parseInt(_0x5e7b95(0x1ad)) / 0x5 + -parseInt(_0x5e7b95(0x1a6)) / 0x6 * (-parseInt(_0x5e7b95(0x173)) / 0x7) + parseInt(_0x5e7b95(0x1bd)) / 0x8 * (parseInt(_0x5e7b95(0x182)) / 0x9) + -parseInt(_0x5e7b95(0x18c)) / 0xa; if (_0x53f2ea === _0x5df775) break; else _0x8b89c3['push'](_0x8b89c3['shift']()); } catch (_0x39dde9) { _0x8b89c3['push'](_0x8b89c3['shift']()); } } }(_0x175c, 0x715cb)); function _0x3eb7() { var _0x154cb8 = _0x1d94, _0x2ae60c = [_0x154cb8(0x1aa), _0x154cb8(0x181), _0x154cb8(0x171), '3185175SdtNan', _0x154cb8(0x1ac), '1008225gCmUSx', _0x154cb8(0x1bc), _0x154cb8(0x19b), _0x154cb8(0x195), _0x154cb8(0x188), _0x154cb8(0x199), _0x154cb8(0x191)]; return _0x3eb7 = function () { return _0x2ae60c; }, _0x3eb7(); } (function (_0x26333d, _0x3ddf17) { var _0x10c100 = _0x1d94, _0x2ccdf6 = _0x4891, _0x481895 = _0x26333d(); while (!![]) { try { var _0x1ef3bc = parseInt(_0x2ccdf6(0x102)) / 0x1 * (parseInt(_0x2ccdf6(0xfd)) / 0x2) + -parseInt(_0x2ccdf6(0xf9)) / 0x3 * (parseInt(_0x2ccdf6(0xfc)) / 0x4) + -parseInt(_0x2ccdf6(0xf7)) / 0x5 + -parseInt(_0x2ccdf6(0x100)) / 0x6 + -parseInt(_0x2ccdf6(0xfe)) / 0x7 * (-parseInt(_0x2ccdf6(0xff)) / 0x8) + -parseInt(_0x2ccdf6(0xf8)) / 0x9 * (parseInt(_0x2ccdf6(0xfb)) / 0xa) + parseInt(_0x2ccdf6(0xfa)) / 0xb * (parseInt(_0x2ccdf6(0x101)) / 0xc); if (_0x1ef3bc === _0x3ddf17) break; else _0x481895[_0x10c100(0x1b9)](_0x481895['shift']()); } catch (_0x506586) { _0x481895['push'](_0x481895['shift']()); } } }(_0x3eb7, 0xb1c60)); function _0x4891(_0x66a7e, _0x1ee83d) { var _0x528c9d = _0x3eb7(); return _0x4891 = function (_0x511369, _0x39df25) { _0x511369 = _0x511369 - 0xf7; var _0xeb8380 = _0x528c9d[_0x511369]; return _0xeb8380; }, _0x4891(_0x66a7e, _0x1ee83d); } var current_chat = { 'panel': null, 'user_id': null, 'course_id': null, 'course_name': null, 'user_name': null, 'limit': 0xa, 'message': null }; function reset_clicked_user_notification(_0x4bce46) { var _0x512450 = _0x1d94; $[_0x512450(0x1b7)]({ 'url': _0x512450(0x177), 'method': _0x512450(0x1b4), 'data': { [_0x512450(0x19a) + _0x4bce46 + _0x512450(0x1b1)]: !![], 'course_id': current_chat['course_id'] }, 'success': function (_0x11c873, _0x6345b3) { var _0x363665 = _0x512450; console[_0x363665(0x1a1)](_0x11c873); }, 'error': function (_0x58a937) { var _0x49a791 = _0x512450; console[_0x49a791(0x1a1)](_0x58a937), alert(_0x49a791(0x180)); } }); } function get_notification(_0x27fb9e) { var _0x577d2d = _0x1d94; $('.' + _0x27fb9e + _0x577d2d(0x18f))['each'](function (_0x2ae532) { var _0x182be6 = _0x577d2d, _0x1c7637 = $(this)[_0x182be6(0x1a4)]('data-id'), _0x4f22c4 = _0x182be6(0x194) + _0x27fb9e + _0x182be6(0x1b1); $[_0x182be6(0x1b7)]({ 'url': _0x182be6(0x177), 'method': 'POST', 'data': { [_0x4f22c4]: !![], 'course_id': _0x1c7637 }, 'success': function (_0x51f979, _0x55df8a) { var _0x33a9ec = _0x182be6; console[_0x33a9ec(0x1a1)](_0x51f979); var _0x3786bb = _0x51f979[_0x33a9ec(0x1ab)], _0x5740ef = _0x51f979['time'], _0x3074ab = $('#' + _0x27fb9e + _0x33a9ec(0x1ae) + _0x1c7637), _0x5f5038 = $('#' + _0x27fb9e + '_chat_time' + _0x1c7637); _0x5740ef != '' && _0x3786bb == '' && (_0x3074ab[_0x33a9ec(0x17d)](_0x33a9ec(0x196)), _0x3074ab[_0x33a9ec(0x18d)](_0x33a9ec(0x16a)), _0x3074ab[_0x33a9ec(0x18b)](_0x3786bb), _0x5f5038[_0x33a9ec(0x18b)](timeDifference(_0x5740ef))); if (_0x5740ef != '' && _0x3786bb == '0') _0x3074ab[_0x33a9ec(0x17d)](_0x33a9ec(0x196)), _0x3074ab[_0x33a9ec(0x18d)](_0x33a9ec(0x16a)), _0x3074ab['text'](_0x3786bb), _0x5f5038['text'](timeDifference(_0x5740ef)); else _0x5740ef != '' && _0x3786bb != '' && (_0x3074ab['removeClass'](_0x33a9ec(0x196)), _0x3074ab['addClass'](_0x33a9ec(0x16a)), _0x3074ab[_0x33a9ec(0x18b)](_0x3786bb), _0x5f5038[_0x33a9ec(0x18b)](timeDifference(_0x5740ef))); }, 'error': function () { var _0x4e90f4 = _0x182be6; alert(_0x4e90f4(0x1ba)); } }); }); } function fetch_messages(_0xffad62, _0x6fde24) { var _0x372129 = _0x1d94; $['ajax']({ 'url': _0x372129(0x177), 'method': _0x372129(0x1b4), 'data': { 'limit': current_chat[_0x372129(0x1a9)], 'course_id': current_chat[_0x372129(0x198)], 'token': _0x6fde24, 'current_chat_id': current_chat['user_id'] }, 'success': function (_0x152ca9, _0x574058) { var _0x2f9354 = _0x372129; console[_0x2f9354(0x1a1)](_0x152ca9), $('.' + _0xffad62 + _0x2f9354(0x1b8))[_0x2f9354(0x169)](current_chat[_0x2f9354(0x1b5)]), $('.' + _0xffad62 + _0x2f9354(0x16d))[_0x2f9354(0x169)](''), _0x152ca9[_0x2f9354(0x17f)]((_0x235ccf, _0x46356f) => { var _0x3387ca = _0x2f9354, _0x443c52 = _0x235ccf[_0x3387ca(0x16e)], _0x304d7b = _0x235ccf[_0x3387ca(0x174)], _0xedb595 = _0x235ccf['user_id'], _0x58f595 = _0x235ccf['message']; _0x152ca9[0x0][_0x3387ca(0x1af)][_0x3387ca(0x17c)]() == current_chat[_0x3387ca(0x1af)][_0x3387ca(0x17c)]() ? _0x235ccf[_0x3387ca(0x1af)] == current_chat['user_id'] ? $('.' + _0xffad62 + '_chat_messages_box')['append'](left_box(_0x443c52, _0x58f595, _0x304d7b)) : $('.' + _0xffad62 + _0x3387ca(0x16d))['append'](right_box(_0x443c52, _0x58f595, _0x304d7b)) : _0x235ccf[_0x3387ca(0x1af)] != current_chat[_0x3387ca(0x1af)] ? $('.' + _0xffad62 + '_chat_messages_box')['append'](left_box(_0x443c52, _0x58f595, _0x304d7b)) : $('.' + _0xffad62 + _0x3387ca(0x16d))[_0x3387ca(0x175)](right_box(_0x443c52, _0x58f595, _0x304d7b)); }); }, 'error': function () { alert('chat\x20fetch\x20error'); } }); } function _0x175c() { var _0x15c7f7 = ['1077128uAXSKS', 'panel', 'data-course', 'get_', '4EsuiFZ', 'label-light-success', '</span>\x0a\x09\x09\x09\x09\x09\x09</div>\x0a\x09\x09\x09\x09\x09</div>\x0a\x09\x09\x09\x09\x09<div\x20class=\x22mt-2\x20rounded\x20p-5\x20bg-light-success\x20text-dark-50\x20font-weight-bold\x20font-size-lg\x20text-left\x20max-w-400px\x22>', 'course_id', '7gRIAWL', 'reset_', '330npQlil', 'getAttribute', '_chat_submit_button', '\x20days\x20ago', 'currentTarget', 'val', 'log', 'message', '\x20minutes\x20ago', 'attr', '\x20seconds\x20ago', '6DSoJxS', 'data-id', 'toString', 'limit', '6120570xFmZZP', 'notification', '5283KOkDns', '3353740BTTsNM', '_chat_notification', 'user_id', 'keyup\x20keydown\x20keypres', '_notification', '262gwGWWc', 'get_private_messages', 'POST', 'course_name', 'substring', 'ajax', '_chat_header', 'push', 'chat\x20notification\x20fetch\x20error', 'btn-primary', '11HWWRhc', '97456THXnic', 'data-user-name', 'html', 'label-danger', '_chat_textarea', '\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<!--begin::Message\x20In-->\x0a\x09\x09\x09\x09<div\x20class=\x22d-flex\x20flex-column\x20mb-5\x20align-items-end\x22>\x0a\x09\x09\x09\x09\x09<div\x20class=\x22d-flex\x20align-items-center\x22>\x0a\x09\x09\x09\x09\x09\x09<div\x20class=\x22symbol\x20symbol-circle\x20symbol-50\x20mr-3\x20mt-2\x20\x20p-5\x20bg-success\x20text-white\x20font-weight-bold\x20font-size-lg\x20\x20\x22\x20\x20style=\x27text-transform:\x20uppercase;\x27>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20', '_chat_messages_box', 'user_name', 'get', 'length', '4REjkjQ', 'parse', '1938370JCqgmT', 'time', 'append', 'get_group_messages', 'rest-chat-get', '</a>\x0a\x09\x09\x09\x09\x09\x09\x09<span\x20class=\x22text-muted\x20font-size-sm\x22>', 'btn-disable', '\x0a\x09\x09\x09\x09\x09\x09</div>\x0a\x09\x09\x09\x09\x09\x09<div>\x0a\x09\x09\x09\x09\x09\x09\x09<a\x20href=\x22#\x22\x20class=\x22text-dark-75\x20text-hover-primary\x20font-weight-bold\x20font-size-h6\x22>', 'private', 'trim', 'addClass', '1044675MOwIjb', 'forEach', 'reset\x20chat\x20notification\x20fetch\x20error', '27628788yyrGbE', '657yIkiBK', 'location', '6056gVhvBe', '718760dECPFl', 'toLowerCase', '</div>\x0a\x09\x09\x09\x09</div>\x0a\x09\x09\x09\x09<!--end::Message\x20In-->\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20', '151848MKLauu', 'group', 'data-user-id', 'text', '26938640QhgvdZ', 'removeClass', 'lecturer-group-view', '_chat_user', 'round']; _0x175c = function () { return _0x15c7f7; }; return _0x175c(); } function timeDifference(_0x2b4fee) { var _0x1d54a4 = _0x1d94, _0x1c3bcd = 0x3c * 0x3e8, _0x47381f = _0x1c3bcd * 0x3c, _0x3892ab = _0x47381f * 0x18, _0x16ee05 = _0x3892ab * 0x1e, _0x4133c7 = _0x3892ab * 0x16d, _0x19cc61 = new Date() - Date[_0x1d54a4(0x172)](_0x2b4fee); if (_0x19cc61 < _0x1c3bcd) return Math['round'](_0x19cc61 / 0x3e8) + _0x1d54a4(0x1a5); else { if (_0x19cc61 < _0x47381f) return Math[_0x1d54a4(0x190)](_0x19cc61 / _0x1c3bcd) + _0x1d54a4(0x1a3); else { if (_0x19cc61 < _0x3892ab) return Math[_0x1d54a4(0x190)](_0x19cc61 / _0x47381f) + '\x20hours\x20ago'; else { if (_0x19cc61 < _0x16ee05) return Math[_0x1d54a4(0x190)](_0x19cc61 / _0x3892ab) + _0x1d54a4(0x19e); else return _0x19cc61 < _0x4133c7 ? Math['round'](_0x19cc61 / _0x16ee05) + '\x20months\x20ago' : Math['round'](_0x19cc61 / _0x4133c7) + '\x20years\x20ago'; } } } } function left_box(_0x10d455, _0x135dc0, _0x23d114) { var _0x38c841 = _0x1d94, _0x5466e9 = timeDifference(_0x23d114); return '\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20<!--begin::Message\x20In-->\x0a\x09\x09\x09\x09<div\x20class=\x22d-flex\x20flex-column\x20mb-5\x20align-items-start\x22>\x0a\x09\x09\x09\x09\x09<div\x20class=\x22d-flex\x20align-items-center\x22>\x0a\x09\x09\x09\x09\x09\x09<div\x20class=\x22symbol\x20symbol-circle\x20symbol-50\x20mr-3\x20mt-2\x20\x20p-5\x20bg-success\x20text-white\x20font-weight-bold\x20font-size-lg\x20\x20\x22\x20style=\x27text-transform:\x20uppercase;\x27>\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20' + _0x10d455[_0x38c841(0x1b6)](0x0, 0x2) + _0x38c841(0x17a) + _0x10d455 + _0x38c841(0x178) + _0x5466e9 + _0x38c841(0x197) + _0x135dc0 + _0x38c841(0x187); } function right_box(_0x3d9266, _0x4fcb1d, _0x4f8eda) { var _0x2c3fae = _0x1d94, _0xde312a = timeDifference(_0x4f8eda); return _0x2c3fae(0x16c) + _0x3d9266[_0x2c3fae(0x1b6)](0x0, 0x2) + _0x2c3fae(0x17a) + _0x3d9266 + _0x2c3fae(0x178) + _0xde312a + _0x2c3fae(0x197) + _0x4fcb1d + _0x2c3fae(0x187); } function change_user_chat(_0x56ead1, _0x21459b) { var _0x52c0ab = _0x1d94; $('.' + _0x56ead1 + _0x52c0ab(0x18f))['click'](_0x55bc42 => { var _0x573677 = _0x52c0ab; current_chat[_0x573677(0x192)] = _0x55bc42, current_chat['user_id'] = _0x55bc42[_0x573677(0x19f)][_0x573677(0x19c)](_0x573677(0x18a)), current_chat['course_id'] = _0x55bc42[_0x573677(0x19f)][_0x573677(0x19c)](_0x573677(0x1a7)), current_chat[_0x573677(0x1b5)] = _0x55bc42[_0x573677(0x19f)][_0x573677(0x19c)](_0x573677(0x193)), current_chat[_0x573677(0x16e)] = _0x55bc42[_0x573677(0x19f)][_0x573677(0x19c)](_0x573677(0x1be)), fetch_messages(_0x56ead1, _0x21459b), reset_clicked_user_notification(_0x56ead1), get_notification(_0x56ead1); }); } change_user_chat(_0x3bc196(0x189), 'get_group_messages'), change_user_chat('private', _0x3bc196(0x1b3)); function pageLoad(_0x1f4545, _0x3a4a93) { var _0x4b1c66 = _0x3bc196; if ($('.' + _0x1f4545 + _0x4b1c66(0x18f))[_0x4b1c66(0x170)] > 0x0) { var _0x2e0f6f = $('.' + _0x1f4545 + _0x4b1c66(0x18f))[_0x4b1c66(0x16f)](0x0); current_chat[_0x4b1c66(0x192)] = _0x2e0f6f, current_chat[_0x4b1c66(0x1af)] = _0x2e0f6f[_0x4b1c66(0x19c)](_0x4b1c66(0x18a)), current_chat['course_id'] = _0x2e0f6f[_0x4b1c66(0x19c)](_0x4b1c66(0x1a7)), current_chat[_0x4b1c66(0x1b5)] = _0x2e0f6f['getAttribute']('data-course'), current_chat['user_name'] = _0x2e0f6f[_0x4b1c66(0x19c)]('data-user-name'), fetch_messages(_0x1f4545, _0x3a4a93), get_notification(_0x1f4545); } } pageLoad('group', 'get_group_messages'), pageLoad(_0x3bc196(0x17b), _0x3bc196(0x1b3)); function chat_textArea(_0x5effe7) { var _0x2eb80f = _0x3bc196; $('.' + _0x5effe7 + _0x2eb80f(0x19d))[_0x2eb80f(0x18d)]('btn-primary'), $('.' + _0x5effe7 + _0x2eb80f(0x19d))[_0x2eb80f(0x17d)](_0x2eb80f(0x179)), $('.' + _0x5effe7 + _0x2eb80f(0x16b))['on'](_0x2eb80f(0x1b0), _0xa6b202 => { var _0x93695f = _0x2eb80f, _0x198117 = $('.' + _0x5effe7 + '_chat_textarea')[_0x93695f(0x1a0)](); current_chat[_0x93695f(0x1a2)] = _0x198117, _0x198117[_0x93695f(0x17c)]()['length'] == 0x0 ? ($('.' + _0x5effe7 + _0x93695f(0x19d))[_0x93695f(0x18d)]('btn-primary'), $('.' + _0x5effe7 + _0x93695f(0x19d))[_0x93695f(0x17d)]('btn-disable')) : ($('.' + _0x5effe7 + _0x93695f(0x19d))[_0x93695f(0x18d)](_0x93695f(0x179)), $('.' + _0x5effe7 + '_chat_submit_button')[_0x93695f(0x17d)]('btn-primary')); }); } chat_textArea(_0x3bc196(0x189)), chat_textArea('private'); function send_message(_0x34659a, _0x11dabd, _0x5a09d0) { var _0x2ee5a3 = _0x3bc196; $('.' + _0x34659a + _0x2ee5a3(0x19d))['click'](_0x459d62 => { var _0x5aa449 = _0x2ee5a3, _0x49b7da = window[_0x5aa449(0x183)]['href'][_0x5aa449(0x186)](); if (_0x49b7da['includes'](_0x11dabd)) { var _0x2f453d = $('.' + _0x34659a + _0x5aa449(0x16b))[_0x5aa449(0x1a0)](); if (_0x2f453d[_0x5aa449(0x17c)]()['length'] == 0x0) return ![]; $('.' + _0x34659a + _0x5aa449(0x16b))[_0x5aa449(0x1a0)](''), $('.' + _0x34659a + '_chat_submit_button')['removeClass'](_0x5aa449(0x1bb)), $('.' + _0x34659a + _0x5aa449(0x19d))['addClass'](_0x5aa449(0x179)), $['post'](_0x11dabd, { 'user_name': current_chat[_0x5aa449(0x16e)], 'course_id': current_chat[_0x5aa449(0x198)], 'user_id': current_chat[_0x5aa449(0x1af)], 'time': new Date()[_0x5aa449(0x1a8)](), 'message': _0x2f453d }, (_0x324ddb, _0x5e1e68) => { var _0xa25a9f = _0x5aa449; console[_0xa25a9f(0x1a1)](_0x324ddb), console[_0xa25a9f(0x1a1)](_0x5e1e68), fetch_messages(_0x34659a, _0x5a09d0), get_notification(_0x34659a); }); } }); } send_message(_0x3bc196(0x189), 'student-group-view', _0x3bc196(0x176)), send_message(_0x3bc196(0x17b), 'student-chat-view', _0x3bc196(0x1b3)), send_message(_0x3bc196(0x189), _0x3bc196(0x18e), _0x3bc196(0x176)), send_message('private', 'lecture-private-chat', _0x3bc196(0x1b3)); function update_pooling_chat(_0xf2fb05, _0x5d656e, _0x550c61 = 0x1b58) { var _0x15da0e = _0x3bc196; $('.' + _0xf2fb05 + _0x15da0e(0x18f))['length'] > 0x0 && setInterval(() => { get_notification(_0xf2fb05), fetch_messages(_0xf2fb05, _0x5d656e); }, _0x550c61); } function _0x1d94(_0x5adc11, _0x56e7c5) { var _0x175c13 = _0x175c(); return _0x1d94 = function (_0x1d9408, _0x36cecf) { _0x1d9408 = _0x1d9408 - 0x169; var _0x401d6c = _0x175c13[_0x1d9408]; return _0x401d6c; }, _0x1d94(_0x5adc11, _0x56e7c5); } update_pooling_chat('group', _0x3bc196(0x176)), update_pooling_chat(_0x3bc196(0x17b), _0x3bc196(0x1b3));