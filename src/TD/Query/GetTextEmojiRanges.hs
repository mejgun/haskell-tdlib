module TD.Query.GetTextEmojiRanges
  (GetTextEmojiRanges(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns positions of all emoji found in the text in order of their appearance. Can be called synchronously. Returns 'TD.Data.TextRanges.TextRanges'
data GetTextEmojiRanges
  = GetTextEmojiRanges
    { text :: Maybe T.Text -- ^ The text in which to look for emoji
    }
  deriving (Eq, Show)

instance I.ShortShow GetTextEmojiRanges where
  shortShow
    GetTextEmojiRanges
      { text = text_
      }
        = "GetTextEmojiRanges"
          ++ I.cc
          [ "text" `I.p` text_
          ]

instance AT.ToJSON GetTextEmojiRanges where
  toJSON
    GetTextEmojiRanges
      { text = text_
      }
        = A.object
          [ "@type" A..= AT.String "getTextEmojiRanges"
          , "text"  A..= text_
          ]

