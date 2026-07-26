module TD.Query.TranslateRichMessage
  (TranslateRichMessage(..)
  , defaultTranslateRichMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputRichMessage as InputRichMessage
import qualified Data.Text as T

-- | Translates a rich message to the given language. Returns 'TD.Data.RichMessage.RichMessage'
data TranslateRichMessage
  = TranslateRichMessage
    { message          :: Maybe InputRichMessage.InputRichMessage -- ^ Rich message to translate
    , to_language_code :: Maybe T.Text                            -- ^ Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values
    , tone             :: Maybe T.Text                            -- ^ Tone of the translation; see translateText.tone for the list of supported values
    }
  deriving (Eq, Show)

instance I.ShortShow TranslateRichMessage where
  shortShow
    TranslateRichMessage
      { message          = message_
      , to_language_code = to_language_code_
      , tone             = tone_
      }
        = "TranslateRichMessage"
          ++ I.cc
          [ "message"          `I.p` message_
          , "to_language_code" `I.p` to_language_code_
          , "tone"             `I.p` tone_
          ]

instance AT.ToJSON TranslateRichMessage where
  toJSON
    TranslateRichMessage
      { message          = message_
      , to_language_code = to_language_code_
      , tone             = tone_
      }
        = A.object
          [ "@type"            A..= AT.String "translateRichMessage"
          , "message"          A..= message_
          , "to_language_code" A..= to_language_code_
          , "tone"             A..= tone_
          ]

defaultTranslateRichMessage :: TranslateRichMessage
defaultTranslateRichMessage =
  TranslateRichMessage
    { message          = Nothing
    , to_language_code = Nothing
    , tone             = Nothing
    }

