module TD.Query.ReplaceTonWallet
  (ReplaceTonWallet(..)
  , defaultReplaceTonWallet
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Data.TonWalletOwnershipProof as TonWalletOwnershipProof

-- | Replaces the current TON wallet with another existing v6r2 wallet or changes private key of the current TON wallet; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.Ok.Ok'
data ReplaceTonWallet
  = ReplaceTonWallet
    { password          :: Maybe T.Text                                          -- ^ Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
    , anchor_public_key :: Maybe BS.ByteString                                   -- ^ Original public key of the new TON wallet
    , proof             :: Maybe TonWalletOwnershipProof.TonWalletOwnershipProof -- ^ Proof of ownership of the new private key of the TON wallet; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
    }
  deriving (Eq, Show)

instance I.ShortShow ReplaceTonWallet where
  shortShow
    ReplaceTonWallet
      { password          = password_
      , anchor_public_key = anchor_public_key_
      , proof             = proof_
      }
        = "ReplaceTonWallet"
          ++ I.cc
          [ "password"          `I.p` password_
          , "anchor_public_key" `I.p` anchor_public_key_
          , "proof"             `I.p` proof_
          ]

instance AT.ToJSON ReplaceTonWallet where
  toJSON
    ReplaceTonWallet
      { password          = password_
      , anchor_public_key = anchor_public_key_
      , proof             = proof_
      }
        = A.object
          [ "@type"             A..= AT.String "replaceTonWallet"
          , "password"          A..= password_
          , "anchor_public_key" A..= fmap I.writeBytes  anchor_public_key_
          , "proof"             A..= proof_
          ]

defaultReplaceTonWallet :: ReplaceTonWallet
defaultReplaceTonWallet =
  ReplaceTonWallet
    { password          = Nothing
    , anchor_public_key = Nothing
    , proof             = Nothing
    }

