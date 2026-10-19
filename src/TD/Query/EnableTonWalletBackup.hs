module TD.Query.EnableTonWalletBackup
  (EnableTonWalletBackup(..)
  , defaultEnableTonWalletBackup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonWalletOwnershipProof as TonWalletOwnershipProof

-- | Enables backup of the TON wallet of the user. Works only if tonWalletState.can_enable_backup is true. Returns 'TD.Data.Ok.Ok'
data EnableTonWalletBackup
  = EnableTonWalletBackup
    { secret_phrase :: Maybe T.Text                                          -- ^ The secret phrase of the user's TON wallet as a space separated list of words
    , proof         :: Maybe TonWalletOwnershipProof.TonWalletOwnershipProof -- ^ Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
    }
  deriving (Eq, Show)

instance I.ShortShow EnableTonWalletBackup where
  shortShow
    EnableTonWalletBackup
      { secret_phrase = secret_phrase_
      , proof         = proof_
      }
        = "EnableTonWalletBackup"
          ++ I.cc
          [ "secret_phrase" `I.p` secret_phrase_
          , "proof"         `I.p` proof_
          ]

instance AT.ToJSON EnableTonWalletBackup where
  toJSON
    EnableTonWalletBackup
      { secret_phrase = secret_phrase_
      , proof         = proof_
      }
        = A.object
          [ "@type"         A..= AT.String "enableTonWalletBackup"
          , "secret_phrase" A..= secret_phrase_
          , "proof"         A..= proof_
          ]

defaultEnableTonWalletBackup :: EnableTonWalletBackup
defaultEnableTonWalletBackup =
  EnableTonWalletBackup
    { secret_phrase = Nothing
    , proof         = Nothing
    }

