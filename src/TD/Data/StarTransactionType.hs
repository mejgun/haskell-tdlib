module TD.Data.StarTransactionType
  (StarTransactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.RevenueWithdrawalState as RevenueWithdrawalState
import qualified TD.Data.PaidMedia as PaidMedia
import qualified Data.Text as T
import qualified TD.Data.AffiliateInfo as AffiliateInfo
import qualified TD.Data.ProductInfo as ProductInfo
import qualified Data.ByteString as BS
import qualified TD.Data.Gift as Gift

-- | Describes type of transaction with Telegram Stars
data StarTransactionType
  = StarTransactionTypePremiumBotDeposit -- ^ The transaction is a deposit of Telegram Stars from the Premium bot; for regular users only
  | StarTransactionTypeAppStoreDeposit -- ^ The transaction is a deposit of Telegram Stars from App Store; for regular users only
  | StarTransactionTypeGooglePlayDeposit -- ^ The transaction is a deposit of Telegram Stars from Google Play; for regular users only
  | StarTransactionTypeFragmentDeposit -- ^ The transaction is a deposit of Telegram Stars from Fragment; for regular users and bots only
  | StarTransactionTypeUserDeposit -- ^ The transaction is a deposit of Telegram Stars by another user; for regular users only
    { user_id :: Maybe Int             -- ^ Identifier of the user that gifted Telegram Stars; 0 if the user was anonymous
    , sticker :: Maybe Sticker.Sticker -- ^ The sticker to be shown in the transaction information; may be null if unknown
    }
  | StarTransactionTypeGiveawayDeposit -- ^ The transaction is a deposit of Telegram Stars from a giveaway; for regular users only
    { chat_id             :: Maybe Int -- ^ Identifier of a supergroup or a channel chat that created the giveaway
    , giveaway_message_id :: Maybe Int -- ^ Identifier of the message with the giveaway; can be 0 or an identifier of a deleted message
    }
  | StarTransactionTypeFragmentWithdrawal -- ^ The transaction is a withdrawal of earned Telegram Stars to Fragment; for bots and channel chats only
    { withdrawal_state :: Maybe RevenueWithdrawalState.RevenueWithdrawalState -- ^ State of the withdrawal; may be null for refunds from Fragment
    }
  | StarTransactionTypeTelegramAdsWithdrawal -- ^ The transaction is a withdrawal of earned Telegram Stars to Telegram Ad platform; for bots and channel chats only
  | StarTransactionTypeTelegramApiUsage -- ^ The transaction is a payment for Telegram API usage; for bots only
    { request_count :: Maybe Int -- ^ The number of billed requests
    }
  | StarTransactionTypeBotPaidMediaPurchase -- ^ The transaction is a purchase of paid media from a bot or a business account by the current user; for regular users only
    { user_id :: Maybe Int                   -- ^ Identifier of the bot or the business account user that sent the paid media
    , media   :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media if the transaction wasn't refunded
    }
  | StarTransactionTypeBotPaidMediaSale -- ^ The transaction is a sale of paid media by the bot or a business account managed by the bot; for bots only
    { user_id   :: Maybe Int                         -- ^ Identifier of the user that bought the media
    , media     :: Maybe [PaidMedia.PaidMedia]       -- ^ The bought media
    , payload   :: Maybe T.Text                      -- ^ Bot-provided payload
    , affiliate :: Maybe AffiliateInfo.AffiliateInfo -- ^ Information about the affiliate which received commission from the transaction; may be null if none
    }
  | StarTransactionTypeChannelPaidMediaPurchase -- ^ The transaction is a purchase of paid media from a channel by the current user; for regular users only
    { chat_id    :: Maybe Int                   -- ^ Identifier of the channel chat that sent the paid media
    , message_id :: Maybe Int                   -- ^ Identifier of the corresponding message with paid media; can be 0 or an identifier of a deleted message
    , media      :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media if the transaction wasn't refunded
    }
  | StarTransactionTypeChannelPaidMediaSale -- ^ The transaction is a sale of paid media by the channel chat; for channel chats only
    { user_id    :: Maybe Int                   -- ^ Identifier of the user that bought the media
    , message_id :: Maybe Int                   -- ^ Identifier of the corresponding message with paid media; can be 0 or an identifier of a deleted message
    , media      :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media
    }
  | StarTransactionTypeBotInvoicePurchase -- ^ The transaction is a purchase of a product from a bot or a business account by the current user; for regular users only
    { user_id      :: Maybe Int                     -- ^ Identifier of the bot or the business account user that created the invoice
    , product_info :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought product
    }
  | StarTransactionTypeBotInvoiceSale -- ^ The transaction is a sale of a product by the bot; for bots only
    { user_id         :: Maybe Int                         -- ^ Identifier of the user that bought the product
    , product_info    :: Maybe ProductInfo.ProductInfo     -- ^ Information about the bought product
    , invoice_payload :: Maybe BS.ByteString               -- ^ Invoice payload
    , affiliate       :: Maybe AffiliateInfo.AffiliateInfo -- ^ Information about the affiliate which received commission from the transaction; may be null if none
    }
  | StarTransactionTypeBotSubscriptionPurchase -- ^ The transaction is a purchase of a subscription from a bot or a business account by the current user; for regular users only
    { user_id             :: Maybe Int                     -- ^ Identifier of the bot or the business account user that created the subscription link
    , subscription_period :: Maybe Int                     -- ^ The number of seconds between consecutive Telegram Star debitings
    , product_info        :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought subscription
    }
  | StarTransactionTypeBotSubscriptionSale -- ^ The transaction is a sale of a subscription by the bot; for bots only
    { user_id             :: Maybe Int                         -- ^ Identifier of the user that bought the subscription
    , subscription_period :: Maybe Int                         -- ^ The number of seconds between consecutive Telegram Star debitings
    , product_info        :: Maybe ProductInfo.ProductInfo     -- ^ Information about the bought subscription
    , invoice_payload     :: Maybe BS.ByteString               -- ^ Invoice payload
    , affiliate           :: Maybe AffiliateInfo.AffiliateInfo -- ^ Information about the affiliate which received commission from the transaction; may be null if none
    }
  | StarTransactionTypeChannelSubscriptionPurchase -- ^ The transaction is a purchase of a subscription to a channel chat by the current user; for regular users only
    { chat_id             :: Maybe Int -- ^ Identifier of the channel chat that created the subscription
    , subscription_period :: Maybe Int -- ^ The number of seconds between consecutive Telegram Star debitings
    }
  | StarTransactionTypeChannelSubscriptionSale -- ^ The transaction is a sale of a subscription by the channel chat; for channel chats only
    { user_id             :: Maybe Int -- ^ Identifier of the user that bought the subscription
    , subscription_period :: Maybe Int -- ^ The number of seconds between consecutive Telegram Star debitings
    }
  | StarTransactionTypeGiftPurchase -- ^ The transaction is a purchase of a gift to another user; for regular users and bots only
    { user_id :: Maybe Int       -- ^ Identifier of the user that received the gift
    , gift    :: Maybe Gift.Gift -- ^ The gift
    }
  | StarTransactionTypeGiftSale -- ^ The transaction is a sale of a gift received from another user or bot; for regular users only
    { user_id :: Maybe Int       -- ^ Identifier of the user that sent the gift
    , gift    :: Maybe Gift.Gift -- ^ The gift
    }
  | StarTransactionTypeChannelPaidReactionSend -- ^ The transaction is a sending of a paid reaction to a message in a channel chat by the current user; for regular users only
    { chat_id    :: Maybe Int -- ^ Identifier of the channel chat
    , message_id :: Maybe Int -- ^ Identifier of the reacted message; can be 0 or an identifier of a deleted message
    }
  | StarTransactionTypeChannelPaidReactionReceive -- ^ The transaction is a receiving of a paid reaction to a message by the channel chat; for channel chats only
    { user_id    :: Maybe Int -- ^ Identifier of the user that added the paid reaction
    , message_id :: Maybe Int -- ^ Identifier of the reacted message; can be 0 or an identifier of a deleted message
    }
  | StarTransactionTypeAffiliateProgramCommission -- ^ The transaction is a receiving of a commission from an affiliate program; for regular users, bots and channel chats only
    { chat_id              :: Maybe Int -- ^ Identifier of the chat that created the affiliate program
    , commission_per_mille :: Maybe Int -- ^ The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner
    }
  | StarTransactionTypeUnsupported -- ^ The transaction is a transaction of an unsupported type
  deriving (Eq, Show)

instance I.ShortShow StarTransactionType where
  shortShow StarTransactionTypePremiumBotDeposit
      = "StarTransactionTypePremiumBotDeposit"
  shortShow StarTransactionTypeAppStoreDeposit
      = "StarTransactionTypeAppStoreDeposit"
  shortShow StarTransactionTypeGooglePlayDeposit
      = "StarTransactionTypeGooglePlayDeposit"
  shortShow StarTransactionTypeFragmentDeposit
      = "StarTransactionTypeFragmentDeposit"
  shortShow StarTransactionTypeUserDeposit
    { user_id = user_id_
    , sticker = sticker_
    }
      = "StarTransactionTypeUserDeposit"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "sticker" `I.p` sticker_
        ]
  shortShow StarTransactionTypeGiveawayDeposit
    { chat_id             = chat_id_
    , giveaway_message_id = giveaway_message_id_
    }
      = "StarTransactionTypeGiveawayDeposit"
        ++ I.cc
        [ "chat_id"             `I.p` chat_id_
        , "giveaway_message_id" `I.p` giveaway_message_id_
        ]
  shortShow StarTransactionTypeFragmentWithdrawal
    { withdrawal_state = withdrawal_state_
    }
      = "StarTransactionTypeFragmentWithdrawal"
        ++ I.cc
        [ "withdrawal_state" `I.p` withdrawal_state_
        ]
  shortShow StarTransactionTypeTelegramAdsWithdrawal
      = "StarTransactionTypeTelegramAdsWithdrawal"
  shortShow StarTransactionTypeTelegramApiUsage
    { request_count = request_count_
    }
      = "StarTransactionTypeTelegramApiUsage"
        ++ I.cc
        [ "request_count" `I.p` request_count_
        ]
  shortShow StarTransactionTypeBotPaidMediaPurchase
    { user_id = user_id_
    , media   = media_
    }
      = "StarTransactionTypeBotPaidMediaPurchase"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "media"   `I.p` media_
        ]
  shortShow StarTransactionTypeBotPaidMediaSale
    { user_id   = user_id_
    , media     = media_
    , payload   = payload_
    , affiliate = affiliate_
    }
      = "StarTransactionTypeBotPaidMediaSale"
        ++ I.cc
        [ "user_id"   `I.p` user_id_
        , "media"     `I.p` media_
        , "payload"   `I.p` payload_
        , "affiliate" `I.p` affiliate_
        ]
  shortShow StarTransactionTypeChannelPaidMediaPurchase
    { chat_id    = chat_id_
    , message_id = message_id_
    , media      = media_
    }
      = "StarTransactionTypeChannelPaidMediaPurchase"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        , "media"      `I.p` media_
        ]
  shortShow StarTransactionTypeChannelPaidMediaSale
    { user_id    = user_id_
    , message_id = message_id_
    , media      = media_
    }
      = "StarTransactionTypeChannelPaidMediaSale"
        ++ I.cc
        [ "user_id"    `I.p` user_id_
        , "message_id" `I.p` message_id_
        , "media"      `I.p` media_
        ]
  shortShow StarTransactionTypeBotInvoicePurchase
    { user_id      = user_id_
    , product_info = product_info_
    }
      = "StarTransactionTypeBotInvoicePurchase"
        ++ I.cc
        [ "user_id"      `I.p` user_id_
        , "product_info" `I.p` product_info_
        ]
  shortShow StarTransactionTypeBotInvoiceSale
    { user_id         = user_id_
    , product_info    = product_info_
    , invoice_payload = invoice_payload_
    , affiliate       = affiliate_
    }
      = "StarTransactionTypeBotInvoiceSale"
        ++ I.cc
        [ "user_id"         `I.p` user_id_
        , "product_info"    `I.p` product_info_
        , "invoice_payload" `I.p` invoice_payload_
        , "affiliate"       `I.p` affiliate_
        ]
  shortShow StarTransactionTypeBotSubscriptionPurchase
    { user_id             = user_id_
    , subscription_period = subscription_period_
    , product_info        = product_info_
    }
      = "StarTransactionTypeBotSubscriptionPurchase"
        ++ I.cc
        [ "user_id"             `I.p` user_id_
        , "subscription_period" `I.p` subscription_period_
        , "product_info"        `I.p` product_info_
        ]
  shortShow StarTransactionTypeBotSubscriptionSale
    { user_id             = user_id_
    , subscription_period = subscription_period_
    , product_info        = product_info_
    , invoice_payload     = invoice_payload_
    , affiliate           = affiliate_
    }
      = "StarTransactionTypeBotSubscriptionSale"
        ++ I.cc
        [ "user_id"             `I.p` user_id_
        , "subscription_period" `I.p` subscription_period_
        , "product_info"        `I.p` product_info_
        , "invoice_payload"     `I.p` invoice_payload_
        , "affiliate"           `I.p` affiliate_
        ]
  shortShow StarTransactionTypeChannelSubscriptionPurchase
    { chat_id             = chat_id_
    , subscription_period = subscription_period_
    }
      = "StarTransactionTypeChannelSubscriptionPurchase"
        ++ I.cc
        [ "chat_id"             `I.p` chat_id_
        , "subscription_period" `I.p` subscription_period_
        ]
  shortShow StarTransactionTypeChannelSubscriptionSale
    { user_id             = user_id_
    , subscription_period = subscription_period_
    }
      = "StarTransactionTypeChannelSubscriptionSale"
        ++ I.cc
        [ "user_id"             `I.p` user_id_
        , "subscription_period" `I.p` subscription_period_
        ]
  shortShow StarTransactionTypeGiftPurchase
    { user_id = user_id_
    , gift    = gift_
    }
      = "StarTransactionTypeGiftPurchase"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "gift"    `I.p` gift_
        ]
  shortShow StarTransactionTypeGiftSale
    { user_id = user_id_
    , gift    = gift_
    }
      = "StarTransactionTypeGiftSale"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "gift"    `I.p` gift_
        ]
  shortShow StarTransactionTypeChannelPaidReactionSend
    { chat_id    = chat_id_
    , message_id = message_id_
    }
      = "StarTransactionTypeChannelPaidReactionSend"
        ++ I.cc
        [ "chat_id"    `I.p` chat_id_
        , "message_id" `I.p` message_id_
        ]
  shortShow StarTransactionTypeChannelPaidReactionReceive
    { user_id    = user_id_
    , message_id = message_id_
    }
      = "StarTransactionTypeChannelPaidReactionReceive"
        ++ I.cc
        [ "user_id"    `I.p` user_id_
        , "message_id" `I.p` message_id_
        ]
  shortShow StarTransactionTypeAffiliateProgramCommission
    { chat_id              = chat_id_
    , commission_per_mille = commission_per_mille_
    }
      = "StarTransactionTypeAffiliateProgramCommission"
        ++ I.cc
        [ "chat_id"              `I.p` chat_id_
        , "commission_per_mille" `I.p` commission_per_mille_
        ]
  shortShow StarTransactionTypeUnsupported
      = "StarTransactionTypeUnsupported"

