module TD.Query.FixRecognizedTextWithAi
  (FixRecognizedTextWithAi(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Fixes text received as a result of speech recognition using an AI model by correcting recognition errors and adding punctuation; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.FormattedText.FormattedText'
data FixRecognizedTextWithAi
  = FixRecognizedTextWithAi
    { text :: Maybe FormattedText.FormattedText -- ^ The recognized text
    }
  deriving (Eq, Show)

instance I.ShortShow FixRecognizedTextWithAi where
  shortShow
    FixRecognizedTextWithAi
      { text = text_
      }
        = "FixRecognizedTextWithAi"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON FixRecognizedTextWithAi where
  toJSON
    FixRecognizedTextWithAi
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "fixRecognizedTextWithAi"
          , "text"  A..= text_
          ]

