module TD.Data.TonWalletOwnershipProof
  ( TonWalletOwnershipProof(..)    
  , defaultTonWalletOwnershipProof 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS

data TonWalletOwnershipProof
  = TonWalletOwnershipProof -- ^ Represents a proof of TON wallet ownership
    { public_key :: Maybe BS.ByteString -- ^ Public key of the wallet
    , timestamp  :: Maybe Int           -- ^ The current UNIX timestamp which was used to create the proof
    , signature  :: Maybe BS.ByteString -- ^ The signature proving the ownership
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletOwnershipProof where
  shortShow TonWalletOwnershipProof
    { public_key = public_key_
    , timestamp  = timestamp_
    , signature  = signature_
    }
      = "TonWalletOwnershipProof"
        ++ I.cc
        [ "public_key" `I.p` public_key_
        , "timestamp"  `I.p` timestamp_
        , "signature"  `I.p` signature_
        ]

instance AT.FromJSON TonWalletOwnershipProof where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletOwnershipProof" -> parseTonWalletOwnershipProof v
      _                         -> mempty
    
    where
      parseTonWalletOwnershipProof :: A.Value -> AT.Parser TonWalletOwnershipProof
      parseTonWalletOwnershipProof = A.withObject "TonWalletOwnershipProof" $ \o -> do
        public_key_ <- fmap I.readBytes <$> o A..:?  "public_key"
        timestamp_  <- o A..:?                       "timestamp"
        signature_  <- fmap I.readBytes <$> o A..:?  "signature"
        pure $ TonWalletOwnershipProof
          { public_key = public_key_
          , timestamp  = timestamp_
          , signature  = signature_
          }
  parseJSON _ = mempty

instance AT.ToJSON TonWalletOwnershipProof where
  toJSON TonWalletOwnershipProof
    { public_key = public_key_
    , timestamp  = timestamp_
    , signature  = signature_
    }
      = A.object
        [ "@type"      A..= AT.String "tonWalletOwnershipProof"
        , "public_key" A..= fmap I.writeBytes  public_key_
        , "timestamp"  A..= timestamp_
        , "signature"  A..= fmap I.writeBytes  signature_
        ]

defaultTonWalletOwnershipProof :: TonWalletOwnershipProof
defaultTonWalletOwnershipProof =
  TonWalletOwnershipProof
    { public_key = Nothing
    , timestamp  = Nothing
    , signature  = Nothing
    }

