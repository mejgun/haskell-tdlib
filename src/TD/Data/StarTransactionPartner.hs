module TD.Data.StarTransactionPartner
  (StarTransactionPartner(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RevenueWithdrawalState as RevenueWithdrawalState
import qualified TD.Data.ProductInfo as ProductInfo
import qualified Data.ByteString as BS
import qualified TD.Data.PaidMedia as PaidMedia

-- | Describes source or recipient of a transaction with Telegram stars
data StarTransactionPartner
  = StarTransactionPartnerTelegram -- ^ The transaction is a transaction with Telegram through a bot
  | StarTransactionPartnerAppStore -- ^ The transaction is a transaction with App Store
  | StarTransactionPartnerGooglePlay -- ^ The transaction is a transaction with Google Play
  | StarTransactionPartnerFragment -- ^ The transaction is a transaction with Fragment
    { withdrawal_state :: Maybe RevenueWithdrawalState.RevenueWithdrawalState -- ^ State of the withdrawal; may be null for refunds from Fragment
    }
  | StarTransactionPartnerTelegramAds -- ^ The transaction is a transaction with Telegram Ad platform
  | StarTransactionPartnerBot -- ^ The transaction is a transaction with a bot
    { bot_user_id     :: Maybe Int                     -- ^ Identifier of the bot
    , product_info    :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought product; may be null if not applicable
    , invoice_payload :: Maybe BS.ByteString           -- ^ Invoice payload; for bots only
    }
  | StarTransactionPartnerChannel -- ^ The transaction is a transaction with a channel chat
    { chat_id               :: Maybe Int                   -- ^ Identifier of the chat
    , paid_media_message_id :: Maybe Int                   -- ^ Identifier of the corresponding message with paid media; can be an identifier of a deleted message
    , media                 :: Maybe [PaidMedia.PaidMedia] -- ^ Information about the bought media
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
  shortShow StarTransactionPartnerBot
    { bot_user_id     = bot_user_id_
    , product_info    = product_info_
    , invoice_payload = invoice_payload_
    }
      = "StarTransactionPartnerBot"
        ++ I.cc
        [ "bot_user_id"     `I.p` bot_user_id_
        , "product_info"    `I.p` product_info_
        , "invoice_payload" `I.p` invoice_payload_
        ]
  shortShow StarTransactionPartnerChannel
    { chat_id               = chat_id_
    , paid_media_message_id = paid_media_message_id_
    , media                 = media_
    }
      = "StarTransactionPartnerChannel"
        ++ I.cc
        [ "chat_id"               `I.p` chat_id_
        , "paid_media_message_id" `I.p` paid_media_message_id_
        , "media"                 `I.p` media_
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
      "starTransactionPartnerBot"         -> parseStarTransactionPartnerBot v
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
      parseStarTransactionPartnerBot :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerBot = A.withObject "StarTransactionPartnerBot" $ \o -> do
        bot_user_id_     <- o A..:?                       "bot_user_id"
        product_info_    <- o A..:?                       "product_info"
        invoice_payload_ <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        pure $ StarTransactionPartnerBot
          { bot_user_id     = bot_user_id_
          , product_info    = product_info_
          , invoice_payload = invoice_payload_
          }
      parseStarTransactionPartnerChannel :: A.Value -> AT.Parser StarTransactionPartner
      parseStarTransactionPartnerChannel = A.withObject "StarTransactionPartnerChannel" $ \o -> do
        chat_id_               <- o A..:?  "chat_id"
        paid_media_message_id_ <- o A..:?  "paid_media_message_id"
        media_                 <- o A..:?  "media"
        pure $ StarTransactionPartnerChannel
          { chat_id               = chat_id_
          , paid_media_message_id = paid_media_message_id_
          , media                 = media_
          }
  parseJSON _ = mempty

