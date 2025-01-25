module TD.Query.GetUpgradedGiftWithdrawalUrl
  (GetUpgradedGiftWithdrawalUrl(..)
  , defaultGetUpgradedGiftWithdrawalUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns a URL for upgraded gift withdrawal in the TON blockchain as an NFT; requires owner privileges for gifts owned by a chat. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetUpgradedGiftWithdrawalUrl
  = GetUpgradedGiftWithdrawalUrl
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the gift
    , password         :: Maybe T.Text -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGiftWithdrawalUrl where
  shortShow
    GetUpgradedGiftWithdrawalUrl
      { received_gift_id = received_gift_id_
      , password         = password_
      }
        = "GetUpgradedGiftWithdrawalUrl"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          , "password"         `I.p` password_
          ]

instance AT.ToJSON GetUpgradedGiftWithdrawalUrl where
  toJSON
    GetUpgradedGiftWithdrawalUrl
      { received_gift_id = received_gift_id_
      , password         = password_
      }
        = A.object
          [ "@type"            A..= AT.String "getUpgradedGiftWithdrawalUrl"
          , "received_gift_id" A..= received_gift_id_
          , "password"         A..= password_
          ]

defaultGetUpgradedGiftWithdrawalUrl :: GetUpgradedGiftWithdrawalUrl
defaultGetUpgradedGiftWithdrawalUrl =
  GetUpgradedGiftWithdrawalUrl
    { received_gift_id = Nothing
    , password         = Nothing
    }

