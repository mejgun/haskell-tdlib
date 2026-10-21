module TD.Query.WithdrawUpgradedGift
  (WithdrawUpgradedGift(..)
  , defaultWithdrawUpgradedGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Withdraws an upgraded gift to the TON blockchain as an NFT directly to the TON wallet of the current user, which is created automatically if the user has no wallet yet; requires owner privileges for gifts owned by a chat. The user must have a valid temporary password; see createTemporaryPassword. The gift will be received by the wallet in a few seconds after the request succeeds. Returns 'TD.Data.Ok.Ok'
data WithdrawUpgradedGift
  = WithdrawUpgradedGift
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the gift
    , keep_on_profile  :: Maybe Bool   -- ^ Pass true to keep the gift displayed on the user's or the chat's profile page after withdrawal
    }
  deriving (Eq, Show)

instance I.ShortShow WithdrawUpgradedGift where
  shortShow
    WithdrawUpgradedGift
      { received_gift_id = received_gift_id_
      , keep_on_profile  = keep_on_profile_
      }
        = "WithdrawUpgradedGift"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          , "keep_on_profile"  `I.p` keep_on_profile_
          ]

instance AT.ToJSON WithdrawUpgradedGift where
  toJSON
    WithdrawUpgradedGift
      { received_gift_id = received_gift_id_
      , keep_on_profile  = keep_on_profile_
      }
        = A.object
          [ "@type"            A..= AT.String "withdrawUpgradedGift"
          , "received_gift_id" A..= received_gift_id_
          , "keep_on_profile"  A..= keep_on_profile_
          ]

defaultWithdrawUpgradedGift :: WithdrawUpgradedGift
defaultWithdrawUpgradedGift =
  WithdrawUpgradedGift
    { received_gift_id = Nothing
    , keep_on_profile  = Nothing
    }

