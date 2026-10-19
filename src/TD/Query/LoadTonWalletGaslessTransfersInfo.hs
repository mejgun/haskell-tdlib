module TD.Query.LoadTonWalletGaslessTransfersInfo
  (LoadTonWalletGaslessTransfersInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads or reloads the current state of gasless transfers for the current user; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.Ok.Ok'
data LoadTonWalletGaslessTransfersInfo
  = LoadTonWalletGaslessTransfersInfo
  deriving (Eq, Show)

instance I.ShortShow LoadTonWalletGaslessTransfersInfo where
  shortShow
    LoadTonWalletGaslessTransfersInfo
        = "LoadTonWalletGaslessTransfersInfo"

instance AT.ToJSON LoadTonWalletGaslessTransfersInfo where
  toJSON
    LoadTonWalletGaslessTransfersInfo
        = A.object
          [ "@type" A..= AT.String "loadTonWalletGaslessTransfersInfo"
          ]

