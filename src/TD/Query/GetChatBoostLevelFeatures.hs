module TD.Query.GetChatBoostLevelFeatures
  (GetChatBoostLevelFeatures(..)
  , defaultGetChatBoostLevelFeatures
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of features available on the specific chat boost level; this is an offline request. Returns 'TD.Data.ChatBoostLevelFeatures.ChatBoostLevelFeatures'
data GetChatBoostLevelFeatures
  = GetChatBoostLevelFeatures
    { is_channel :: Maybe Bool -- ^ Pass true to get the list of features for channels; pass false to get the list of features for supergroups
    , level      :: Maybe Int  -- ^ Chat boost level
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostLevelFeatures where
  shortShow
    GetChatBoostLevelFeatures
      { is_channel = is_channel_
      , level      = level_
      }
        = "GetChatBoostLevelFeatures"
          ++ I.cc
          [ "is_channel" `I.p` is_channel_
          , "level"      `I.p` level_
          ]

instance AT.ToJSON GetChatBoostLevelFeatures where
  toJSON
    GetChatBoostLevelFeatures
      { is_channel = is_channel_
      , level      = level_
      }
        = A.object
          [ "@type"      A..= AT.String "getChatBoostLevelFeatures"
          , "is_channel" A..= is_channel_
          , "level"      A..= level_
          ]

defaultGetChatBoostLevelFeatures :: GetChatBoostLevelFeatures
defaultGetChatBoostLevelFeatures =
  GetChatBoostLevelFeatures
    { is_channel = Nothing
    , level      = Nothing
    }

