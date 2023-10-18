module TD.Query.TranslateMessageText
  (TranslateMessageText(..)
  , defaultTranslateMessageText
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Extracts text or caption of the given message and translates it to the given language. If the current user is a Telegram Premium user, then text formatting is preserved. Returns 'TD.Data.FormattedText.FormattedText'
data TranslateMessageText
  = TranslateMessageText
    { chat_id          :: Maybe Int    -- ^ Identifier of the chat to which the message belongs
    , message_id       :: Maybe Int    -- ^ Identifier of the message
    , to_language_code :: Maybe T.Text -- ^ Language code of the language to which the message is translated. Must be one of "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et", "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko", "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pa", "ro", "ru", "sm", "gd", "sr", "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
    }
  deriving (Eq, Show)

instance I.ShortShow TranslateMessageText where
  shortShow
    TranslateMessageText
      { chat_id          = chat_id_
      , message_id       = message_id_
      , to_language_code = to_language_code_
      }
        = "TranslateMessageText"
          ++ I.cc
          [ "chat_id"          `I.p` chat_id_
          , "message_id"       `I.p` message_id_
          , "to_language_code" `I.p` to_language_code_
          ]

instance AT.ToJSON TranslateMessageText where
  toJSON
    TranslateMessageText
      { chat_id          = chat_id_
      , message_id       = message_id_
      , to_language_code = to_language_code_
      }
        = A.object
          [ "@type"            A..= AT.String "translateMessageText"
          , "chat_id"          A..= chat_id_
          , "message_id"       A..= message_id_
          , "to_language_code" A..= to_language_code_
          ]

defaultTranslateMessageText :: TranslateMessageText
defaultTranslateMessageText =
  TranslateMessageText
    { chat_id          = Nothing
    , message_id       = Nothing
    , to_language_code = Nothing
    }

