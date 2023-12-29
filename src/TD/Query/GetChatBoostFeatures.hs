module TD.Query.GetChatBoostFeatures
  (GetChatBoostFeatures(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns list of features available on the first 10 chat boost levels; this is an offline request. Returns 'TD.Data.ChatBoostFeatures.ChatBoostFeatures'
data GetChatBoostFeatures
  = GetChatBoostFeatures
  deriving (Eq, Show)

instance I.ShortShow GetChatBoostFeatures where
  shortShow
    GetChatBoostFeatures
        = "GetChatBoostFeatures"

instance AT.ToJSON GetChatBoostFeatures where
  toJSON
    GetChatBoostFeatures
        = A.object
          [ "@type" A..= AT.String "getChatBoostFeatures"
          ]

