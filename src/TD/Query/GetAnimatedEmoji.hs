module TD.Query.GetAnimatedEmoji
  (GetAnimatedEmoji(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji. Returns 'TD.Data.AnimatedEmoji.AnimatedEmoji'
data GetAnimatedEmoji
  = GetAnimatedEmoji
    { emoji :: Maybe T.Text -- ^ The emoji
    }
  deriving (Eq, Show)

instance I.ShortShow GetAnimatedEmoji where
  shortShow
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

