module TD.Query.GetEmojiReaction
  (GetEmojiReaction(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about an emoji reaction. Returns a 404 error if the reaction is not found. Returns 'TD.Data.EmojiReaction.EmojiReaction'
data GetEmojiReaction
  = GetEmojiReaction
    { emoji :: Maybe T.Text -- ^ Text representation of the reaction
    }
  deriving (Eq, Show)

instance I.ShortShow GetEmojiReaction where
  shortShow
    GetEmojiReaction
      { emoji = emoji_
      }
        = "GetEmojiReaction"
          ++ I.cc
          [ "emoji" `I.p` emoji_
          ]

instance AT.ToJSON GetEmojiReaction where
  toJSON
    GetEmojiReaction
      { emoji = emoji_
      }
        = A.object
          [ "@type" A..= AT.String "getEmojiReaction"
          , "emoji" A..= emoji_
          ]

