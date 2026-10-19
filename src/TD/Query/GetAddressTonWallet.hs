module TD.Query.GetAddressTonWallet
  (GetAddressTonWallet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a TON wallet with the given address; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.UserTonWalletAddress.UserTonWalletAddress'
data GetAddressTonWallet
  = GetAddressTonWallet
    { address :: Maybe T.Text -- ^ Address in the TON blockchain
    }
  deriving (Eq, Show)

instance I.ShortShow GetAddressTonWallet where
  shortShow
    GetAddressTonWallet
      { address = address_
      }
        = "GetAddressTonWallet"
          ++ I.cc
          [ "address" `I.p` address_
          ]

instance AT.ToJSON GetAddressTonWallet where
  toJSON
    GetAddressTonWallet
      { address = address_
      }
        = A.object
          [ "@type"   A..= AT.String "getAddressTonWallet"
          , "address" A..= address_
          ]

