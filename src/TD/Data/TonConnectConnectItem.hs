module TD.Data.TonConnectConnectItem
  (TonConnectConnectItem(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents a data item to share with a dApp
data TonConnectConnectItem
  = TonConnectConnectItemAddress -- ^ Address of the wallet
    { network :: Maybe T.Text -- ^ Stringified TON network global_id (e.g. "-239" for mainnet); may be empty
    }
  | TonConnectConnectItemProof -- ^ Proof of the wallet ownership
    { payload :: Maybe T.Text -- ^ Payload to be used for the proof (e.g. nonce + expiration timestamp)
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectConnectItem where
  shortShow TonConnectConnectItemAddress
    { network = network_
    }
      = "TonConnectConnectItemAddress"
        ++ I.cc
        [ "network" `I.p` network_
        ]
  shortShow TonConnectConnectItemProof
    { payload = payload_
    }
      = "TonConnectConnectItemProof"
        ++ I.cc
        [ "payload" `I.p` payload_
        ]

instance AT.FromJSON TonConnectConnectItem where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectConnectItemAddress" -> parseTonConnectConnectItemAddress v
      "tonConnectConnectItemProof"   -> parseTonConnectConnectItemProof v
      _                              -> mempty
    
    where
      parseTonConnectConnectItemAddress :: A.Value -> AT.Parser TonConnectConnectItem
      parseTonConnectConnectItemAddress = A.withObject "TonConnectConnectItemAddress" $ \o -> do
        network_ <- o A..:?  "network"
        pure $ TonConnectConnectItemAddress
          { network = network_
          }
      parseTonConnectConnectItemProof :: A.Value -> AT.Parser TonConnectConnectItem
      parseTonConnectConnectItemProof = A.withObject "TonConnectConnectItemProof" $ \o -> do
        payload_ <- o A..:?  "payload"
        pure $ TonConnectConnectItemProof
          { payload = payload_
          }
  parseJSON _ = mempty

instance AT.ToJSON TonConnectConnectItem where
  toJSON TonConnectConnectItemAddress
    { network = network_
    }
      = A.object
        [ "@type"   A..= AT.String "tonConnectConnectItemAddress"
        , "network" A..= network_
        ]
  toJSON TonConnectConnectItemProof
    { payload = payload_
    }
      = A.object
        [ "@type"   A..= AT.String "tonConnectConnectItemProof"
        , "payload" A..= payload_
        ]

