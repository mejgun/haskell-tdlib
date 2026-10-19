module TD.Query.GetTonWalletOwnershipProofChallenge
  (GetTonWalletOwnershipProofChallenge(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a challenge which may be used to prove ownership of a TON wallet; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.TonWalletOwnershipProofChallenge.TonWalletOwnershipProofChallenge'
data GetTonWalletOwnershipProofChallenge
  = GetTonWalletOwnershipProofChallenge
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletOwnershipProofChallenge where
  shortShow
    GetTonWalletOwnershipProofChallenge
        = "GetTonWalletOwnershipProofChallenge"

instance AT.ToJSON GetTonWalletOwnershipProofChallenge where
  toJSON
    GetTonWalletOwnershipProofChallenge
        = A.object
          [ "@type" A..= AT.String "getTonWalletOwnershipProofChallenge"
          ]

