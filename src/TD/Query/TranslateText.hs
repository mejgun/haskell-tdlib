{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TranslateText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified Utils as U

-- |
-- Translates a text to the given language. If the current user is a Telegram Premium user, then text formatting is preserved
data TranslateText = TranslateText
  { -- | ISO language code of the language to which the message is translated. Must be one of
    -- "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",
    -- "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",
    -- "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pa", "ro", "ru", "sm", "gd", "sr",
    -- "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
    to_language_code :: Maybe String,
    -- | Text to translate
    text :: Maybe FormattedText.FormattedText
  }
  deriving (Eq)

instance Show TranslateText where
  show
    TranslateText
      { to_language_code = to_language_code_,
        text = text_
      } =
      "TranslateText"
        ++ U.cc
          [ U.p "to_language_code" to_language_code_,
            U.p "text" text_
          ]

instance T.ToJSON TranslateText where
  toJSON
    TranslateText
      { to_language_code = to_language_code_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "translateText",
          "to_language_code" A..= to_language_code_,
          "text" A..= text_
        ]
