module TD.Query.GetStarGiftPaymentOptions
  (GetStarGiftPaymentOptions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns available options for Telegram Stars gifting. Returns 'TD.Data.StarPaymentOptions.StarPaymentOptions'
data GetStarGiftPaymentOptions
  = GetStarGiftPaymentOptions
    { user_id :: Maybe Int -- ^ Identifier of the user that will receive Telegram Stars; pass 0 to get options for an unspecified user
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarGiftPaymentOptions where
  shortShow
    GetStarGiftPaymentOptions
      { user_id = user_id_
      }
        = "GetStarGiftPaymentOptions"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetStarGiftPaymentOptions where
  toJSON
    GetStarGiftPaymentOptions
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getStarGiftPaymentOptions"
          , "user_id" A..= user_id_
          ]

