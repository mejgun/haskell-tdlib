module TD.Query.TranslateText
  (TranslateText(..)
  , defaultTranslateText
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified Data.Text as T

-- | Translates a text to the given language. If the current user is a Telegram Premium user, then text formatting is preserved. Returns 'TD.Data.FormattedText.FormattedText'
data TranslateText
  = TranslateText
    { text             :: Maybe FormattedText.FormattedText -- ^ Text to translate
    , to_language_code :: Maybe T.Text                      -- ^ Language code of the language to which the message is translated. Must be one of "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et", "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko", "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pa", "ro", "ru", "sm", "gd", "sr", "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
    }
  deriving (Eq, Show)

instance I.ShortShow TranslateText where
  shortShow
    TranslateText
      { text             = text_
      , to_language_code = to_language_code_
      }
        = "TranslateText"
          ++ I.cc
          [ "text"             `I.p` text_
          , "to_language_code" `I.p` to_language_code_
          ]

instance AT.ToJSON TranslateText where
  toJSON
    TranslateText
      { text             = text_
      , to_language_code = to_language_code_
      }
        = A.object
          [ "@type"            A..= AT.String "translateText"
          , "text"             A..= text_
          , "to_language_code" A..= to_language_code_
          ]

defaultTranslateText :: TranslateText
defaultTranslateText =
  TranslateText
    { text             = Nothing
    , to_language_code = Nothing
    }

