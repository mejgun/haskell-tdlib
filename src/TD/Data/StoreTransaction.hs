module TD.Data.StoreTransaction
  (StoreTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Describes an in-store transaction
data StoreTransaction
  = StoreTransactionAppStore -- ^ A purchase through App Store
    { receipt :: Maybe BS.ByteString -- ^ App Store receipt
    }
  | StoreTransactionGooglePlay -- ^ A purchase through Google Play
    { package_name     :: Maybe T.Text -- ^ Application package name
    , store_product_id :: Maybe T.Text -- ^ Identifier of the purchased store product
    , purchase_token   :: Maybe T.Text -- ^ Google Play purchase token
    }
  deriving (Eq, Show)

instance I.ShortShow StoreTransaction where
  shortShow StoreTransactionAppStore
    { receipt = receipt_
    }
      = "StoreTransactionAppStore"
        ++ I.cc
        [ "receipt" `I.p` receipt_
        ]
  shortShow StoreTransactionGooglePlay
    { package_name     = package_name_
    , store_product_id = store_product_id_
    , purchase_token   = purchase_token_
    }
      = "StoreTransactionGooglePlay"
        ++ I.cc
        [ "package_name"     `I.p` package_name_
        , "store_product_id" `I.p` store_product_id_
        , "purchase_token"   `I.p` purchase_token_
        ]

instance AT.FromJSON StoreTransaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storeTransactionAppStore"   -> parseStoreTransactionAppStore v
      "storeTransactionGooglePlay" -> parseStoreTransactionGooglePlay v
      _                            -> mempty
    
    where
      parseStoreTransactionAppStore :: A.Value -> AT.Parser StoreTransaction
      parseStoreTransactionAppStore = A.withObject "StoreTransactionAppStore" $ \o -> do
        receipt_ <- fmap I.readBytes <$> o A..:?  "receipt"
        pure $ StoreTransactionAppStore
          { receipt = receipt_
          }
      parseStoreTransactionGooglePlay :: A.Value -> AT.Parser StoreTransaction
      parseStoreTransactionGooglePlay = A.withObject "StoreTransactionGooglePlay" $ \o -> do
        package_name_     <- o A..:?  "package_name"
        store_product_id_ <- o A..:?  "store_product_id"
        purchase_token_   <- o A..:?  "purchase_token"
        pure $ StoreTransactionGooglePlay
          { package_name     = package_name_
          , store_product_id = store_product_id_
          , purchase_token   = purchase_token_
          }
  parseJSON _ = mempty

instance AT.ToJSON StoreTransaction where
  toJSON StoreTransactionAppStore
    { receipt = receipt_
    }
      = A.object
        [ "@type"   A..= AT.String "storeTransactionAppStore"
        , "receipt" A..= fmap I.writeBytes  receipt_
        ]
  toJSON StoreTransactionGooglePlay
    { package_name     = package_name_
    , store_product_id = store_product_id_
    , purchase_token   = purchase_token_
    }
      = A.object
        [ "@type"            A..= AT.String "storeTransactionGooglePlay"
        , "package_name"     A..= package_name_
        , "store_product_id" A..= store_product_id_
        , "purchase_token"   A..= purchase_token_
        ]

