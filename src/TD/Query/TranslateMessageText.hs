{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TranslateMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Extracts text or caption of the given message and translates it to the given language. If the current user is a Telegram Premium user, then text formatting is preserved
data TranslateMessageText = TranslateMessageText
  { -- | Language code of the language to which the message is translated. Must be one of
    -- "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",
    -- "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",
    -- "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pa", "ro", "ru", "sm", "gd", "sr",
    -- "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
    to_language_code :: Maybe String,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show TranslateMessageText where
  show
    TranslateMessageText
      { to_language_code = to_language_code_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "TranslateMessageText"
        ++ U.cc
          [ U.p "to_language_code" to_language_code_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON TranslateMessageText where
  toJSON
    TranslateMessageText
      { to_language_code = to_language_code_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "translateMessageText",
          "to_language_code" A..= to_language_code_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
