module TD.Query.DisableTonWalletBackupWithProof
  (DisableTonWalletBackupWithProof(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonWalletOwnershipProof as TonWalletOwnershipProof

-- | Disables backup of the TON wallet of the user using proof of wallet ownership instead of the password. Works only if tonWalletState.is_backup_enabled is true. Returns 'TD.Data.Ok.Ok'
data DisableTonWalletBackupWithProof
  = DisableTonWalletBackupWithProof
    { proof :: Maybe TonWalletOwnershipProof.TonWalletOwnershipProof -- ^ Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
    }
  deriving (Eq, Show)

instance I.ShortShow DisableTonWalletBackupWithProof where
  shortShow
    DisableTonWalletBackupWithProof
      { proof = proof_
      }
        = "DisableTonWalletBackupWithProof"
          ++ I.cc
          [ "proof" `I.p` proof_
          ]

instance AT.ToJSON DisableTonWalletBackupWithProof where
  toJSON
    DisableTonWalletBackupWithProof
      { proof = proof_
      }
        = A.object
          [ "@type" A..= AT.String "disableTonWalletBackupWithProof"
          , "proof" A..= proof_
          ]

