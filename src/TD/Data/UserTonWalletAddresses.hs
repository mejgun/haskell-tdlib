module TD.Data.UserTonWalletAddresses
  (UserTonWalletAddresses(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UserTonWalletAddress as UserTonWalletAddress

data UserTonWalletAddresses
  = UserTonWalletAddresses -- ^ Represents a list of TON wallet addresses of users
    { addresses :: Maybe [UserTonWalletAddress.UserTonWalletAddress] -- ^ A list of TON wallet addresses
    }
  deriving (Eq, Show)

instance I.ShortShow UserTonWalletAddresses where
  shortShow UserTonWalletAddresses
    { addresses = addresses_
    }
      = "UserTonWalletAddresses"
        ++ I.cc
        [ "addresses" `I.p` addresses_
        ]

instance AT.FromJSON UserTonWalletAddresses where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userTonWalletAddresses" -> parseUserTonWalletAddresses v
      _                        -> mempty
    
    where
      parseUserTonWalletAddresses :: A.Value -> AT.Parser UserTonWalletAddresses
      parseUserTonWalletAddresses = A.withObject "UserTonWalletAddresses" $ \o -> do
        addresses_ <- o A..:?  "addresses"
        pure $ UserTonWalletAddresses
          { addresses = addresses_
          }
  parseJSON _ = mempty

