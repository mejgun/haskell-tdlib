module TD.Query.UpgradeGift
  (UpgradeGift(..)
  , defaultUpgradeGift
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Upgrades a gift received by the current user. Unless the gift has prepaid_upgrade_star_count > 0, the user must pay gift.upgrade_star_count Telegram Stars for the upgrade. Returns 'TD.Data.UpgradeGiftResult.UpgradeGiftResult'
data UpgradeGift
  = UpgradeGift
    { sender_user_id        :: Maybe Int  -- ^ Identifier of the user that sent the gift
    , message_id            :: Maybe Int  -- ^ Identifier of the message with the gift in the chat with the user
    , keep_original_details :: Maybe Bool -- ^ Pass true to keep the original gift text, sender and receiver in the upgraded gift
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradeGift where
  shortShow
    UpgradeGift
      { sender_user_id        = sender_user_id_
      , message_id            = message_id_
      , keep_original_details = keep_original_details_
      }
        = "UpgradeGift"
          ++ I.cc
          [ "sender_user_id"        `I.p` sender_user_id_
          , "message_id"            `I.p` message_id_
          , "keep_original_details" `I.p` keep_original_details_
          ]

instance AT.ToJSON UpgradeGift where
  toJSON
    UpgradeGift
      { sender_user_id        = sender_user_id_
      , message_id            = message_id_
      , keep_original_details = keep_original_details_
      }
        = A.object
          [ "@type"                 A..= AT.String "upgradeGift"
          , "sender_user_id"        A..= sender_user_id_
          , "message_id"            A..= message_id_
          , "keep_original_details" A..= keep_original_details_
          ]

defaultUpgradeGift :: UpgradeGift
defaultUpgradeGift =
  UpgradeGift
    { sender_user_id        = Nothing
    , message_id            = Nothing
    , keep_original_details = Nothing
    }

