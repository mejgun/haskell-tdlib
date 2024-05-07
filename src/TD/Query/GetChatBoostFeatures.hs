module TD.Query.GetChatBoostFeatures
  (GetChatBoostFeatures(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of features available for different chat boost levels; this is an offline request. Returns 'TD.Data.ChatBoostFeatures.ChatBoostFeatures'
data GetChatBoostFeatures
  = GetChatBoostFeatures
    { is_channel :: Maybe Bool -- ^ Pass true to get the list of features for channels; pass false to get the list of features for supergroups
    }
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostFeatures where
  shortShow
    GetChatBoostFeatures
      { is_channel = is_channel_
      }
        = "GetChatBoostFeatures"
          ++ I.cc
          [ "is_channel" `I.p` is_channel_
          ]

instance AT.ToJSON GetChatBoostFeatures where
  toJSON
    GetChatBoostFeatures
      { is_channel = is_channel_
      }
        = A.object
          [ "@type"      A..= AT.String "getChatBoostFeatures"
          , "is_channel" A..= is_channel_
          ]

