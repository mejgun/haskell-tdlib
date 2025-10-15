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
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.Gift as Gift
import qualified TD.Data.UpgradedGift as UpgradedGift
import qualified TD.Data.StarAmount as StarAmount

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
  | StarTransactionTypeFragmentWithdrawal -- ^ The transaction is a withdrawal of earned Telegram Stars to Fragment; for regular users, bots, supergroup and channel chats only
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
  | StarTransactionTypeGiftPurchase -- ^ The transaction is a purchase of a regular gift; for regular users and bots only
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel that received the gift
    , gift     :: Maybe Gift.Gift                   -- ^ The gift
    }
  | StarTransactionTypeGiftTransfer -- ^ The transaction is a transfer of an upgraded gift; for regular users only
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel that received the gift
    , _gift    :: Maybe UpgradedGift.UpgradedGift   -- ^ The gift
    }
  | StarTransactionTypeGiftOriginalDetailsDrop -- ^ The transaction is a drop of original details of an upgraded gift; for regular users only
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel that owns the gift
    , _gift    :: Maybe UpgradedGift.UpgradedGift   -- ^ The gift
    }
  | StarTransactionTypeGiftSale -- ^ The transaction is a sale of a received gift; for regular users and channel chats only
    { user_id :: Maybe Int       -- ^ Identifier of the user that sent the gift
    , gift    :: Maybe Gift.Gift -- ^ The gift
    }
  | StarTransactionTypeGiftUpgrade -- ^ The transaction is an upgrade of a gift; for regular users only
    { user_id :: Maybe Int                       -- ^ Identifier of the user that initially sent the gift
    , _gift   :: Maybe UpgradedGift.UpgradedGift -- ^ The upgraded gift
    }
  | StarTransactionTypeGiftUpgradePurchase -- ^ The transaction is a purchase of an upgrade of a gift owned by another user or channel; for regular users only
    { owner_id :: Maybe MessageSender.MessageSender -- ^ Owner of the upgraded gift
    , gift     :: Maybe Gift.Gift                   -- ^ The gift
    }
  | StarTransactionTypeUpgradedGiftPurchase -- ^ The transaction is a purchase of an upgraded gift for some user or channel; for regular users only
    { user_id :: Maybe Int                       -- ^ Identifier of the user that sold the gift
    , _gift   :: Maybe UpgradedGift.UpgradedGift -- ^ The gift
    }
  | StarTransactionTypeUpgradedGiftSale -- ^ The transaction is a sale of an upgraded gift; for regular users only
    { user_id                :: Maybe Int                       -- ^ Identifier of the user that bought the gift
    , _gift                  :: Maybe UpgradedGift.UpgradedGift -- ^ The gift
    , commission_per_mille   :: Maybe Int                       -- ^ The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars received by the seller of the gift
    , commission_star_amount :: Maybe StarAmount.StarAmount     -- ^ The amount of Telegram Stars that were received by Telegram; can be negative for refunds
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
  | StarTransactionTypePaidMessageSend -- ^ The transaction is a sending of a paid message; for regular users only
    { chat_id       :: Maybe Int -- ^ Identifier of the chat that received the payment
    , message_count :: Maybe Int -- ^ Number of sent paid messages
    }
  | StarTransactionTypePaidMessageReceive -- ^ The transaction is a receiving of a paid message; for regular users, supergroup and channel chats only
    { sender_id              :: Maybe MessageSender.MessageSender -- ^ Identifier of the sender of the message
    , message_count          :: Maybe Int                         -- ^ Number of received paid messages
    , commission_per_mille   :: Maybe Int                         -- ^ The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending
    , commission_star_amount :: Maybe StarAmount.StarAmount       -- ^ The amount of Telegram Stars that were received by Telegram; can be negative for refunds
    }
  | StarTransactionTypeSuggestedPostPaymentSend -- ^ The transaction is a payment for a suggested post; for regular users only
    { chat_id :: Maybe Int -- ^ Identifier of the channel chat that posted the post
    }
  | StarTransactionTypeSuggestedPostPaymentReceive -- ^ The transaction is a receiving of a payment for a suggested post by the channel chat; for channel chats only
    { user_id :: Maybe Int -- ^ Identifier of the user that paid for the suggested post
    }
  | StarTransactionTypePremiumPurchase -- ^ The transaction is a purchase of Telegram Premium subscription; for regular users and bots only
    { user_id     :: Maybe Int             -- ^ Identifier of the user that received the Telegram Premium subscription
    , month_count :: Maybe Int             -- ^ Number of months the Telegram Premium subscription will be active
    , sticker     :: Maybe Sticker.Sticker -- ^ A sticker to be shown in the transaction information; may be null if unknown
    }
  | StarTransactionTypeBusinessBotTransferSend -- ^ The transaction is a transfer of Telegram Stars to a business bot; for regular users only
    { user_id :: Maybe Int -- ^ Identifier of the bot that received Telegram Stars
    }
  | StarTransactionTypeBusinessBotTransferReceive -- ^ The transaction is a transfer of Telegram Stars from a business account; for bots only
    { user_id :: Maybe Int -- ^ Identifier of the user that sent Telegram Stars
    }
  | StarTransactionTypePublicPostSearch -- ^ The transaction is a payment for search of posts in public Telegram channels; for regular users only
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
    { owner_id = owner_id_
    , gift     = gift_
    }
      = "StarTransactionTypeGiftPurchase"
        ++ I.cc
        [ "owner_id" `I.p` owner_id_
        , "gift"     `I.p` gift_
        ]
  shortShow StarTransactionTypeGiftTransfer
    { owner_id = owner_id_
    , _gift    = _gift_
    }
      = "StarTransactionTypeGiftTransfer"
        ++ I.cc
        [ "owner_id" `I.p` owner_id_
        , "_gift"    `I.p` _gift_
        ]
  shortShow StarTransactionTypeGiftOriginalDetailsDrop
    { owner_id = owner_id_
    , _gift    = _gift_
    }
      = "StarTransactionTypeGiftOriginalDetailsDrop"
        ++ I.cc
        [ "owner_id" `I.p` owner_id_
        , "_gift"    `I.p` _gift_
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
  shortShow StarTransactionTypeGiftUpgrade
    { user_id = user_id_
    , _gift   = _gift_
    }
      = "StarTransactionTypeGiftUpgrade"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "_gift"   `I.p` _gift_
        ]
  shortShow StarTransactionTypeGiftUpgradePurchase
    { owner_id = owner_id_
    , gift     = gift_
    }
      = "StarTransactionTypeGiftUpgradePurchase"
        ++ I.cc
        [ "owner_id" `I.p` owner_id_
        , "gift"     `I.p` gift_
        ]
  shortShow StarTransactionTypeUpgradedGiftPurchase
    { user_id = user_id_
    , _gift   = _gift_
    }
      = "StarTransactionTypeUpgradedGiftPurchase"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "_gift"   `I.p` _gift_
        ]
  shortShow StarTransactionTypeUpgradedGiftSale
    { user_id                = user_id_
    , _gift                  = _gift_
    , commission_per_mille   = commission_per_mille_
    , commission_star_amount = commission_star_amount_
    }
      = "StarTransactionTypeUpgradedGiftSale"
        ++ I.cc
        [ "user_id"                `I.p` user_id_
        , "_gift"                  `I.p` _gift_
        , "commission_per_mille"   `I.p` commission_per_mille_
        , "commission_star_amount" `I.p` commission_star_amount_
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
  shortShow StarTransactionTypePaidMessageSend
    { chat_id       = chat_id_
    , message_count = message_count_
    }
      = "StarTransactionTypePaidMessageSend"
        ++ I.cc
        [ "chat_id"       `I.p` chat_id_
        , "message_count" `I.p` message_count_
        ]
  shortShow StarTransactionTypePaidMessageReceive
    { sender_id              = sender_id_
    , message_count          = message_count_
    , commission_per_mille   = commission_per_mille_
    , commission_star_amount = commission_star_amount_
    }
      = "StarTransactionTypePaidMessageReceive"
        ++ I.cc
        [ "sender_id"              `I.p` sender_id_
        , "message_count"          `I.p` message_count_
        , "commission_per_mille"   `I.p` commission_per_mille_
        , "commission_star_amount" `I.p` commission_star_amount_
        ]
  shortShow StarTransactionTypeSuggestedPostPaymentSend
    { chat_id = chat_id_
    }
      = "StarTransactionTypeSuggestedPostPaymentSend"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow StarTransactionTypeSuggestedPostPaymentReceive
    { user_id = user_id_
    }
      = "StarTransactionTypeSuggestedPostPaymentReceive"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow StarTransactionTypePremiumPurchase
    { user_id     = user_id_
    , month_count = month_count_
    , sticker     = sticker_
    }
      = "StarTransactionTypePremiumPurchase"
        ++ I.cc
        [ "user_id"     `I.p` user_id_
        , "month_count" `I.p` month_count_
        , "sticker"     `I.p` sticker_
        ]
  shortShow StarTransactionTypeBusinessBotTransferSend
    { user_id = user_id_
    }
      = "StarTransactionTypeBusinessBotTransferSend"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow StarTransactionTypeBusinessBotTransferReceive
    { user_id = user_id_
    }
      = "StarTransactionTypeBusinessBotTransferReceive"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow StarTransactionTypePublicPostSearch
      = "StarTransactionTypePublicPostSearch"
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
      "starTransactionTypeGiftTransfer"                -> parseStarTransactionTypeGiftTransfer v
      "starTransactionTypeGiftOriginalDetailsDrop"     -> parseStarTransactionTypeGiftOriginalDetailsDrop v
      "starTransactionTypeGiftSale"                    -> parseStarTransactionTypeGiftSale v
      "starTransactionTypeGiftUpgrade"                 -> parseStarTransactionTypeGiftUpgrade v
      "starTransactionTypeGiftUpgradePurchase"         -> parseStarTransactionTypeGiftUpgradePurchase v
      "starTransactionTypeUpgradedGiftPurchase"        -> parseStarTransactionTypeUpgradedGiftPurchase v
      "starTransactionTypeUpgradedGiftSale"            -> parseStarTransactionTypeUpgradedGiftSale v
      "starTransactionTypeChannelPaidReactionSend"     -> parseStarTransactionTypeChannelPaidReactionSend v
      "starTransactionTypeChannelPaidReactionReceive"  -> parseStarTransactionTypeChannelPaidReactionReceive v
      "starTransactionTypeAffiliateProgramCommission"  -> parseStarTransactionTypeAffiliateProgramCommission v
      "starTransactionTypePaidMessageSend"             -> parseStarTransactionTypePaidMessageSend v
      "starTransactionTypePaidMessageReceive"          -> parseStarTransactionTypePaidMessageReceive v
      "starTransactionTypeSuggestedPostPaymentSend"    -> parseStarTransactionTypeSuggestedPostPaymentSend v
      "starTransactionTypeSuggestedPostPaymentReceive" -> parseStarTransactionTypeSuggestedPostPaymentReceive v
      "starTransactionTypePremiumPurchase"             -> parseStarTransactionTypePremiumPurchase v
      "starTransactionTypeBusinessBotTransferSend"     -> parseStarTransactionTypeBusinessBotTransferSend v
      "starTransactionTypeBusinessBotTransferReceive"  -> parseStarTransactionTypeBusinessBotTransferReceive v
      "starTransactionTypePublicPostSearch"            -> pure StarTransactionTypePublicPostSearch
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
        owner_id_ <- o A..:?  "owner_id"
        gift_     <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftPurchase
          { owner_id = owner_id_
          , gift     = gift_
          }
      parseStarTransactionTypeGiftTransfer :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftTransfer = A.withObject "StarTransactionTypeGiftTransfer" $ \o -> do
        owner_id_ <- o A..:?  "owner_id"
        _gift_    <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftTransfer
          { owner_id = owner_id_
          , _gift    = _gift_
          }
      parseStarTransactionTypeGiftOriginalDetailsDrop :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftOriginalDetailsDrop = A.withObject "StarTransactionTypeGiftOriginalDetailsDrop" $ \o -> do
        owner_id_ <- o A..:?  "owner_id"
        _gift_    <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftOriginalDetailsDrop
          { owner_id = owner_id_
          , _gift    = _gift_
          }
      parseStarTransactionTypeGiftSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftSale = A.withObject "StarTransactionTypeGiftSale" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        gift_    <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftSale
          { user_id = user_id_
          , gift    = gift_
          }
      parseStarTransactionTypeGiftUpgrade :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftUpgrade = A.withObject "StarTransactionTypeGiftUpgrade" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        _gift_   <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftUpgrade
          { user_id = user_id_
          , _gift   = _gift_
          }
      parseStarTransactionTypeGiftUpgradePurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeGiftUpgradePurchase = A.withObject "StarTransactionTypeGiftUpgradePurchase" $ \o -> do
        owner_id_ <- o A..:?  "owner_id"
        gift_     <- o A..:?  "gift"
        pure $ StarTransactionTypeGiftUpgradePurchase
          { owner_id = owner_id_
          , gift     = gift_
          }
      parseStarTransactionTypeUpgradedGiftPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeUpgradedGiftPurchase = A.withObject "StarTransactionTypeUpgradedGiftPurchase" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        _gift_   <- o A..:?  "gift"
        pure $ StarTransactionTypeUpgradedGiftPurchase
          { user_id = user_id_
          , _gift   = _gift_
          }
      parseStarTransactionTypeUpgradedGiftSale :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeUpgradedGiftSale = A.withObject "StarTransactionTypeUpgradedGiftSale" $ \o -> do
        user_id_                <- o A..:?  "user_id"
        _gift_                  <- o A..:?  "gift"
        commission_per_mille_   <- o A..:?  "commission_per_mille"
        commission_star_amount_ <- o A..:?  "commission_star_amount"
        pure $ StarTransactionTypeUpgradedGiftSale
          { user_id                = user_id_
          , _gift                  = _gift_
          , commission_per_mille   = commission_per_mille_
          , commission_star_amount = commission_star_amount_
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
      parseStarTransactionTypePaidMessageSend :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypePaidMessageSend = A.withObject "StarTransactionTypePaidMessageSend" $ \o -> do
        chat_id_       <- o A..:?  "chat_id"
        message_count_ <- o A..:?  "message_count"
        pure $ StarTransactionTypePaidMessageSend
          { chat_id       = chat_id_
          , message_count = message_count_
          }
      parseStarTransactionTypePaidMessageReceive :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypePaidMessageReceive = A.withObject "StarTransactionTypePaidMessageReceive" $ \o -> do
        sender_id_              <- o A..:?  "sender_id"
        message_count_          <- o A..:?  "message_count"
        commission_per_mille_   <- o A..:?  "commission_per_mille"
        commission_star_amount_ <- o A..:?  "commission_star_amount"
        pure $ StarTransactionTypePaidMessageReceive
          { sender_id              = sender_id_
          , message_count          = message_count_
          , commission_per_mille   = commission_per_mille_
          , commission_star_amount = commission_star_amount_
          }
      parseStarTransactionTypeSuggestedPostPaymentSend :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeSuggestedPostPaymentSend = A.withObject "StarTransactionTypeSuggestedPostPaymentSend" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ StarTransactionTypeSuggestedPostPaymentSend
          { chat_id = chat_id_
          }
      parseStarTransactionTypeSuggestedPostPaymentReceive :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeSuggestedPostPaymentReceive = A.withObject "StarTransactionTypeSuggestedPostPaymentReceive" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ StarTransactionTypeSuggestedPostPaymentReceive
          { user_id = user_id_
          }
      parseStarTransactionTypePremiumPurchase :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypePremiumPurchase = A.withObject "StarTransactionTypePremiumPurchase" $ \o -> do
        user_id_     <- o A..:?  "user_id"
        month_count_ <- o A..:?  "month_count"
        sticker_     <- o A..:?  "sticker"
        pure $ StarTransactionTypePremiumPurchase
          { user_id     = user_id_
          , month_count = month_count_
          , sticker     = sticker_
          }
      parseStarTransactionTypeBusinessBotTransferSend :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBusinessBotTransferSend = A.withObject "StarTransactionTypeBusinessBotTransferSend" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ StarTransactionTypeBusinessBotTransferSend
          { user_id = user_id_
          }
      parseStarTransactionTypeBusinessBotTransferReceive :: A.Value -> AT.Parser StarTransactionType
      parseStarTransactionTypeBusinessBotTransferReceive = A.withObject "StarTransactionTypeBusinessBotTransferReceive" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ StarTransactionTypeBusinessBotTransferReceive
          { user_id = user_id_
          }
  parseJSON _ = mempty

