module TD.Query.FixTextWithAi
  (FixTextWithAi(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Fixes text using an AI model; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests. Returns 'TD.Data.FixedText.FixedText'
data FixTextWithAi
  = FixTextWithAi
    { text :: Maybe FormattedText.FormattedText -- ^ The original text
    }
  deriving (Eq, Show)

instance I.ShortShow FixTextWithAi where
  shortShow
    FixTextWithAi
      { text = text_
      }
        = "FixTextWithAi"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON FixTextWithAi where
  toJSON
    FixTextWithAi
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "fixTextWithAi"
          , "text"  A..= text_
          ]

