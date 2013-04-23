# TBBuiltinThrottleFixプラグイン

MT::App::Trackback::_builtin_throttleにパッチ当てするプラグイン。

## 更新履歴

 * 0.01(2006-09-12):
   * 公開。

## 概要

Movable Type 3.xのトラックバックのスロットリング機構は(少なくとも私にとっては)おかしな挙動をします。なぜなら、

 * トラックバックの送信者のIPアドレスを検査しない
 * OneDayMaxPingsの検査において、「過去24時間の」トラックバック数との比較を行わない

という振る舞いだからです。

このプラグインは、これらの問題を修正するべくMT::App::Trackback::_builtin_throttleを上書きするものです。

## 使い方

プラグインをインストールするには、パッケージに含まれるTBBuiltinThrottleFix.plをMovable Typeのプラグインディレクトリにアップロードもしくはコピーしてください。正しくインストールできていれば、Movable TypeのメインメニューにTBBuiltinThrottleFix Pluginが新規にリストアップされます。 

以降はパッチが有効になります。

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2006, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
