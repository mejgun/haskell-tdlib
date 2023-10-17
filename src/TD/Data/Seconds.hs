module TD.Data.Seconds
  (Seconds(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Seconds
  = Seconds -- ^ Contains a value representing a number of seconds
    { seconds :: Maybe Double -- ^ Number of seconds
    }
  deriving (Eq, Show)

instance I.ShortShow Seconds where
  shortShow Seconds
    { seconds = seconds_
    }
      = "Seconds"
        ++ I.cc
        [ "seconds" `I.p` seconds_
        ]

instance AT.FromJSON Seconds where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "seconds" -> parseSeconds v
      _         -> mempty
    
    where
      parseSeconds :: A.Value -> AT.Parser Seconds
      parseSeconds = A.withObject "Seconds" $ \o -> do
        seconds_ <- o A..:?  "seconds"
        pure $ Seconds
          { seconds = seconds_
          }
  parseJSON _ = mempty

