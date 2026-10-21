module TD.Data.TonWalletSecretPhrase
  (TonWalletSecretPhrase(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TonWalletSecretPhrase
  = TonWalletSecretPhrase -- ^ Contains the secret phrase of a TON wallet
    { secret_phrase :: Maybe T.Text -- ^ The secret phrase as a space separated list of words
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletSecretPhrase where
  shortShow TonWalletSecretPhrase
    { secret_phrase = secret_phrase_
    }
      = "TonWalletSecretPhrase"
        ++ I.cc
        [ "secret_phrase" `I.p` secret_phrase_
        ]

instance AT.FromJSON TonWalletSecretPhrase where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletSecretPhrase" -> parseTonWalletSecretPhrase v
      _                       -> mempty
    
    where
      parseTonWalletSecretPhrase :: A.Value -> AT.Parser TonWalletSecretPhrase
      parseTonWalletSecretPhrase = A.withObject "TonWalletSecretPhrase" $ \o -> do
        secret_phrase_ <- o A..:?  "secret_phrase"
        pure $ TonWalletSecretPhrase
          { secret_phrase = secret_phrase_
          }
  parseJSON _ = mempty

