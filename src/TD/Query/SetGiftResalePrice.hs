module TD.Query.SetGiftResalePrice
  (SetGiftResalePrice(..)
  , defaultSetGiftResalePrice
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes resale price of a unique gift owned by the current user. Returns 'TD.Data.Ok.Ok'
data SetGiftResalePrice
  = SetGiftResalePrice
    { received_gift_id  :: Maybe T.Text -- ^ Identifier of the unique gift
    , resale_star_count :: Maybe Int    -- ^ The new price for the unique gift; 0 or getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max"). Pass 0 to disallow gift resale. The current user will receive getOption("gift_resale_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for the gift
    }
  deriving (Eq, Show)

instance I.ShortShow SetGiftResalePrice where
  shortShow
    SetGiftResalePrice
      { received_gift_id  = received_gift_id_
      , resale_star_count = resale_star_count_
      }
        = "SetGiftResalePrice"
          ++ I.cc
          [ "received_gift_id"  `I.p` received_gift_id_
          , "resale_star_count" `I.p` resale_star_count_
          ]

instance AT.ToJSON SetGiftResalePrice where
  toJSON
    SetGiftResalePrice
      { received_gift_id  = received_gift_id_
      , resale_star_count = resale_star_count_
      }
        = A.object
          [ "@type"             A..= AT.String "setGiftResalePrice"
          , "received_gift_id"  A..= received_gift_id_
          , "resale_star_count" A..= resale_star_count_
          ]

defaultSetGiftResalePrice :: SetGiftResalePrice
defaultSetGiftResalePrice =
  SetGiftResalePrice
    { received_gift_id  = Nothing
    , resale_star_count = Nothing
    }

