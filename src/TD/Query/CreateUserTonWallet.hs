module TD.Query.CreateUserTonWallet
  (CreateUserTonWallet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Creates a TON wallet for the specified regular user; can be used only if getOption("can_use_ton_wallet"). The current user must have positive TON wallet balance. Returns 'TD.Data.UserTonWalletAddress.UserTonWalletAddress'
data CreateUserTonWallet
  = CreateUserTonWallet
    { user_id :: Maybe Int -- ^ Identifier of the user
    }
  deriving (Eq, Show)

instance I.ShortShow CreateUserTonWallet where
  shortShow
    CreateUserTonWallet
      { user_id = user_id_
      }
        = "CreateUserTonWallet"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON CreateUserTonWallet where
  toJSON
    CreateUserTonWallet
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "createUserTonWallet"
          , "user_id" A..= user_id_
          ]

