module TD.Query.GetUserTonWalletAddresses
  (GetUserTonWalletAddresses(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns TON wallet addresses of the specified users; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.UserTonWalletAddresses.UserTonWalletAddresses'
data GetUserTonWalletAddresses
  = GetUserTonWalletAddresses
    { user_ids :: Maybe [Int] -- ^ Identifiers of the users whose wallet addresses have to be returned. If a user has no TON wallet, it will be skipped in the result
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserTonWalletAddresses where
  shortShow
    GetUserTonWalletAddresses
      { user_ids = user_ids_
      }
        = "GetUserTonWalletAddresses"
          ++ I.cc
          [ "user_ids" `I.p` user_ids_
          ]

instance AT.ToJSON GetUserTonWalletAddresses where
  toJSON
    GetUserTonWalletAddresses
      { user_ids = user_ids_
      }
        = A.object
          [ "@type"    A..= AT.String "getUserTonWalletAddresses"
          , "user_ids" A..= user_ids_
          ]

