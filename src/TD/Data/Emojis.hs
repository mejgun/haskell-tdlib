module TD.Data.Emojis
  (Emojis(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Emojis
  = Emojis -- ^ Represents a list of emoji
    { emojis :: Maybe [T.Text] -- ^ List of emojis
    }
  deriving (Eq)

instance Show Emojis where
  show Emojis
    { emojis = emojis_
    }
      = "Emojis"
        ++ I.cc
        [ "emojis" `I.p` emojis_
        ]

instance AT.FromJSON Emojis where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emojis" -> parseEmojis v
      _        -> mempty
    
    where
      parseEmojis :: A.Value -> AT.Parser Emojis
      parseEmojis = A.withObject "Emojis" $ \o -> do
        emojis_ <- o A..:?  "emojis"
        pure $ Emojis
          { emojis = emojis_
          }
  parseJSON _ = mempty

