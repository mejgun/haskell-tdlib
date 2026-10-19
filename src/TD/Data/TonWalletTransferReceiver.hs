module TD.Data.TonWalletTransferReceiver
  (TonWalletTransferReceiver(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents expected receiver of a TON wallet transfer
data TonWalletTransferReceiver
  = TonWalletTransferReceiverUser -- ^ The receiver is specified by its username
    { username :: Maybe T.Text -- ^ Username of the user. Use searchPublicChat to find the user, check that it is a regular user, and then use createUserTonWallet to get information about the user's TON wallet
    }
  | TonWalletTransferReceiverAddress -- ^ The receiver is specified by its address
    { address :: Maybe T.Text -- ^ Address of the receiver. Use getAddressTonWallet to get information about the user's TON wallet
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletTransferReceiver where
  shortShow TonWalletTransferReceiverUser
    { username = username_
    }
      = "TonWalletTransferReceiverUser"
        ++ I.cc
        [ "username" `I.p` username_
        ]
  shortShow TonWalletTransferReceiverAddress
    { address = address_
    }
      = "TonWalletTransferReceiverAddress"
        ++ I.cc
        [ "address" `I.p` address_
        ]

instance AT.FromJSON TonWalletTransferReceiver where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletTransferReceiverUser"    -> parseTonWalletTransferReceiverUser v
      "tonWalletTransferReceiverAddress" -> parseTonWalletTransferReceiverAddress v
      _                                  -> mempty
    
    where
      parseTonWalletTransferReceiverUser :: A.Value -> AT.Parser TonWalletTransferReceiver
      parseTonWalletTransferReceiverUser = A.withObject "TonWalletTransferReceiverUser" $ \o -> do
        username_ <- o A..:?  "username"
        pure $ TonWalletTransferReceiverUser
          { username = username_
          }
      parseTonWalletTransferReceiverAddress :: A.Value -> AT.Parser TonWalletTransferReceiver
      parseTonWalletTransferReceiverAddress = A.withObject "TonWalletTransferReceiverAddress" $ \o -> do
        address_ <- o A..:?  "address"
        pure $ TonWalletTransferReceiverAddress
          { address = address_
          }
  parseJSON _ = mempty

instance AT.ToJSON TonWalletTransferReceiver where
  toJSON TonWalletTransferReceiverUser
    { username = username_
    }
      = A.object
        [ "@type"    A..= AT.String "tonWalletTransferReceiverUser"
        , "username" A..= username_
        ]
  toJSON TonWalletTransferReceiverAddress
    { address = address_
    }
      = A.object
        [ "@type"   A..= AT.String "tonWalletTransferReceiverAddress"
        , "address" A..= address_
        ]

