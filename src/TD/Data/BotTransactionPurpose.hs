module TD.Data.BotTransactionPurpose
  (BotTransactionPurpose(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaidMedia as PaidMedia
import qualified Data.Text as T
import qualified TD.Data.ProductInfo as ProductInfo
import qualified Data.ByteString as BS

-- | Describes purpose of a transaction with a bot
data BotTransactionPurpose
  = BotTransactionPurposePaidMedia -- ^ Paid media were bought
    { media   :: Maybe [PaidMedia.PaidMedia] -- ^ The bought media if the transaction wasn't refunded
    , payload :: Maybe T.Text                -- ^ Bot-provided payload; for bots only
    }
  | BotTransactionPurposeInvoicePayment -- ^ User bought a product from the bot
    { product_info    :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought product; may be null if not applicable
    , invoice_payload :: Maybe BS.ByteString           -- ^ Invoice payload; for bots only
    }
  | BotTransactionPurposeSubscription -- ^ User bought a subscription in a bot or a business account
    { period          :: Maybe Int                     -- ^ The number of seconds between consecutive Telegram Star debiting
    , product_info    :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought subscription; may be null if not applicable
    , invoice_payload :: Maybe BS.ByteString           -- ^ Invoice payload; for bots only
    }
  deriving (Eq, Show)

instance I.ShortShow BotTransactionPurpose where
  shortShow BotTransactionPurposePaidMedia
    { media   = media_
    , payload = payload_
    }
      = "BotTransactionPurposePaidMedia"
        ++ I.cc
        [ "media"   `I.p` media_
        , "payload" `I.p` payload_
        ]
  shortShow BotTransactionPurposeInvoicePayment
    { product_info    = product_info_
    , invoice_payload = invoice_payload_
    }
      = "BotTransactionPurposeInvoicePayment"
        ++ I.cc
        [ "product_info"    `I.p` product_info_
        , "invoice_payload" `I.p` invoice_payload_
        ]
  shortShow BotTransactionPurposeSubscription
    { period          = period_
    , product_info    = product_info_
    , invoice_payload = invoice_payload_
    }
      = "BotTransactionPurposeSubscription"
        ++ I.cc
        [ "period"          `I.p` period_
        , "product_info"    `I.p` product_info_
        , "invoice_payload" `I.p` invoice_payload_
        ]

instance AT.FromJSON BotTransactionPurpose where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "botTransactionPurposePaidMedia"      -> parseBotTransactionPurposePaidMedia v
      "botTransactionPurposeInvoicePayment" -> parseBotTransactionPurposeInvoicePayment v
      "botTransactionPurposeSubscription"   -> parseBotTransactionPurposeSubscription v
      _                                     -> mempty
    
    where
      parseBotTransactionPurposePaidMedia :: A.Value -> AT.Parser BotTransactionPurpose
      parseBotTransactionPurposePaidMedia = A.withObject "BotTransactionPurposePaidMedia" $ \o -> do
        media_   <- o A..:?  "media"
        payload_ <- o A..:?  "payload"
        pure $ BotTransactionPurposePaidMedia
          { media   = media_
          , payload = payload_
          }
      parseBotTransactionPurposeInvoicePayment :: A.Value -> AT.Parser BotTransactionPurpose
      parseBotTransactionPurposeInvoicePayment = A.withObject "BotTransactionPurposeInvoicePayment" $ \o -> do
        product_info_    <- o A..:?                       "product_info"
        invoice_payload_ <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        pure $ BotTransactionPurposeInvoicePayment
          { product_info    = product_info_
          , invoice_payload = invoice_payload_
          }
      parseBotTransactionPurposeSubscription :: A.Value -> AT.Parser BotTransactionPurpose
      parseBotTransactionPurposeSubscription = A.withObject "BotTransactionPurposeSubscription" $ \o -> do
        period_          <- o A..:?                       "period"
        product_info_    <- o A..:?                       "product_info"
        invoice_payload_ <- fmap I.readBytes <$> o A..:?  "invoice_payload"
        pure $ BotTransactionPurposeSubscription
          { period          = period_
          , product_info    = product_info_
          , invoice_payload = invoice_payload_
          }
  parseJSON _ = mempty

