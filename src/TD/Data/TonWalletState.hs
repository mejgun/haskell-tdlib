module TD.Data.TonWalletState
  (TonWalletState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

data TonWalletState
  = TonWalletState -- ^ Describes state of the wallet of the current user in the TON blockchain
    { address           :: Maybe T.Text        -- ^ Address of the wallet; may be empty if none
    , public_key        :: Maybe BS.ByteString -- ^ Public key of the wallet; may be empty if none
    , gram_amount       :: Maybe Int           -- ^ The total amount of owned TON Grams, in the smallest units of the cryptocurrency
    , is_being_created  :: Maybe Bool          -- ^ True, if the wallet is being created
    , is_backup_enabled :: Maybe Bool          -- ^ True, if backup for the wallet key is enabled
    , can_enable_backup :: Maybe Bool          -- ^ True, if the user can enable backup for the wallet key
    , can_export_phrase :: Maybe Bool          -- ^ True, if the wallet key can be exported using getTonWalletSecretPhrase
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletState where
  shortShow TonWalletState
    { address           = address_
    , public_key        = public_key_
    , gram_amount       = gram_amount_
    , is_being_created  = is_being_created_
    , is_backup_enabled = is_backup_enabled_
    , can_enable_backup = can_enable_backup_
    , can_export_phrase = can_export_phrase_
    }
      = "TonWalletState"
        ++ I.cc
        [ "address"           `I.p` address_
        , "public_key"        `I.p` public_key_
        , "gram_amount"       `I.p` gram_amount_
        , "is_being_created"  `I.p` is_being_created_
        , "is_backup_enabled" `I.p` is_backup_enabled_
        , "can_enable_backup" `I.p` can_enable_backup_
        , "can_export_phrase" `I.p` can_export_phrase_
        ]

instance AT.FromJSON TonWalletState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletState" -> parseTonWalletState v
      _                -> mempty
    
    where
      parseTonWalletState :: A.Value -> AT.Parser TonWalletState
      parseTonWalletState = A.withObject "TonWalletState" $ \o -> do
        address_           <- o A..:?                       "address"
        public_key_        <- fmap I.readBytes <$> o A..:?  "public_key"
        gram_amount_       <- o A..:?                       "gram_amount"
        is_being_created_  <- o A..:?                       "is_being_created"
        is_backup_enabled_ <- o A..:?                       "is_backup_enabled"
        can_enable_backup_ <- o A..:?                       "can_enable_backup"
        can_export_phrase_ <- o A..:?                       "can_export_phrase"
        pure $ TonWalletState
          { address           = address_
          , public_key        = public_key_
          , gram_amount       = gram_amount_
          , is_being_created  = is_being_created_
          , is_backup_enabled = is_backup_enabled_
          , can_enable_backup = can_enable_backup_
          , can_export_phrase = can_export_phrase_
          }
  parseJSON _ = mempty

