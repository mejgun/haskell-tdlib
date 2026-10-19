module TD.Query.LoadTonWalletState
  (LoadTonWalletState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads state of the TON wallet of the current user; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.Ok.Ok'
data LoadTonWalletState
  = LoadTonWalletState
  deriving (Eq, Show)

instance I.ShortShow LoadTonWalletState where
  shortShow
    LoadTonWalletState
        = "LoadTonWalletState"

instance AT.ToJSON LoadTonWalletState where
  toJSON
    LoadTonWalletState
        = A.object
          [ "@type" A..= AT.String "loadTonWalletState"
          ]

