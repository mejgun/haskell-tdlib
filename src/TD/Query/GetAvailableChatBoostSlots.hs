module TD.Query.GetAvailableChatBoostSlots
  (GetAvailableChatBoostSlots(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of available chat boost slots for the current user. Returns 'TD.Data.ChatBoostSlots.ChatBoostSlots'
data GetAvailableChatBoostSlots
  = GetAvailableChatBoostSlots
  deriving (Eq, Show)

instance I.ShortShow GetAvailableChatBoostSlots where
  shortShow
    GetAvailableChatBoostSlots
        = "GetAvailableChatBoostSlots"

instance AT.ToJSON GetAvailableChatBoostSlots where
  toJSON
    GetAvailableChatBoostSlots
        = A.object
          [ "@type" A..= AT.String "getAvailableChatBoostSlots"
          ]

