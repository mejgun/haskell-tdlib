module TD.Query.GetChatBoostLevelFeatures
  (GetChatBoostLevelFeatures(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns list of features available on the specific chat boost level; this is an offline request. Returns 'TD.Data.ChatBoostLevelFeatures.ChatBoostLevelFeatures'
data GetChatBoostLevelFeatures
  = GetChatBoostLevelFeatures
    { level :: Maybe Int -- ^ Chat boost level
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostLevelFeatures where
  shortShow
    GetChatBoostLevelFeatures
      { level = level_
      }
        = "GetChatBoostLevelFeatures"
          ++ I.cc
          [ "level" `I.p` level_
          ]

instance AT.ToJSON GetChatBoostLevelFeatures where
  toJSON
    GetChatBoostLevelFeatures
      { level = level_
      }
        = A.object
          [ "@type" A..= AT.String "getChatBoostLevelFeatures"
          , "level" A..= level_
          ]

