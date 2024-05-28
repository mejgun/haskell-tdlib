module TD.Data.StarTransactionSource
  (StarTransactionSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProductInfo as ProductInfo

-- | Describes source or recipient of a transaction with Telegram stars
data StarTransactionSource
  = StarTransactionSourceTelegram -- ^ The transaction is a transaction with Telegram through a bot
  | StarTransactionSourceAppStore -- ^ The transaction is a transaction with App Store
  | StarTransactionSourceGooglePlay -- ^ The transaction is a transaction with Google Play
  | StarTransactionSourceFragment -- ^ The transaction is a transaction with Fragment
  | StarTransactionSourceUser -- ^ The transaction is a transaction with another user
    { user_id      :: Maybe Int                     -- ^ Identifier of the user
    , product_info :: Maybe ProductInfo.ProductInfo -- ^ Information about the bought product; may be null if none
    }
  | StarTransactionSourceUnsupported -- ^ The transaction is a transaction with unknown source
  deriving (Eq, Show)

instance I.ShortShow StarTransactionSource where
  shortShow StarTransactionSourceTelegram
      = "StarTransactionSourceTelegram"
  shortShow StarTransactionSourceAppStore
      = "StarTransactionSourceAppStore"
  shortShow StarTransactionSourceGooglePlay
      = "StarTransactionSourceGooglePlay"
  shortShow StarTransactionSourceFragment
      = "StarTransactionSourceFragment"
  shortShow StarTransactionSourceUser
    { user_id      = user_id_
    , product_info = product_info_
    }
      = "StarTransactionSourceUser"
        ++ I.cc
        [ "user_id"      `I.p` user_id_
        , "product_info" `I.p` product_info_
        ]
  shortShow StarTransactionSourceUnsupported
      = "StarTransactionSourceUnsupported"

instance AT.FromJSON StarTransactionSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starTransactionSourceTelegram"    -> pure StarTransactionSourceTelegram
      "starTransactionSourceAppStore"    -> pure StarTransactionSourceAppStore
      "starTransactionSourceGooglePlay"  -> pure StarTransactionSourceGooglePlay
      "starTransactionSourceFragment"    -> pure StarTransactionSourceFragment
      "starTransactionSourceUser"        -> parseStarTransactionSourceUser v
      "starTransactionSourceUnsupported" -> pure StarTransactionSourceUnsupported
      _                                  -> mempty
    
    where
      parseStarTransactionSourceUser :: A.Value -> AT.Parser StarTransactionSource
      parseStarTransactionSourceUser = A.withObject "StarTransactionSourceUser" $ \o -> do
        user_id_      <- o A..:?  "user_id"
        product_info_ <- o A..:?  "product_info"
        pure $ StarTransactionSourceUser
          { user_id      = user_id_
          , product_info = product_info_
          }
  parseJSON _ = mempty

