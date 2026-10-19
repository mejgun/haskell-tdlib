module TD.Data.TonWalletOwnershipProofChallenge
  (TonWalletOwnershipProofChallenge(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TonWalletOwnershipProofChallenge
  = TonWalletOwnershipProofChallenge -- ^ Represents a challenge for TON wallet ownership proof
    { payload :: Maybe T.Text -- ^ Payload of the challenge
    , domain  :: Maybe T.Text -- ^ Domain of the proof requester
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletOwnershipProofChallenge where
  shortShow TonWalletOwnershipProofChallenge
    { payload = payload_
    , domain  = domain_
    }
      = "TonWalletOwnershipProofChallenge"
        ++ I.cc
        [ "payload" `I.p` payload_
        , "domain"  `I.p` domain_
        ]

instance AT.FromJSON TonWalletOwnershipProofChallenge where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletOwnershipProofChallenge" -> parseTonWalletOwnershipProofChallenge v
      _                                  -> mempty
    
    where
      parseTonWalletOwnershipProofChallenge :: A.Value -> AT.Parser TonWalletOwnershipProofChallenge
      parseTonWalletOwnershipProofChallenge = A.withObject "TonWalletOwnershipProofChallenge" $ \o -> do
        payload_ <- o A..:?  "payload"
        domain_  <- o A..:?  "domain"
        pure $ TonWalletOwnershipProofChallenge
          { payload = payload_
          , domain  = domain_
          }
  parseJSON _ = mempty

