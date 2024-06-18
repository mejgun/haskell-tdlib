module TD.Data.StarTransactionPartner
  (StarTransactionPartner(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RevenueWithdrawalState as RevenueWithdrawalState
import qualified TD.Data.ProductInfo as ProductInfo

-- | Describes source or recipient of a transaction with Telegram stars
data StarTransactionPartner
  = StarTransactionPartnerTelegram -- ^ The transaction is a transaction with Telegram through a bot
  | StarTransactionPartnerAppStore -- ^ The transaction is a transaction with App Store
  | StarTransactionPartnerGooglePlay -- ^ The transaction is a transaction with Google Play
  | StarTransactionPartnerFragment -- ^ The transaction is a transaction with Fragment
    { withdrawal_state :: Maybe RevenueWithdrawalState.RevenueWithdrawalState -- ^ State of the withdrawal; may be null for refunds from Fragment
    }
  | StarTransactionPartnerUser -- ^ The transaction is a transaction with another user
    { user_id      :: Maybe Int                     -- ^ Identifier of the user
    , product_info :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought product; may be null if none
    }
  | StarTransactionPartnerChannel -- ^ The transaction is a transaction with a channel chat
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  | StarTransactionPartnerUnsupported -- ^ The transaction is a transaction with unknown partner
  deriving (Eq, Show)

instance I.ShortShow StarTransactionPartner where
  shortShow StarTransactionPartnerTelegram
      = "StarTransactionPartnerTelegram"
  shortShow StarTransactionPartnerAppStore
      = "StarTransactionPartnerAppStore"
  shortShow StarTransactionPartnerGooglePlay
      = "StarTransactionPartnerGooglePlay"
  shortShow StarTransactionPartnerFragment
    { withdrawal_state = withdrawal_state_
    }
      = "StarTransactionPartnerFragment"
        ++ I.cc
        [ "withdrawal_state" `I.p` withdrawal_state_
        ]
  shortShow StarTransactionPartnerUser
    { user_id      = user_id_
    , product_info = product_info_
    }
      = "StarTransactionPartnerUser"
        ++ I.cc
        [ "user_id"      `I.p` user_id_
        , "product_info" `I.p` product_info_
        ]
  shortShow StarTransactionPartnerChannel
    { chat_id = chat_id_
    }
      = "StarTransactionPartnerChannel"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow StarTransactionPartnerUnsupported
      = "StarTransactionPartnerUnsupported"

instance AT.FromJSON StarTransactionPartner where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starTransactionPartnerTelegram"    -> pure StarTransactionPartnerTelegram
      "starTransactionPartnerAppStore"    -> pure StarTransactionPartnerAppStore
      "starTransactionPartnerGooglePlay"  -> pure StarTransactionPartnerGooglePlay
      "starTransactionPartnerFragment"    -> parseStarTransactionPartnerFragment v
      "starTransactionPartnerUser"        -> parseStarTransactionPartnerUser v
      "starTransactionPartnerChannel"     -> parseStarTransactionPartnerChannel v
      "starTransactionPartnerUnsupported" -> pure StarTransactionPartnerUnsupported
      _                                   -> mempty
    
    where
      parseStarTransactionPartnerFragment :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerFragment = A.withObject "StarTransactionPartnerFragment" $ \o -> do
        withdrawal_state_ <- o A..:?  "withdrawal_state"
        pure $ StarTransactionPartnerFragment
          { withdrawal_state = withdrawal_state_
          }
      parseStarTransactionPartnerUser :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerUser = A.withObject "StarTransactionPartnerUser" $ \o -> do
        user_id_      <- o A..:?  "user_id"
        product_info_ <- o A..:?  "product_info"
        pure $ StarTransactionPartnerUser
          { user_id      = user_id_
          , product_info = product_info_
          }
      parseStarTransactionPartnerChannel :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerChannel = A.withObject "StarTransactionPartnerChannel" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ StarTransactionPartnerChannel
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

