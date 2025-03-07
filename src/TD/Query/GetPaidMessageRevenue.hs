module TD.Query.GetPaidMessageRevenue
  (GetPaidMessageRevenue(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the total number of Telegram Stars received by the current user for paid messages from the given user. Returns 'TD.Data.StarCount.StarCount'
data GetPaidMessageRevenue
  = GetPaidMessageRevenue
    { user_id :: Maybe Int -- ^ Identifier of the user
    }
  deriving (Eq, Show)

instance I.ShortShow GetPaidMessageRevenue where
  shortShow
    GetPaidMessageRevenue
      { user_id = user_id_
      }
        = "GetPaidMessageRevenue"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetPaidMessageRevenue where
  toJSON
    GetPaidMessageRevenue
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getPaidMessageRevenue"
          , "user_id" A..= user_id_
          ]

