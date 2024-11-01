module TD.Data.StarTransactionPartner
  (StarTransactionPartner(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RevenueWithdrawalState as RevenueWithdrawalState
import qualified TD.Data.BotTransactionPurpose as BotTransactionPurpose
import qualified TD.Data.PaidMedia as PaidMedia
import qualified TD.Data.ChatTransactionPurpose as ChatTransactionPurpose
import qualified TD.Data.UserTransactionPurpose as UserTransactionPurpose

-- | Describes source or recipient of a transaction with Telegram Stars
data StarTransactionPartner
  = StarTransactionPartnerTelegram -- ^ The transaction is a transaction with Telegram through a bot
  | StarTransactionPartnerAppStore -- ^ The transaction is a transaction with App Store
  | StarTransactionPartnerGooglePlay -- ^ The transaction is a transaction with Google Play
  | StarTransactionPartnerFragment -- ^ The transaction is a transaction with Fragment
    { withdrawal_state :: Maybe RevenueWithdrawalState.RevenueWithdrawalState -- ^ State of the withdrawal; may be null for refunds from Fragment or for Telegram Stars bought on Fragment
    }
  | StarTransactionPartnerTelegramAds -- ^ The transaction is a transaction with Telegram Ad platform
  | StarTransactionPartnerTelegramApi -- ^ The transaction is a transaction with Telegram for API usage
    { request_count :: Maybe Int -- ^ The number of billed requests
    }
  | StarTransactionPartnerBot -- ^ The transaction is a transaction with a bot
    { user_id :: Maybe Int                                         -- ^ Identifier of the bot
    , purpose :: Maybe BotTransactionPurpose.BotTransactionPurpose -- ^ Purpose of the transaction
    }
  | StarTransactionPartnerBusiness -- ^ The transaction is a transaction with a business account
    { user_id :: Maybe Int                   -- ^ Identifier of the business account user
    , media   :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media if the transaction wasn't refunded
    }
  | StarTransactionPartnerChat -- ^ The transaction is a transaction with a supergroup or a channel chat
    { chat_id  :: Maybe Int                                           -- ^ Identifier of the chat
    , _purpose :: Maybe ChatTransactionPurpose.ChatTransactionPurpose -- ^ Purpose of the transaction
    }
  | StarTransactionPartnerUser -- ^ The transaction is a transaction with another user
    { user_id   :: Maybe Int                                           -- ^ Identifier of the user; 0 if the user was anonymous
    , __purpose :: Maybe UserTransactionPurpose.UserTransactionPurpose -- ^ Purpose of the transaction
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
  shortShow StarTransactionPartnerTelegramAds
      = "StarTransactionPartnerTelegramAds"
  shortShow StarTransactionPartnerTelegramApi
    { request_count = request_count_
    }
      = "StarTransactionPartnerTelegramApi"
        ++ I.cc
        [ "request_count" `I.p` request_count_
        ]
  shortShow StarTransactionPartnerBot
    { user_id = user_id_
    , purpose = purpose_
    }
      = "StarTransactionPartnerBot"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "purpose" `I.p` purpose_
        ]
  shortShow StarTransactionPartnerBusiness
    { user_id = user_id_
    , media   = media_
    }
      = "StarTransactionPartnerBusiness"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "media"   `I.p` media_
        ]
  shortShow StarTransactionPartnerChat
    { chat_id  = chat_id_
    , _purpose = _purpose_
    }
      = "StarTransactionPartnerChat"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "_purpose" `I.p` _purpose_
        ]
  shortShow StarTransactionPartnerUser
    { user_id   = user_id_
    , __purpose = __purpose_
    }
      = "StarTransactionPartnerUser"
        ++ I.cc
        [ "user_id"   `I.p` user_id_
        , "__purpose" `I.p` __purpose_
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
      "starTransactionPartnerTelegramAds" -> pure StarTransactionPartnerTelegramAds
      "starTransactionPartnerTelegramApi" -> parseStarTransactionPartnerTelegramApi v
      "starTransactionPartnerBot"         -> parseStarTransactionPartnerBot v
      "starTransactionPartnerBusiness"    -> parseStarTransactionPartnerBusiness v
      "starTransactionPartnerChat"        -> parseStarTransactionPartnerChat v
      "starTransactionPartnerUser"        -> parseStarTransactionPartnerUser v
      "starTransactionPartnerUnsupported" -> pure StarTransactionPartnerUnsupported
      _                                   -> mempty
    
    where
      parseStarTransactionPartnerFragment :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerFragment = A.withObject "StarTransactionPartnerFragment" $ \o -> do
        withdrawal_state_ <- o A..:?  "withdrawal_state"
        pure $ StarTransactionPartnerFragment
          { withdrawal_state = withdrawal_state_
          }
      parseStarTransactionPartnerTelegramApi :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerTelegramApi = A.withObject "StarTransactionPartnerTelegramApi" $ \o -> do
        request_count_ <- o A..:?  "request_count"
        pure $ StarTransactionPartnerTelegramApi
          { request_count = request_count_
          }
      parseStarTransactionPartnerBot :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerBot = A.withObject "StarTransactionPartnerBot" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        purpose_ <- o A..:?  "purpose"
        pure $ StarTransactionPartnerBot
          { user_id = user_id_
          , purpose = purpose_
          }
      parseStarTransactionPartnerBusiness :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerBusiness = A.withObject "StarTransactionPartnerBusiness" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        media_   <- o A..:?  "media"
        pure $ StarTransactionPartnerBusiness
          { user_id = user_id_
          , media   = media_
          }
      parseStarTransactionPartnerChat :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerChat = A.withObject "StarTransactionPartnerChat" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        _purpose_ <- o A..:?  "purpose"
        pure $ StarTransactionPartnerChat
          { chat_id  = chat_id_
          , _purpose = _purpose_
          }
      parseStarTransactionPartnerUser :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerUser = A.withObject "StarTransactionPartnerUser" $ \o -> do
        user_id_   <- o A..:?  "user_id"
        __purpose_ <- o A..:?  "purpose"
        pure $ StarTransactionPartnerUser
          { user_id   = user_id_
          , __purpose = __purpose_
          }
  parseJSON _ = mempty

