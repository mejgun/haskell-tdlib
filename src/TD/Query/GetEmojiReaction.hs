module TD.Query.GetEmojiReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetEmojiReaction -- ^ Returns information about a emoji reaction. Returns a 404 error if the reaction is not found
  = GetEmojiReaction
    { emoji :: Maybe T.Text -- ^ Text representation of the reaction
    }
  deriving (Eq)

instance Show GetEmojiReaction where
  show
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
