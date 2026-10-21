module TD.Query.GetUpgradedGiftDepositInfo
  (GetUpgradedGiftDepositInfo(..)
  , defaultGetUpgradedGiftDepositInfo
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Returns information needed to deposit an upgraded gift from the TON wallet of the current user to a Telegram account. Use sendTonWalletTransfer to complete transfer of the gift. The gift will be received by the new owner with a message about the gift after the transfer is confirmed in the blockchain. Returns 'TD.Data.UpgradedGiftDepositInfo.UpgradedGiftDepositInfo'
data GetUpgradedGiftDepositInfo
  = GetUpgradedGiftDepositInfo
    { owner_id    :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that will receive the gift
    , name        :: Maybe T.Text                      -- ^ Unique name of the upgraded gift
    , hide_sender :: Maybe Bool                        -- ^ Pass true to hide the sender of the gift in the message received by the new owner
    }
  deriving (Eq, Show)

instance I.ShortShow GetUpgradedGiftDepositInfo where
  shortShow
    GetUpgradedGiftDepositInfo
      { owner_id    = owner_id_
      , name        = name_
      , hide_sender = hide_sender_
      }
        = "GetUpgradedGiftDepositInfo"
          ++ I.cc
          [ "owner_id"    `I.p` owner_id_
          , "name"        `I.p` name_
          , "hide_sender" `I.p` hide_sender_
          ]

instance AT.ToJSON GetUpgradedGiftDepositInfo where
  toJSON
    GetUpgradedGiftDepositInfo
      { owner_id    = owner_id_
      , name        = name_
      , hide_sender = hide_sender_
      }
        = A.object
          [ "@type"       A..= AT.String "getUpgradedGiftDepositInfo"
          , "owner_id"    A..= owner_id_
          , "name"        A..= name_
          , "hide_sender" A..= hide_sender_
          ]

defaultGetUpgradedGiftDepositInfo :: GetUpgradedGiftDepositInfo
defaultGetUpgradedGiftDepositInfo =
  GetUpgradedGiftDepositInfo
    { owner_id    = Nothing
    , name        = Nothing
    , hide_sender = Nothing
    }

