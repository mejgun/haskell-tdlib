module TD.Query.GetAnimatedEmoji where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetAnimatedEmoji -- ^ Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji
  = GetAnimatedEmoji
    { emoji :: Maybe T.Text -- ^ The emoji
    }
  deriving (Eq)

instance Show GetAnimatedEmoji where
  show
    GetAnimatedEmoji
      { emoji = emoji_
      }
        = "GetAnimatedEmoji"
          ++ I.cc
          [ "emoji" `I.p` emoji_
          ]

instance AT.ToJSON GetAnimatedEmoji where
  toJSON
    GetAnimatedEmoji
      { emoji = emoji_
      }
        = A.object
          [ "@type" A..= AT.String "getAnimatedEmoji"
          , "emoji" A..= emoji_
          ]
