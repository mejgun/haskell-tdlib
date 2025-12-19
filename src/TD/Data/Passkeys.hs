module TD.Data.Passkeys
  (Passkeys(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Passkey as Passkey

data Passkeys
  = Passkeys -- ^ Contains a list of passkeys
    { passkeys :: Maybe [Passkey.Passkey] -- ^ List of passkeys
    }
  deriving (Eq, Show)

instance I.ShortShow Passkeys where
  shortShow Passkeys
    { passkeys = passkeys_
    }
      = "Passkeys"
        ++ I.cc
        [ "passkeys" `I.p` passkeys_
        ]

instance AT.FromJSON Passkeys where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passkeys" -> parsePasskeys v
      _          -> mempty
    
    where
      parsePasskeys :: A.Value -> AT.Parser Passkeys
      parsePasskeys = A.withObject "Passkeys" $ \o -> do
        passkeys_ <- o A..:?  "passkeys"
        pure $ Passkeys
          { passkeys = passkeys_
          }
  parseJSON _ = mempty

