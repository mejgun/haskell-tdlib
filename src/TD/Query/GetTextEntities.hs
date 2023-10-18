module TD.Query.GetTextEntities
  (GetTextEntities(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) found in the text. Can be called synchronously. Returns 'TD.Data.TextEntities.TextEntities'
data GetTextEntities
  = GetTextEntities
    { text :: Maybe T.Text -- ^ The text in which to look for entities
    }
  deriving (Eq, Show)

instance I.ShortShow GetTextEntities where
  shortShow
    GetTextEntities
      { text = text_
      }
        = "GetTextEntities"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON GetTextEntities where
  toJSON
    GetTextEntities
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "getTextEntities"
          , "text"  A..= text_
          ]

