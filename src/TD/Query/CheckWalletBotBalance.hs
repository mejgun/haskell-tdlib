module TD.Query.CheckWalletBotBalance
  (CheckWalletBotBalance(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about balance of the current user in the bot https://t.me/walt; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.WalletBotBalance.WalletBotBalance'
data CheckWalletBotBalance
  = CheckWalletBotBalance
  deriving (Eq, Show)

instance I.ShortShow CheckWalletBotBalance where
  shortShow
    CheckWalletBotBalance
        = "CheckWalletBotBalance"

instance AT.ToJSON CheckWalletBotBalance where
  toJSON
    CheckWalletBotBalance
        = A.object
          [ "@type" A..= AT.String "checkWalletBotBalance"
          ]