instance AT.FromJSON StarTransactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starTransactionTypePremiumBotDeposit"           -> pure StarTransactionTypePremiumBotDeposit
      "starTransactionTypeAppStoreDeposit"             -> pure StarTransactionTypeAppStoreDeposit
      "starTransactionTypeGooglePlayDeposit"           -> pure StarTransactionTypeGooglePlayDeposit
      "starTransactionTypeFragmentDeposit"             -> pure StarTransactionTypeFragmentDeposit
      "starTransactionTypeUserDeposit"                 -> parseStarTransactionTypeUserDeposit v
      "starTransactionTypeGiveawayDeposit"             -> parseStarTransactionTypeGiveawayDeposit v
      "starTransactionTypeFragmentWithdrawal"          -> parseStarTransactionTypeFragmentWithdrawal v
      "starTransactionTypeTelegramAdsWithdrawal"       -> pure StarTransactionTypeTelegramAdsWithdrawal
      "starTransactionTypeTelegramApiUsage"            -> parseStarTransactionTypeTelegramApiUsage v
      "starTransactionTypeBotPaidMediaPurchase"        -> parseStarTransactionTypeBotPaidMediaPurchase v
      "starTransactionTypeBotPaidMediaSale"            -> parseStarTransactionTypeBotPaidMediaSale v
      "starTransactionTypeChannelPaidMediaPurchase"    -> parseStarTransactionTypeChannelPaidMediaPurchase v
      "starTransactionTypeChannelPaidMediaSale"        -> parseStarTransactionTypeChannelPaidMediaSale v
      "starTransactionTypeBotInvoicePurchase"          -> parseStarTransactionTypeBotInvoicePurchase v
      "starTransactionTypeBotInvoiceSale"              -> parseStarTransactionTypeBotInvoiceSale v
      "starTransactionTypeBotSubscriptionPurchase"     -> parseStarTransactionTypeBotSubscriptionPurchase v
      "starTransactionTypeBotSubscriptionSale"         -> parseStarTransactionTypeBotSubscriptionSale v
      "starTransactionTypeChannelSubscriptionPurchase" -> parseStarTransactionTypeChannelSubscriptionPurchase v
      "starTransactionTypeChannelSubscriptionSale"     -> parseStarTransactionTypeChannelSubscriptionSale v
      "starTransactionTypeGiftPurchase"                -> parseStarTransactionTypeGiftPurchase v
      "starTransactionTypeGiftSale"                    -> parseStarTransactionTypeGiftSale v
      "starTransactionTypeChannelPaidReactionSend"     -> parseStarTransactionTypeChannelPaidReactionSend v
      "starTransactionTypeChannelPaidReactionReceive"  -> parseStarTransactionTypeChannelPaidReactionReceive v
      "starTransactionTypeAffiliateProgramCommission"  -> parseStarTransactionTypeAffiliateProgramCommission v
      "starTransactionTypeUnsupported"                 -> pure StarTransactionTypeUnsupported
      _                                                -> mempty
    
    where
      parseStarTransactionTypeUserDeposit :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeUserDeposit = A.withObject "StarTransactionTypeUserDeposit" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        sticker_ <- o A..:?  "sticker"
        pure $ StarTransactionTypeUserDeposit
          { user_id = user_id_
          , sticker = sticker_
          }
      parseStarTransactionTypeGiveawayDeposit :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiveawayDeposit = A.withObject "StarTransactionTypeGiveawayDeposit" $ \o -> do
        chat_id_             <- o A..:?  "chat_id"
        giveaway_message_id_ <- o A..:?  "giveaway_message_id"
        pure $ StarTransactionTypeGiveawayDeposit
          { chat_id             = chat_id_
          , giveaway_message_id = giveaway_message_id_
          }
      parseStarTransactionTypeFragmentWithdrawal :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeFragmentWithdrawal = A.withObject "StarTransactionTypeFragmentWithdrawal" $ \o -> do
        withdrawal_state_ <- o A..:?  "withdrawal_state"
        pure $ StarTransactionTypeFragmentWithdrawal
          { withdrawal_state = withdrawal_state_
          }
      parseStarTransactionTypeTelegramApiUsage :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeTelegramApiUsage = A.withObject "StarTransactionTypeTelegramApiUsage" $ \o -> do
        request_count_ <- o A..:?  "request_count"
        pure $ StarTransactionTypeTelegramApiUsage
          { request_count = request_count_
          }
      parseStarTransactionTypeBotPaidMediaPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBotPaidMediaPurchase = A.withObject "StarTransactionTypeBotPaidMediaPurchase" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        media_   <- o A..:?  "media"
        pure $ StarTransactionTypeBotPaidMediaPurchase
          { user_id = user_id_
          , media   = media_
          }
      parseStarTransactionTypeBotPaidMediaSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBotPaidMediaSale = A.withObject "StarTransactionTypeBotPaidMediaSale" $ \o -> do
        user_id_   <- o A..:?  "user_id"
        media_     <- o A..:?  "media"
        payload_   <- o A..:?  "payload"
        affiliate_ <- o A..:?  "affiliate"
        pure $ StarTransactionTypeBotPaidMediaSale
          { user_id   = user_id_
          , media     = media_
          , payload   = payload_
          , affiliate = affiliate_
          }
      parseStarTransactionTypeChannelPaidMediaPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeChannelPaidMediaPurchase = A.withObject "StarTransactionTypeChannelPaidMediaPurchase" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        media_      <- o A..:?  "media"
        pure $ StarTransactionTypeChannelPaidMediaPurchase
          { chat_id    = chat_id_
          , message_id = message_id_
          , media      = media_
          }
      parseStarTransactionTypeChannelPaidMediaSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeChannelPaidMediaSale = A.withObject "StarTransactionTypeChannelPaidMediaSale" $ \o -> do
        user_id_    <- o A..:?  "user_id"
        message_id_ <- o A..:?  "message_id"
        media_      <- o A..:?  "media"
        pure $ StarTransactionTypeChannelPaidMediaSale
          { user_id    = user_id_
          , message_id = message_id_
          , media      = media_
          }
      parseStarTransactionTypeBotInvoicePurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBotInvoicePurchase = A.withObject "StarTransactionTypeBotInvoicePurchase" $ \o -> do
        user_id_      <- o A..:?  "user_id"
        product_info_ <- o A..:?  "product_info"
        pure $ StarTransactionTypeBotInvoicePurchase
          { user_id      = user_id_
          , product_info = product_info_
          }
      parseStarTransactionTypeBotInvoiceSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBotInvoiceSale = A.withObject "StarTransactionTypeBotInvoiceSale" $ \o -> do
        user_id_         <- o A..:?                       "user_id"
        product_info_    <- o A..:?                       "product_info"
        invoice_payload_ <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        affiliate_       <- o A..:?                       "affiliate"
        pure $ StarTransactionTypeBotInvoiceSale
          { user_id         = user_id_
          , product_info    = product_info_
          , invoice_payload = invoice_payload_
          , affiliate       = affiliate_
          }
      parseStarTransactionTypeBotSubscriptionPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBotSubscriptionPurchase = A.withObject "StarTransactionTypeBotSubscriptionPurchase" $ \o -> do
        user_id_             <- o A..:?  "user_id"
        subscription_period_ <- o A..:?  "subscription_period"
        product_info_        <- o A..:?  "product_info"
        pure $ StarTransactionTypeBotSubscriptionPurchase
          { user_id             = user_id_
          , subscription_period = subscription_period_
          , product_info        = product_info_
          }
      parseStarTransactionTypeBotSubscriptionSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBotSubscriptionSale = A.withObject "StarTransactionTypeBotSubscriptionSale" $ \o -> do
        user_id_             <- o A..:?                       "user_id"
        subscription_period_ <- o A..:?                       "subscription_period"
        product_info_        <- o A..:?                       "product_info"
        invoice_payload_     <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        affiliate_           <- o A..:?                       "affiliate"
        pure $ StarTransactionTypeBotSubscriptionSale
          { user_id             = user_id_
          , subscription_period = subscription_period_
          , product_info        = product_info_
          , invoice_payload     = invoice_payload_
          , affiliate           = affiliate_
          }
      parseStarTransactionTypeChannelSubscriptionPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeChannelSubscriptionPurchase = A.withObject "StarTransactionTypeChannelSubscriptionPurchase" $ \o -> do
        chat_id_             <- o A..:?  "chat_id"
        subscription_period_ <- o A..:?  "subscription_period"
        pure $ StarTransactionTypeChannelSubscriptionPurchase
          { chat_id             = chat_id_
          , subscription_period = subscription_period_
          }
      parseStarTransactionTypeChannelSubscriptionSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeChannelSubscriptionSale = A.withObject "StarTransactionTypeChannelSubscriptionSale" $ \o -> do
        user_id_             <- o A..:?  "user_id"
        subscription_period_ <- o A..:?  "subscription_period"
        pure $ StarTransactionTypeChannelSubscriptionSale
          { user_id             = user_id_
          , subscription_period = subscription_period_
          }
      parseStarTransactionTypeGiftPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftPurchase = A.withObject "StarTransactionTypeGiftPurchase" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        gift_    <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftPurchase
          { user_id = user_id_
          , gift    = gift_
          }
      parseStarTransactionTypeGiftSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftSale = A.withObject "StarTransactionTypeGiftSale" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        gift_    <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftSale
          { user_id = user_id_
          , gift    = gift_
          }
      parseStarTransactionTypeChannelPaidReactionSend :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeChannelPaidReactionSend = A.withObject "StarTransactionTypeChannelPaidReactionSend" $ \o -> do
        chat_id_    <- o A..:?  "chat_id"
        message_id_ <- o A..:?  "message_id"
        pure $ StarTransactionTypeChannelPaidReactionSend
          { chat_id    = chat_id_
          , message_id = message_id_
          }
      parseStarTransactionTypeChannelPaidReactionReceive :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeChannelPaidReactionReceive = A.withObject "StarTransactionTypeChannelPaidReactionReceive" $ \o -> do
        user_id_    <- o A..:?  "user_id"
        message_id_ <- o A..:?  "message_id"
        pure $ StarTransactionTypeChannelPaidReactionReceive
          { user_id    = user_id_
          , message_id = message_id_
          }
      parseStarTransactionTypeAffiliateProgramCommission :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeAffiliateProgramCommission = A.withObject "StarTransactionTypeAffiliateProgramCommission" $ \o -> do
        chat_id_              <- o A..:?  "chat_id"
        commission_per_mille_ <- o A..:?  "commission_per_mille"
        pure $ StarTransactionTypeAffiliateProgramCommission
          { chat_id              = chat_id_
          , commission_per_mille = commission_per_mille_
          }
  parseJSON _ = mempty

